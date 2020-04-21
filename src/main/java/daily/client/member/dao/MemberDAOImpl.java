package daily.client.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import daily.client.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	//마이바티스
	@Inject
	private SqlSession sql;

	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		sql.insert("join", vo);
	}
	
	//아이디 중복체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("idChk", vo);
		return result;
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO lvo) {
		return (MemberVO)sql.selectOne("login", lvo);
	}
	
	//마이페이지 본인확인
	@Override
	public MemberVO mypage(MemberVO lvo) {
		return (MemberVO)sql.selectOne("mypage", lvo);
	}

	//마이페이지 회원정보 상세보기
	@Override
	public MemberVO memberMypage(int m_num) {
		return sql.selectOne("memberMypage", m_num);
	}
	
	//아이디 찾기
	@Override
	public int idFind(MemberVO vo) throws Exception {
		int result = sql.selectOne("idFind", vo);
		return result;
	}
}
