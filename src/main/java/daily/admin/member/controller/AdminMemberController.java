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
import daily.client.reserve.service.ReserveService;
import daily.client.reserve.vo.ReserveVo;
import daily.common.page.Paging;


@Controller
@RequestMapping(value = "/admin")
public class AdminMemberController {
	private Logger log = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	AdminMemberService adminMemberService;
	
	@Autowired
	ReserveService reserveService;
	
	//회원 리스트 출력하기
	@RequestMapping(value = "/member/memberList.do", method = RequestMethod.GET)
	public ModelAndView memberList(@ModelAttribute MemberVO mvo) {
		
		log.info("memberList 호출성공");
		ModelAndView mav = new ModelAndView();
		
		//페이지세팅 - ModelVO 는 CommonVO 를 상속하고있음
		Paging.setPage(mvo);
		
		//전체 레코드수 구하기
		int total = adminMemberService.memberListCnt(mvo);
		log.info(total+"<<레코드수");
	
		
		List<MemberVO> memberList = adminMemberService.memberList(mvo);
		
		
			mav.addObject("memberList", memberList);
			mav.addObject("data",mvo);
			mav.addObject("total",total);
			mav.setViewName("admin/member/memberList");
		
		
		return mav;
	}
	
	//회원 상세보기폼 출력
	@RequestMapping(value = "/member/memberDetailForm.do", method = RequestMethod.GET)
	public ModelAndView memberDetailForm(@RequestParam String m_id) {
		log.info("memberDetailForm 호출성공");
		ModelAndView mav = new ModelAndView();
		
		MemberVO detail = adminMemberService.memberDetail(m_id);
		ReserveVo history = null; //예약 리스트 뽑아오기
		
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
