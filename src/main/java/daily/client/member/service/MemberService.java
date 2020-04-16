package daily.client.member.service;

import daily.client.member.vo.MemberVO;

public interface MemberService {

	//회원 가입
	public void join(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
}
