package daily.client.member.dao;

import daily.client.member.vo.MemberVO;

public interface MemberDAO {

	//회원 가입
	public void join(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO lvo);
	
}
