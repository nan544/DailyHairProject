package daily.admin.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.admin.member.service.AdminMemberService;
import daily.admin.reservation.service.AdminReservationService;
import daily.admin.style.service.StyleService;
import daily.admin.style.vo.StyleVO;
import daily.client.member.service.MemberService;
import daily.client.member.vo.MemberVO;
import daily.client.reserve.vo.ReserveVo;

@Controller
@RequestMapping(value = "/admin")
public class AdminReservationController {
		private Logger log = LoggerFactory.getLogger(AdminReservationController.class);
		
		@Autowired
		private AdminReservationService adminReservationService;
		
		@Autowired
		private DesignerService designerService;
		
		@Autowired
		private AdminMemberService AdminmemberService;
		
		@Autowired
		private StyleService styleService;
		
		//예약내역 리스트출력
		@RequestMapping(value = "/reservation/adminReservationList.do")
		public ModelAndView reservationList() {
			log.info("reservationList 호출완료");
			
			ModelAndView mav = new ModelAndView();
			
			
			List<ReserveVo> reservationList = adminReservationService.reservationList();
			List<DesignerVO> designerList = designerService.designerAjaxList(1);
			
			
			mav.addObject("desList",designerList);
			mav.addObject("restList",reservationList);
			mav.setViewName("admin/reservation/reservationList");
			
			
			return mav;
		}
		
		//예약상세보기 
		@RequestMapping(value = "/reservation/reservationDetailForm.do")
		public ModelAndView reservationDetailForm(int rest_num,String m_id) {
			log.info("reservationDeatilForm 호출");
			
			ModelAndView mav = new ModelAndView();
			MemberVO mvo = AdminmemberService.memberDetail(m_id);
			ReserveVo rvo = adminReservationService.reservationDetail(rest_num);
			List<StyleVO> svoList = styleService.stylingnameList(rest_num);
			List<ReserveVo> resultList = adminReservationService.resultList(m_id);
			
			if(rvo != null) {
			mav.addObject("resultList",resultList);
			mav.addObject("nameList",svoList);
			mav.addObject("reservation",rvo);
			mav.addObject("member",mvo);
			mav.setViewName("admin/reservation/pop/adminReservationDetail_pop");
			return mav;
			}
			
			return mav;
		}
		
		//날짜선택시마다 리스트 동적으로 변경
		@RequestMapping(value = "/reservation/dateList.do", method = RequestMethod.POST)
		@ResponseBody
		public List<ReserveVo> dateList(@ModelAttribute ReserveVo rvo){
			log.info("dateList 호출완료");
			
			return adminReservationService.dateList(rvo);
			
		}
}
