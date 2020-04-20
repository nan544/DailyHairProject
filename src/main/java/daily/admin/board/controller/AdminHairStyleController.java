package daily.admin.board.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import daily.admin.board.service.AdminHairStyleService;
import daily.admin.board.vo.AdminHairStyleVO;
import daily.common.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminHairStyleController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AdminHairStyleService HairStyleService;

	@RequestMapping(value = "/board/HairStyleList.do", method = RequestMethod.GET)
	public String HairStyleList(Model model) {
		log.info("리스트 메소드 호출 성공");

		List<AdminHairStyleVO> hsList = HairStyleService.hairStylelist();
		model.addAttribute("hsList", hsList);

		return "admin/board/HairStyleList";

	}

	@RequestMapping(value = "/board/HSInsertForm.do")
	public String HairStyleInsertForm() {
		log.info("입력 폼 호출 성공");

		return "admin/board/HairStyleInsertForm";
	}

	@RequestMapping(value = "/board/HSInsert.do")
	@ResponseBody
	public int hairGoodsInsert(@ModelAttribute AdminHairStyleVO hsvo, Model model, HttpServletRequest request)
			throws IOException {
		log.info("입력 로직 메소드 성공");

		String hs_thumb = FileUploadUtil.fileUpload(hsvo.getUploadFile(), request, "HairStyle");
		hsvo.setHs_thumb(hs_thumb);

		String hs_img1 = FileUploadUtil.fileUpload(hsvo.getUploadFile2(), request, "HairStyle");
		hsvo.setHs_img1(hs_img1);

		if (hsvo.getHs_img1() == null) {
			hsvo.setHs_img1("400");
		}

		int result = HairStyleService.hairStyleinsert(hsvo);
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/board/HSDetail.do")
	public String detail(@ModelAttribute AdminHairStyleVO hsvo, Model model) {
		log.info("디테일 호출 메소드 성공");

		AdminHairStyleVO detail = HairStyleService.hairStyledetail(hsvo.getHs_num());
		
		model.addAttribute("detail", detail);

		return "admin/board/HairStyleDetail";
	}

	@RequestMapping(value = "/board/HSDelete.do")
	public String delete(@ModelAttribute AdminHairStyleVO hsvo, Model model, HttpServletRequest request) throws IOException {
		log.info("글삭제 메소드 성공");

		String url = "";
		int delete = HairStyleService.hairStyledelete(hsvo.getHs_num());
		FileUploadUtil.fileDelete(hsvo.getHs_thumb(), request);
		if(!hsvo.getHs_img1().isEmpty()) {
		FileUploadUtil.fileDelete(hsvo.getHs_img1(), request);
		}
		if (delete == 1) {
			url = "HairStyleList.do";
		} else {
			url = "admin/board/HairStyleDetail?hs_num="+hsvo.getHs_num();
		}

		return "redirect:" + url;

	}

	@RequestMapping(value = "/board/HSUpdate.do")
	public String update(@ModelAttribute AdminHairStyleVO hsvo, Model model, HttpServletRequest request)
			throws IOException {
		log.info("글수정 메소드 성공");

		if (!hsvo.getUploadFile().isEmpty()) {
			FileUploadUtil.fileDelete(hsvo.getHs_thumb(), request);
		}
		if (!hsvo.getUploadFile2().isEmpty()) {
			FileUploadUtil.fileDelete(hsvo.getHs_img1(), request);
		}
		String url = "";

		String hs_thumb = FileUploadUtil.fileUpload(hsvo.getUploadFile(), request, "HairStyle");
		hsvo.setHs_thumb(hs_thumb);
		String hs_img1 = FileUploadUtil.fileUpload(hsvo.getUploadFile2(), request, "HairStyle");
		hsvo.setHs_img1(hs_img1);

		if (hsvo.getHs_thumb() == null) {
			hsvo.setHs_thumb("400");
		}
		if (hsvo.getHs_img1() == null) {
			hsvo.setHs_img1("400");
		}

		
		int result = HairStyleService.hairStyleupdate(hsvo);
		if (result == 1) {
			url = "HairStyleList.do";

		} else {
			url = "admin/board/HairStyleDetail?hs_num=" + hsvo.getHs_num();
		}

		return "redirect:" + url;
	}

}
