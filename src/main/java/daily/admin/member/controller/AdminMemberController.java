package daily.admin.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.member.service.AdminMemberService;
import daily.client.member.vo.MemberVO;


@Controller
@RequestMapping(value = "/admin")
public class AdminMemberController {
	private Logger log = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	AdminMemberService adminMemberService;
	
	
	//회원 리스트 출력하기
	@RequestMapping(value = "/member/memberList.do", method = RequestMethod.GET)
	public ModelAndView memberList() {
		
		log.info("memberList 호출성공");
		ModelAndView mav = new ModelAndView();
		
		List<MemberVO> memberList = adminMemberService.memberList();
		
		
		if(memberList != null) {
			mav.addObject("memberList", memberList);
			mav.setViewName("admin/member/memberList");
		}
		
		
		return mav;
	}
	
	//회원 상세보기폼 출력
	@RequestMapping(value = "/member/memberDetailForm.do", method = RequestMethod.GET)
	public ModelAndView memberDetailForm(@RequestParam int m_num) {
		log.info("memberDetailForm 호출성공");
		ModelAndView mav = new ModelAndView();
		
		MemberVO detail = adminMemberService.memberDetail(m_num);
		
		if(detail != null) {
			mav.addObject("detail",detail);
			mav.setViewName("admin/member/pop/memberDetail_pop");
			
		}
		
		return mav;
	}
	
	//회원 수정하기
	@RequestMapping(value = "/member/memberUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberUpdate(@ModelAttribute MemberVO mvo) {
		log.info("memberUpdate 호출 성공");
		
		int result = adminMemberService.memberUpdate(mvo);
		
		if(result == 1) {
			return "1";
		}else {
			return "0";
		}
	}
}
