package daily.client.member.dao;

import daily.client.member.vo.MemberVO;

public interface MemberDAO {

	//회원 가입
	public void join(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	//이메일 중복체크
	public int mailChk(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO lvo);
	
	//마이페이지 본인확인
	public MemberVO mypage(MemberVO lvo);
	
	//회원정보 수정
	public void memberUpdateDo(MemberVO vo) throws Exception;
	
	
	
	
	
	//회원 비활성화
	public int clientUpdate(MemberVO mvo);
	
	//회원 예약(있을시에 비활성화 안되게 하기 위한)
	public int memberReservation(int m_num);
	
	//아이디 찾기
	public int idFind(MemberVO vo) throws Exception;
	
}
