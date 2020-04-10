package daily.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.login.service.AdminLoginService;
import daily.admin.login.vo.AdminLoginVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminLoginController {
	private Logger log = LoggerFactory.getLogger(AdminLoginController.class);
	
	@Autowired
	private AdminLoginService loginService;
	
	//로그인 폼 보여주기위한 메소드
	@RequestMapping(value = "/adminLoginForm.do" ,method = RequestMethod.GET)
	public String adminLoginForm() {
		log.info("adminLoginForm.do 호출 성공");
		
		return "admin/login/adminLoginForm";
	}
	
	//로그인 처리 메소드
	@RequestMapping(value = "/adminLogin.do",method = RequestMethod.POST)
	public ModelAndView adminLogin(@ModelAttribute("AdminLoginVO")AdminLoginVO lvo, HttpSession session,HttpServletRequest request) {
		log.info("adminLogin.do 호출성공");
		
		ModelAndView mav = new ModelAndView();
		
		int result = loginService.adminLogin(lvo.getAd_id(),lvo.getAd_pwd());
		if(result == 1) {
			session.setAttribute("login", "관리자");
			mav.setViewName("admin/main/adminMainpage");
		}
		
		return mav;
	}
	
	//로그아웃 처리 메소드
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		log.info("logout.do 호출 성공");
		
		request.getSession().removeAttribute("login");
		session.removeAttribute("login");
		session.invalidate();
		
		return "redirect:/admin/adminLoginForm.do";
	}
	
	//메인화면으로
	@RequestMapping(value = "/goMain.do", method = RequestMethod.GET)
	public String goMain() {
		return "admin/main/adminMainpage";
	}
}
