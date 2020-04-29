package daily.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.board.service.AdminHairStyleService;
import daily.admin.board.vo.AdminHairStyleVO;

@Controller
@RequestMapping(value = "/client")
public class HairStyleController {
	
	@Autowired
	private AdminHairStyleService HairStyleService;
	
	// HairStyle List(Woman) 출력
	@RequestMapping(value = "/hairStyleList.do", method = RequestMethod.GET)
	public ModelAndView hairGoodsList(@ModelAttribute AdminHairStyleVO hgvo) {
		ModelAndView mav = new ModelAndView();
		
		List<AdminHairStyleVO> hairGoodsList = HairStyleService.hairStylelist(hgvo);
		
		mav.addObject("hairGoodsList", hairGoodsList);
		mav.addObject("data", hgvo);
		mav.setViewName("client/gallery/hairStyleWoman");
		
		return mav;
	}
	
	// HairStyle List(Man) 출력
	
	
	
	
	
	// HairStyle List(Color) 출력
	
	
	
	
	
}
