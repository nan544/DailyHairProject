package daily.client.faq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.vo.DesignerVO;
import daily.admin.faq.vo.FaqVO;
import daily.client.faq.service.FaqService;
import daily.client.faq.vo.FaqVo;

@Controller
@RequestMapping(value = "/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	/***************************************
	 * 처음 접속 시 자주하는 질문 목록 표현
	 ***************************************/
	@RequestMapping(value = "/faqView", method = RequestMethod.GET)
	public ModelAndView faqList() {
		ModelAndView mav = new ModelAndView();
		
		// FaqList 객체를 Service에서 받아와 저장
		List<FaqVo> faqList = faqService.faqList();
		
		// EL문을 통해 FaqList를 받을 수 있도록 함.
		mav.addObject("faqList", faqList);
		mav.setViewName("client/faq/faqView");
		
		return mav;
	}
	
}
