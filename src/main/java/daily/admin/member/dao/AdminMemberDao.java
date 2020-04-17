package daily.admin.member.dao;

import java.util.List;

import daily.client.member.vo.MemberVO;

public interface AdminMemberDao {
	public List<MemberVO> memberList(MemberVO mvo);
	public MemberVO memberDetail(int m_num);
	public int memberUpdate(MemberVO mvo);
	
}
