package daily.client.member.service;

import daily.client.member.vo.MemberVO;

public interface MemberService {

	//회원 가입
	public void join(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO lvo);
	
	//마이페이지 본인확인
	public MemberVO mypage(MemberVO lvo);

	/*public MemberVO memberUpdate(int m_num);*/
	
	//회원정보 select
	public MemberVO memberSelect(String m_id);
	
	//아이디 찾기
	public int idFind(MemberVO vo) throws Exception;
	
	//게정 비활성화
	public int deleteMember(int m_num);

	public MemberVO memberDetail(int m_num);
	
}
