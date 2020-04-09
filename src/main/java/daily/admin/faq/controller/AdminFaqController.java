package daily.admin.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import daily.admin.faq.service.AdminFaqService;
import daily.admin.faq.vo.FaqVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminFaqController {
	private Logger log = LoggerFactory.getLogger(AdminFaqController.class);
	
	@Autowired
	private AdminFaqService faqService;
	
	/***************************************
	 * 글목록 구현하기 
	 ***************************************/
	@RequestMapping(value = "/adminFaqList.do", method = RequestMethod.GET)
	public String faqList(Model model) {
		log.info("/adminfaqList.do 호출 성공");
		
		List<FaqVO> faqList = faqService.faqList();
		model.addAttribute("faqList", faqList);
	
		
		
		return "admin/faq/faqList";
	}
	/***************************************
	 * 글 쓰기 폼 출력
	 ***************************************/
	@RequestMapping(value = "/adminFaqWrite.do")
	public String faqWriteForm() {
		return "faq/writeFrom";
	}
	/***************************************
	 * 글 쓰기 구현
	 ***************************************/
	@RequestMapping(value = "/adminInsert.do", method = RequestMethod.POST)
	public String faqInsert(@ModelAttribute FaqVO fvo, Model model, HttpServletRequest request) {
		int result=0;
		String url="";
		
		result=faqService.faqInsert(fvo);
		
		if(result== 1) {
			url="/admin/faqList";
		}else {
			url="/admin/faqwriteForm";
		}
		return "redirect:"+url;
	}
	/***************************************
	 * 글 수정 폼 출력
	 ***************************************/
	
		@RequestMapping(value = "/adminUpdate.do", method = RequestMethod.POST)
		public String updateForm(@ModelAttribute FaqVO fvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("faq_num = " + fvo.getFaq_num());

		FaqVO updateData = new FaqVO();
		updateData = faqService.faqDetail(fvo);

		model.addAttribute("updateData", updateData);
		return "admin/faq/updateForm";
}
		
}