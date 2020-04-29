package daily.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.board.service.AdminHairGoodsService;
import daily.admin.board.vo.AdminHairGoodsVO;

@Controller
@RequestMapping(value = "/client")
public class HairGoodsController {
	
	@Autowired
	private AdminHairGoodsService HairGoodsService;
	
	// HairGoods List 출력
	@RequestMapping(value = "/hairGoodsList.do", method = RequestMethod.GET)
	public ModelAndView hairGoodsList(@ModelAttribute AdminHairGoodsVO hgvo) {
		ModelAndView mav = new ModelAndView();
		
		List<AdminHairGoodsVO> hairGoodsList = HairGoodsService.hairGoodslist(hgvo);
		
		mav.addObject("hairGoodsList", hairGoodsList);
		mav.addObject("data", hgvo);
		mav.setViewName("client/gallery/hairGoods");
		
		return mav;
	}
	
	// HairGoods 이미지 클릭 시 상세페이지
	@RequestMapping(value = "/hairGoodsDetail.do", method = RequestMethod.GET)
	public ModelAndView hairGoodsList(int hg_num){
		ModelAndView mav = new ModelAndView();
		
		AdminHairGoodsVO hgDetail = HairGoodsService.hairGoodsdetail(hg_num);

		mav.addObject("hgDetail", hgDetail);
		mav.setViewName("client/gallery/hairGoodsPopup");
		
		return mav;
	}
	
	
}
