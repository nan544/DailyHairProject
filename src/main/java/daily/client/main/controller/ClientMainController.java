package daily.client.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.admin.style.service.StyleService;
import daily.admin.style.vo.StyleVO;

@Controller
@RequestMapping(value = "/client")
public class ClientMainController {
	
	@Autowired
	private DesignerService designerService;
	
	@Autowired
	StyleService styleService;
	
	// 메인페이지로 이동
	@RequestMapping(value = "/main.do")
	public String clientMainpage() {
		return "client/main/main";
	}
	
	// Shop소개로 이동 (디자이너 목록 노출)
	@RequestMapping(value = "/shopIntro.do", method = RequestMethod.GET)
	public ModelAndView clientShopIntro() {
		ModelAndView mav = new ModelAndView();
		
		List<DesignerVO> desList = designerService.designerList();
		
		mav.addObject("designerList", desList);
		mav.setViewName("client/shopIntro/shopIntro");
		return mav;
	}
	
	// Shop소개에서 디자이너 클릭 시 시술 목록 및 가격 띄우기
	@RequestMapping(value = "/designerSergery.do", method = RequestMethod.GET)
	public ModelAndView designerSergery(int des_num) {
		ModelAndView mav = new ModelAndView();
		
		List<StyleVO> styleList = styleService.stylingAjaxList(des_num);
		
		mav.addObject("styleList", styleList);
		mav.setViewName("client/shopIntro/designerSergery");
		
		return mav;
	}
	
	// 예약하기로 이동
	@RequestMapping(value = "/reservePage.do")
	public String clientReservePage() {
		return "client/reserve/reserveSelectPlace";
	}
	
	// (임시) Gallery - HairStyle로 이동
	@RequestMapping(value = "/hairStyle.do")
	public String clientHairStyle() {
		return "client/gallery/hairStyle";
	}
	
	// (임시) Gallery - HairGoods로 이동
	@RequestMapping(value = "/hairGoods.do")
	public String clientHairGoods() {
		return "client/gallery/hairGoods";
	}
	
	// 부가 서비스 - 코로나 예방정책 팝업
	@RequestMapping(value = "/corona.do")
	public String clientCorona() {
		return "client/main/corona";
	}
	
	// 이용약관 팝업
	@RequestMapping(value = "/clause1.do")
	public String clientClause1() {
		return "client/main/clause1";
	}
	
	// 개인정보 제공 동의약과 팝업
	@RequestMapping(value = "/clause2.do")
	public String clientClause2() {
		return "client/main/clause2";
	}
}
