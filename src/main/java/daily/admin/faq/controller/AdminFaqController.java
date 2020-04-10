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
	@RequestMapping(value = "/adminFaqWriteForm.do")
	public String faqWriteForm() {
		log.info("writeForm");
		return "admin/faq/faqWriteForm";
	}

	/***************************************
	 * 글 쓰기 구현
	 ***************************************/
	@RequestMapping(value = "/adminFaqInsert.do", method = RequestMethod.POST)
	public String faqInsert(@ModelAttribute FaqVO fvo) throws Exception{
		log.info("/adminInsert.do 호출 성공");
		System.out.println("gd");
		int result = 0;
		String url = "";

		result = faqService.faqInsert(fvo);
		log.info("" + result);
		if (result == 1) {
			url = "adminFaqList.do";
		} else {
			url = "adminFaqWriteForm.do";
		}
		System.out.println(url);
		return "redirect:" + url;
	}

	/***************************************
	 * 글 수정 폼 출력
	 ***************************************/

	@RequestMapping(value = "/adminUpdateForm.do", method = RequestMethod.POST)
	public String updateForm(@ModelAttribute FaqVO fvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("faq_num=" + fvo.getFaq_num());

		FaqVO updateData = new FaqVO();
		updateData = faqService.faqDetail(fvo);

		model.addAttribute("updateData", updateData);
		return "admin/faq/faqUpdateForm";
	}
	
	@RequestMapping(value = "/adminFaqUpdate.do",method =RequestMethod.POST)
	public String faqUpdate(@ModelAttribute FaqVO fvo, Model model) {
		log.info("update 호출");
		
		int result = faqService.faqUpdate(fvo);
		System.out.println(result);
		String url = "";
		if(result==1) {
			url="adminFaqList.do";
		}else {
			url="adminUpdateForm.do"+fvo.getFaq_num();
		}
		return "redirect:"+url;
		
		
	}
	@RequestMapping(value = "adminDelete.do")
	public String faqDelete(@ModelAttribute FaqVO fvo, Model model) {
		log.info("delete 호출");
		
		int result = faqService.faqDelete(fvo.getFaq_num());
		String url = "";
		
		if(result==1) {
			url="adminFaqList.do";
		}else {
			url="adminUpdateForm.do"+fvo.getFaq_num();
		}
		return "redirect:"+url;
		
	
	}

}