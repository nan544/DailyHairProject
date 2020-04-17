package daily.admin.member.service;

import java.util.List;

import daily.client.member.vo.MemberVO;

public interface AdminMemberService {
	
	public List<MemberVO> memberList(MemberVO mvo);
	public MemberVO memberDetail(int m_num);
	public int memberUpdate(MemberVO mvo);
}
