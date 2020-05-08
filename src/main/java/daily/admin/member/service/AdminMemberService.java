package daily.admin.member.service;

import java.util.List;

import daily.client.member.vo.MemberVO;

public interface AdminMemberService {
	
	public List<MemberVO> memberList(MemberVO mvo);	//회원리스트
	public MemberVO memberDetailForm(String m_id);	//회원상세보기
	public int memberUpdate(MemberVO mvo);			//회원상태수정
	public int memberListCnt(MemberVO mvo);			//페이징용 카운트
}
