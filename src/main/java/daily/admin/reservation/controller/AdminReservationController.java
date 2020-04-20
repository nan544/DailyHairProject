package daily.admin.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.admin.reservation.service.AdminReservationService;
import daily.admin.style.service.StyleService;
import daily.admin.style.vo.StyleVO;
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
		private StyleService stylingService;
		
		//예약내역 리스트출력
		@RequestMapping(value = "/reservation/adminReservationList.do")
		public ModelAndView reservationList() {
			log.info("reservationList 호출완료");
			
			ModelAndView mav = new ModelAndView();
			
			
			List<ReserveVo> reservationList = adminReservationService.reservationList();
			List<DesignerVO> designerList = designerService.designerList();
			List<StyleVO> styleList = stylingService.stylingList();
			
			
			mav.addObject("desList",designerList);
			mav.addObject("restList",reservationList);
			//mav.addObject("styleList",styleList);
			mav.setViewName("admin/reservation/reservationList");
			
			
			return mav;
		}
}
