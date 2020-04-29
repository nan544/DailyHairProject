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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.client.member.service.MemberService;
import daily.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private MemberService service;
	
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
		
	//마이페이지 회원정보 수정창
	@RequestMapping(value = "/memberUpdate.do", method = RequestMethod.GET)
	public String memberUpdate() throws Exception {
		log.info("회원정보 수정창");
		
		return "mypage/memberUpdate";
	}
	
	//마이페이지 회원정보 수정 처리
	@RequestMapping(value = "/mymemberUpdate.do", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		log.info("회원정보 수정 성공");
		
		service.memberUpdateDo(vo);
		
		session.invalidate();
		
		return "client/main/main";
	}
	
	//계정 비활성화창
	@RequestMapping(value="/deactivation.do", method = RequestMethod.GET)
	public String getdeactivation() throws Exception{
		log.info("deactivation.do 호출 성공");
			
		return "mypage/deactivation";
	}
	
	
	//계정 비활성화 처리
	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberDelete(@ModelAttribute MemberVO mvo) {
		log.info("계정 비활성화 성공");

		int count = service.clientUpdate(mvo);
		
		if(count == 1) {
			return "0";
		}else{
			return "1";
		}
	}
	
	//예약 연황창
		@RequestMapping(value="/reserveState.do", method = RequestMethod.GET)
		public String reserveState() throws Exception{
			log.info("reserveState.do 호출 성공");
				
			return "mypage/reserveState";
		}

	
	
}
