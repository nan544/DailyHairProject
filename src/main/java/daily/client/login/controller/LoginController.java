package daily.client.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.client.member.service.MemberService;
import daily.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member/login")
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Inject
	private MemberService service;
	
	//로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String getLogin() throws Exception {
		logger.info("get login");
		
		return "member/login/login";
	}
	
	//로그인 처리 메소드
	@RequestMapping(value = "/login.do",method = RequestMethod.POST)
	public ModelAndView postLogin(@ModelAttribute("MemberVO")MemberVO lvo, HttpSession session,HttpServletRequest request) {
		logger.info("post login");
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = service.login(lvo);
		
		if(vo != null) {
			session.setAttribute("login", "사용자");
			mav.setViewName("client/main/main");
			return mav;
		}else{
			mav.addObject("msg","아이디와 비밀번호를 정확하게 입력 해주시길 바랍니다.");
			mav.setViewName("member/login/login");
			return mav;
		}
				
	}
	
	//로그아웃 처리 메소드
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		logger.info("logout.do 호출 성공");
		
		request.getSession().removeAttribute("login");
		session.removeAttribute("login");
		session.invalidate();
		
		return "client/main/main";
	}
	
	//아이디 찾기
	@RequestMapping(value = "/idFind.do", method = RequestMethod.GET)
	public String getIdFind() throws Exception {
		logger.info("get idFind");
		
		return "member/login/idFind";
	}
	
	//패스워드 찾기
	@RequestMapping(value = "/pwFind.do", method = RequestMethod.GET)
	public String getPwFind() throws Exception {
		logger.info("get pwFind");
		
		return "member/login/pwFind";
	}
	
	//패스워드 수정
	@RequestMapping(value = "/pwModify.do", method = RequestMethod.GET)
	public String getPwModify() throws Exception {
		logger.info("get pwModify");
		
		return "member/login/pwModify";
	}
	
}
