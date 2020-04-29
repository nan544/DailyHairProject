package daily.admin.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.qna.service.AdminQnaService;
import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;
import daily.common.util.FileUploadUtil;

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
		mav.setViewName("/admin/qna/adminQnaList");
		return mav;
	}

	@RequestMapping(value = "/qna/qnaDetail.do")
	public ModelAndView qnaDetail(@ModelAttribute QnaVO qvo) {
		log.info("QnA Detail 호출 메소드 실행");
		log.info("Detail >>> "+qvo.getQna_num());
		log.info("state >>> "+qvo.getQna_state());
		
		ModelAndView mav = new ModelAndView();
		QnaVO detail= qnaService.detail(qvo);
		
		mav.addObject("detail",detail);
		mav.setViewName("/admin/qna/adminQnaDetail");
		log.info("QnA Detail 호출 메소드 종료");
		return mav;
	}
	@RequestMapping(value = "/qna/qnaReplyInsert.do", method = RequestMethod.POST)
	public String qnaReplyInsert(@ModelAttribute replyVO repVO, HttpServletRequest request) throws IOException {
		log.info("QnA Reply Update 호출 메소드 실행");
		String url="";
		
		/*
		 * if(!repVO.getUploadFile().isEmpty()) { String rep_file =
		 * FileUploadUtil.fileUpload(repVO.getUploadFile(), request, "reply");
		 * repVO.setRep_file(rep_file); }
		 */
		int result = qnaService.insertReply(repVO);
		
		int updateState = qnaService.updateState(repVO.getQna_num());
		System.out.println("성공 1"+updateState);
		
		if(result==1) {
		url="/admin/qna/qnaList.do";
		log.info("QnA Reply Update 호출 메소드 종료");
		}else {
			url="/admin/qna/adminQnaDetail"+repVO.getQna_num();
			
		}
		return "redirect:"+url;
	}
}
