package daily.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.member.dao.AdminMemberDao;
import daily.client.member.vo.MemberVO;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {

	
	@Autowired
	AdminMemberDao adminMemberDao;

	@Override
	public List<MemberVO> memberList() {
		return adminMemberDao.memberList();
	}

	@Override
	public MemberVO memberDetail(int m_num) {
		return adminMemberDao.memberDetail(m_num);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return adminMemberDao.memberUpdate(mvo);
	}
}
