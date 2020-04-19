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

	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		return sqlsession.selectList("memberList",mvo);
	}

	@Override
	public MemberVO memberDetail(int m_num) {
		return sqlsession.selectOne("memberDetail",m_num);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return sqlsession.update("memberUpdate",mvo);
	}

	@Override
	public int memberListCnt(MemberVO mvo) {
		return sqlsession.selectOne("memberListCnt",mvo);
	}

}
