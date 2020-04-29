package daily.admin.qna.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.qna.service.AdminQnaService;
import daily.client.qna.vo.QnaVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminQnaController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminQnaService qnaService;

	@RequestMapping(value = "/qna/qnaList.do")
	public ModelAndView qnaList() {
		log.info("QnA List 호출 메소드 실행");
		ModelAndView mav = new ModelAndView();

	List<QnaVO> qnaList = qnaService.List();
	
	
	mav.addObject("qnaList", qnaList);
		mav.setViewName("/admin/qna/qnaList");
		return mav;
	}

	@RequestMapping(value = "/qna/qnaDetail.do")
	public ModelAndView qnaDetail(@ModelAttribute QnaVO qvo) {
		log.info("QnA Detail 호출 메소드 실행");
		log.info("Detail >>> "+qvo.getQna_num());
		
		ModelAndView mav = new ModelAndView();
		QnaVO detail= qnaService.detail(qvo);
		
		mav.addObject("detail",detail);
		mav.setViewName("/admin/qna/qnaDetail");
		
		return mav;
	}
}
