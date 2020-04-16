package daily.client.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import daily.client.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	//마이바티스
	@Inject
	private SqlSession sql;

	//회원 가입
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

}
