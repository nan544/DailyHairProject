package daily.admin.designer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.common.util.FileUploadUtil;

import org.apache.commons.fileupload.FileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/admin")
public class DesignerController {
	private Logger log = LoggerFactory.getLogger(DesignerController.class);

	@Autowired
	private DesignerService designerService;

	// 디자이너 리스트 출력
	@RequestMapping(value = "/designer/designerList.do", method = RequestMethod.GET)
	public ModelAndView designerList() {

		log.info("designerList.do 호출완료");

		ModelAndView mav = new ModelAndView();

		List<DesignerVO> desList = designerService.designerList();

		mav.addObject("designerList", desList);
		mav.setViewName("admin/designer/designerList");
		return mav;
	}
	
	//디자이너 리스트 출력(선택시 변경)
	@RequestMapping(value = "/designer/desAjaxList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<DesignerVO> designerAjaxList(int des_state){
		
		log.info("designerAjaxList 호출완료");
		return designerService.designerAjaxList(des_state);
		
	}

	// 디자이너 등록폼
	@RequestMapping(value = "/designer/designerJoinForm.do", method = RequestMethod.GET)
	public String designerInsertForm() {
		log.info("designerInsertForm 호출 성공");
		return "admin/designer/pop/designerJoin_pop";
	}

	// 디자이너 등록하기
	@RequestMapping(value = "/designer/designerJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerInsert(@ModelAttribute DesignerVO dvo ,HttpServletRequest request) throws IOException {
		log.info("designerInsert 호출 성공");

		String msg = "0";
		
		if(dvo.getFile()!=null) {
			String des_file = FileUploadUtil.fileUpload(dvo.getFile(), request, "designer");
			dvo.setDes_file(des_file);
		}
		

		int result = designerService.insertDesigner(dvo);
		
		if (result == 1) {
			msg = "1";
		} else {
			msg = "0";
		}
		return msg;
	}

	// 디자이너 정보 수정폼
	@RequestMapping(value = "/designer/designerUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView designerUpdateForm(@ModelAttribute DesignerVO dvo,HttpServletRequest request) throws IOException {
		log.info("designerupdateForm 호출 성공" + dvo.getDes_num());

		ModelAndView mav = new ModelAndView();

		DesignerVO updateDesigner = new DesignerVO();
		updateDesigner = designerService.designerDetail(dvo.getDes_num());
		
		if (updateDesigner != null) {
			mav.addObject("des", updateDesigner);
			mav.setViewName("admin/designer/pop/designerModify_pop");
			return mav;
		} else {
			mav.addObject("msg", "에러에염");
			mav.setViewName("admin/designer/designerList");
			return mav;
		}
	}

	// 디자이너 정보 수정하기
	@RequestMapping(value = "/designer/designerUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerUpdate(@ModelAttribute DesignerVO dvo ,HttpServletRequest request) throws IOException {
		log.info("designerUpdate 호출 성공");

		String msg = "0";

		
	/*	if(dvo.getFile()!=null) {
			String des_file = FileUploadUtil.fileUpload(dvo.getFile(), request, "designer");
			dvo.setDes_file(des_file); 
		}   */
		
		//수정할떄 파일이 변경되면 기존 파일은 삭제되고 새로운파일로 등록됨
		if(!dvo.getFile().isEmpty()) {
			if(!dvo.getDes_file().isEmpty()) {
				FileUploadUtil.fileDelete(dvo.getDes_file(), request);
			}
			String des_file = FileUploadUtil.fileUpload(dvo.getFile(), request, "designer");
			dvo.setDes_file(des_file);
		}else {
			dvo.setDes_file("");
		}
		
		
		int result = designerService.updateDesigner(dvo);
		
		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}

	}

	// 디자이너 비활성화하기
	@RequestMapping(value = "/designer/designerDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerDelete(@ModelAttribute DesignerVO dvo) {

		String msg = "0";

		int result = designerService.deleteDesigner(dvo.getDes_num());
		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}
	}

	// 디자이너 활성화 하기
	@RequestMapping(value = "/designer/designerOpen.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerOpen(@ModelAttribute DesignerVO dvo) {

		String msg = "0";

		int result = designerService.openDesigner(dvo.getDes_num());

		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}
	}
	
	//첨부파일 다운로드
	  @RequestMapping(value = "/designer/download.do") 
	  public void fileDown(@ModelAttribute DesignerVO dvo, HttpServletResponse response, HttpServletRequest request) throws IOException {
		  log.info("fileDown 호출성공");
		  
	 DesignerVO down = designerService.designerDetail(dvo.getDes_num());
	 String downRoot = down.getDes_file(); 
	 System.out.println(downRoot); 
	 
	 byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(request.getSession().getServletContext().getRealPath("/uploadStorage/designer/")+downRoot));

	 
	 response.setContentType("application/octet-stream");
	 response.setContentLength(fileByte.length);
	 response.setHeader("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(downRoot,"UTF-8")+"\";");
	 response.getOutputStream().write(fileByte);
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 }
	 
}
