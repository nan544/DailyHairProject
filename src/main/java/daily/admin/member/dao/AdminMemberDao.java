package daily.admin.member.dao;

import java.util.List;

import daily.client.member.vo.MemberVO;

public interface AdminMemberDao {
	public List<MemberVO> memberList(MemberVO mvo);
	public MemberVO memberDetail(String m_id);
	public int memberUpdate(MemberVO mvo);
	public int memberListCnt(MemberVO mvo);
}
