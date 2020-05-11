package daily.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.client.member.vo.MemberVO;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {
	
	@Autowired
	SqlSession sqlsession;
	
	//회원리스트
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		return sqlsession.selectList("memberList",mvo);
	}
	
	//회원상세보기
	@Override
	public MemberVO memberDetailForm(String m_id) {
		return sqlsession.selectOne("memberDetailForm",m_id);
	}
	
	//회원상태수정
	@Override
	public int memberUpdate(MemberVO mvo) {
		return sqlsession.update("memberUpdate",mvo);
	}

	//페이징용 카운트
	@Override
	public int memberListCnt(MemberVO mvo) {
		return sqlsession.selectOne("memberListCnt",mvo);
	}

}
