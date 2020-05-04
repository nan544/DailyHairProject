package daily.admin.member.service;

import java.util.List;

import daily.client.member.vo.MemberVO;

public interface AdminMemberService {
	
	public List<MemberVO> memberList(MemberVO mvo);
	public MemberVO memberDetailForm(String m_id);
	public int memberUpdate(MemberVO mvo);
	public int memberListCnt(MemberVO mvo);
}
