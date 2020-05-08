package daily.admin.member.dao;

import java.util.List;

import daily.client.member.vo.MemberVO;

public interface AdminMemberDao {
	public List<MemberVO> memberList(MemberVO mvo); //회원 리스트
	public MemberVO memberDetailForm(String m_id);	//회원 상세보기
	public int memberUpdate(MemberVO mvo);			//회원상태값 수정
	public int memberListCnt(MemberVO mvo);			//페이지용 카운트
}
