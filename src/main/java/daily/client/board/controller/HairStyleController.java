package daily.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.board.service.AdminHairStyleService;
import daily.admin.board.vo.AdminHairGoodsVO;
import daily.admin.board.vo.AdminHairStyleVO;

@Controller
@RequestMapping(value = "/client")
public class HairStyleController {
	
	@Autowired
	private AdminHairStyleService HairStyleService;
	
	// HairStyle List(Woman) 출력
	@RequestMapping(value = "/hairStyleList.do", method = RequestMethod.GET)
	public ModelAndView hairGoodsList() {
		ModelAndView mav = new ModelAndView();
		
		//카테고리 2번은 여성
		List<AdminHairStyleVO> hairStyleList = HairStyleService.categoryList(2);
		
		
		mav.addObject("hairStyleList", hairStyleList);
		mav.setViewName("client/gallery/hairStyleWoman");
		
		return mav;
	}
	
	// HairStyle List(Man) 출력
	@RequestMapping(value = "/manStyleList.do", method = RequestMethod.GET)
	public ModelAndView manHair() {
		ModelAndView mav = new ModelAndView();
		
		//카테고리 1번은 남성
		List<AdminHairStyleVO> manStyleList = HairStyleService.categoryList(1);
		
		
		mav.addObject("manStyleList", manStyleList);
		mav.setViewName("client/gallery/hairStyleMan");
		
		return mav;
	}
	
	
	
	
	// HairStyle List(Color) 출력
	@RequestMapping(value = "/colorSyleList.do", method = RequestMethod.GET)
	public ModelAndView colorHair() {
		ModelAndView mav = new ModelAndView();
		
		//카테고리 3번은 컬러
		List<AdminHairStyleVO> colorStyleList = HairStyleService.categoryList(3);
		
		
		mav.addObject("colorStyleList", colorStyleList);
		mav.setViewName("client/gallery/hairStyleColor");
		
		return mav;
	}
	
	
	// HairGoods 이미지 클릭 시 상세페이지
	@RequestMapping(value = "/hairStyleDetail.do", method = RequestMethod.GET)
	public ModelAndView hairStyleDetail(int hs_num){
		ModelAndView mav = new ModelAndView();
		
		AdminHairStyleVO hsDetail = HairStyleService.hairStyledetail(hs_num);

		mav.addObject("hsDetail", hsDetail);
		mav.setViewName("client/gallery/hairStylePopup");
		
		return mav;
	}
	
	
}
