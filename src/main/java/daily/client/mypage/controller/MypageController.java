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

import daily.admin.designer.vo.DesignerVO;
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
	
	/*마이페이지 회원정보창
	@RequestMapping(value="/memberUpdateView.do", method = RequestMethod.GET)
	public ModelAndView memberUpdateView(@RequestParam int m_num) {
		log.info("회원정보 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO member = service.memberUpdate(m_num);
		
		if(member != null) {
			mav.addObject("member", member);
			mav.setViewName("mypage/memberUpdate");
		}
		
		return mav;
	}*/
	
	@RequestMapping(value = "/memberSelect.do", method = RequestMethod.GET)
	public ModelAndView memberModify(HttpSession session) {
		log.info("modify.do 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member == null) {
			mav.setViewName("mypage/memberSelect");
			return mav;
		}
		
		MemberVO vo = service.memberSelect(member.getM_id());
		mav.addObject("member", vo);
		mav.setViewName("mypage/memberSelect");
		return mav;
	}
	
	//계정 비활성화
	@RequestMapping(value="/deactivation.do", method = RequestMethod.GET)
	public String getdeactivation() throws Exception{
		log.info("deactivation 호출 성공");
			
		return "mypage/deactivation";
	}
	
	//계정 비활성화 처리
	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberDelete(@ModelAttribute MemberVO mvo) {
		log.info("계정 비활성화 성공");

		String msg = "0";

		int result = service.deleteMember(mvo.getM_num());
		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}
	}
	
}
