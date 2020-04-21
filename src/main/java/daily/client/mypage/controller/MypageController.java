package daily.client.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import daily.client.member.service.MemberService;
import daily.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	MemberService service;
	
	//마이페이지
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String getMypage() throws Exception{
		log.info("mypage.do 호출");
		
		return "mypage/mypage";
	}
	
	//마이페이지 본인확인
	@RequestMapping(value = "/mypage.do",method = RequestMethod.POST)
	public ModelAndView postMypage(@ModelAttribute("MemberVO")MemberVO lvo, HttpSession session,HttpServletRequest request) {
		log.info("마이페이지 본인확인 처리 성공");
		
		ModelAndView mav = new ModelAndView();
			
		MemberVO vo = service.mypage(lvo);
			
		if(vo != null) {
			session.setAttribute("mypage", "사용자");
			mav.setViewName("mypage/mypage");
			return mav;
		}else{
			mav.addObject("msg","비밀번호를 정확하게 입력 해주시길 바랍니다.");
			mav.setViewName("mypage/mypage");
			return mav;
		}
					
	}
	
	//회원 상세보기폼 출력
	@RequestMapping(value = "/memberUpdate.do", method = RequestMethod.GET)
	public ModelAndView getMemberMypage(@RequestParam int m_num) {
		log.info("memberUpdate.do 호출");
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberUp = service.memberMypage(m_num);
		
		if(memberUp != null) {
			mav.addObject("member",memberUp);
			mav.setViewName("mypage/memberUpdate");
				
		}
			
		return mav;
	}
	
}
