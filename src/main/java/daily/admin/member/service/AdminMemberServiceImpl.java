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
	public List<MemberVO> memberList(MemberVO mvo) {
		
		//정렬에 대한 기본값 설정하기
		if(mvo.getOrder_by()==null) mvo.setOrder_by("m_num");
		if(mvo.getOrder_sc()==null) mvo.setOrder_sc("DESC");

		return adminMemberDao.memberList(mvo);
		
	}

	@Override
	public MemberVO memberDetail(String m_id) {
		return adminMemberDao.memberDetail(m_id);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return adminMemberDao.memberUpdate(mvo);
	}

	@Override
	public int memberListCnt(MemberVO mvo) {
		return adminMemberDao.memberListCnt(mvo);
	}
}
