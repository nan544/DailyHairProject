package daily.client.qna.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.util.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.vo.DesignerVO;
import daily.admin.qna.vo.replyVO;
import daily.client.member.vo.MemberVO;
import daily.client.qna.service.QnaService;
import daily.client.qna.vo.QnaVO;
import daily.common.util.FileUploadUtil;


@Controller
@RequestMapping(value = "/client")
public class QnaController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private QnaService qnaService;
	
	
	
	//내가 질문한 게시글리스트 불러오기
	@RequestMapping(value = "/qna/qnaList.do" , method = RequestMethod.GET)
	public String qnaList(Model model , HttpSession session , HttpServletRequest request) {
		
		logger.info("qnaList 호출성공");
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("login");
		
		
		if(mvo == null) {
			model.addAttribute("msg","로그인이 필요합니다");
			return "member/login/login";
		}else {
			List<QnaVO> qnaList = qnaService.qnaList(mvo);
			model.addAttribute("qnaList", qnaList);
			return "client/qna/qnaList";
		}
	}
	
	//문의 글 작성하기 폼
	@RequestMapping(value = "/qna/qnaWriteForm.do")
	public String qnaWriteForm() {
		
		logger.info("qnaWriteForm 호출");
		
		return "client/qna/qnaWriteForm";
	}
	
	
		//문의글 등록하기
		@RequestMapping(value = "/qna/qnaInsert.do" , method = RequestMethod.POST)
		@ResponseBody
		public String qnaWrite(@ModelAttribute QnaVO qvo , HttpServletRequest request , Model model) throws IOException {
			
			logger.info("qnaWrite 호출 성공");
			
			
			if(qvo.getFile()!=null) {
				String qna_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "qna");
				qvo.setQna_file(qna_file);
			}
			
			int result = qnaService.insertQna(qvo);
			
			if(result == 1) {
				return "1";
			}else {
				return "0";
			}
		}
		
		//문의글 상세보기
		@RequestMapping(value = "/qna/qnaDetail.do")
		public ModelAndView qnaDetail(@ModelAttribute QnaVO qvo) {
			logger.info("qnaDetail 호출");
			
			ModelAndView mav = new ModelAndView();
			QnaVO detail = qnaService.qnaDetail(qvo);
			
			// 답변 존재 시 답변 글 띄우는 메소드
			if (detail.getQna_state() == 1) {
				replyVO reply = qnaService.selectReply(detail.getQna_num());
				mav.addObject("reply", reply);
			}
			
			mav.addObject("detail", detail);
			mav.setViewName("client/qna/qnaDetail");
			
			return mav;
					
		}
		
		//문의글 수정하기 폼
		@RequestMapping(value = "/qna/qnaUpdateForm.do")
		public String qnaUpdateForm(QnaVO qvo , Model model) {
			
			logger.info("qnaUpdateForm 호출");
			
			QnaVO detail = qnaService.qnaDetail(qvo);
			model.addAttribute("detail",detail);
			
			return "client/qna/qnaUpdateForm";
		}
		
		//문의글 수정하기
		@RequestMapping(value = "/qna/qnaUpdate.do", method = RequestMethod.POST)
		@ResponseBody
		public int qnaUpdate(QnaVO qvo ,HttpServletRequest request ) throws IOException {
			logger.info("qnaUpdate 출력");
			
			//수정할떄 파일이 변경되면 기존 파일은 삭제되고 새로운파일로 등록됨
			if(!qvo.getFile().isEmpty()) {
				if(!qvo.getQna_file().isEmpty()) {
					FileUploadUtil.fileDelete(qvo.getQna_file(), request);
				}
				String qna_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "qna");
				qvo.setQna_file(qna_file);
			}
			//파일선택을 안했을시에는 전에있던 파일명으로 파일이름을 설정한다.
			//DB에는 파일이름이 스트링으로 들어감 다운로드시 파일이름으로 접근해서 다운로드받으므로 
			//파일 수정없이 내용만수정해도 전에 파일이름이 들어가기때문에 다운로드가능
			if(qvo.getFile().isEmpty()) {
				qvo.setQna_file(qvo.getQna_file());
			}
			
			int result = qnaService.qnaUpdate(qvo);
			
			if(result == 1) {
				return 1;
			}else {
				return 0;
			}
			
		}
		
		//첨부파일 다운로드
		  @RequestMapping(value = "/qna/download.do") 
		  public void fileDown(QnaVO qvo, HttpServletResponse response, HttpServletRequest request) throws IOException {
			 logger.info("fileDown 호출성공");
			  
		 QnaVO down = qnaService.qnaDetail(qvo);
		 String downRoot = down.getQna_file(); 
		 
		 byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(request.getSession().getServletContext().getRealPath("/uploadStorage/qna/")+downRoot));
		 
		 
		 response.setContentType("application/octet-stream");
		 response.setContentLength(fileByte.length);
		 response.setHeader("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(downRoot,"UTF-8")+"\";");
		 response.getOutputStream().write(fileByte);
		 response.getOutputStream().flush();
		 response.getOutputStream().close();
		 }
 }
