package daily.client.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import daily.client.member.dao.MemberDAO;
import daily.client.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;

	//회원 가입
	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);
	}

	//아이디 중복체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
}
