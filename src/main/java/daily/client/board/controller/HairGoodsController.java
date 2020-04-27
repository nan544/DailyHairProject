package daily.client.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import daily.admin.board.service.AdminHairGoodsService;
import daily.admin.board.vo.AdminHairGoodsVO;

@Controller
@RequestMapping(value = "/client")
public class HairGoodsController {
	
	@Autowired
	private AdminHairGoodsService HairGoodsService;
	
	
	@RequestMapping(value = "/hairGoodsList.do", method = RequestMethod.GET)
	public String hairGoodsList(@ModelAttribute AdminHairGoodsVO hgvo, Model model){
		AdminHairGoodsVO detail = HairGoodsService.hairGoodsdetail(hgvo.getHg_num());

		model.addAttribute("detail", detail);
		
		return "client/gallery/hairGoods";
	}
}
