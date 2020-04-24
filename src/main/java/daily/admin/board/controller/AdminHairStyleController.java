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
import daily.common.page.Paging;
import daily.common.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminHairStyleController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AdminHairStyleService HairStyleService;

	// 리스트 출력
	@RequestMapping(value = "/board/HairStyleList.do", method = RequestMethod.GET)
	public String HairStyleList(@ModelAttribute AdminHairStyleVO hsvo, Model model) {
		log.info("리스트 메소드 호출 성공");

		// 페이지 세팅
		Paging.setPage(hsvo);

		// 전체레코드 수 구현
		int total = HairStyleService.boardListCnt(hsvo);

		List<AdminHairStyleVO> hsList = HairStyleService.hairStylelist(hsvo);
		model.addAttribute("hsList", hsList);
		model.addAttribute("data", hsvo);
		model.addAttribute("total", total);
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
	public String delete(@ModelAttribute AdminHairStyleVO hsvo, Model model, HttpServletRequest request)
			throws IOException {
		log.info("글삭제 메소드 성공");

		String url = "";
		int delete = HairStyleService.hairStyledelete(hsvo.getHs_num());
		FileUploadUtil.fileDelete(hsvo.getHs_thumb(), request);
		if (!hsvo.getHs_img1().isEmpty()) {
			FileUploadUtil.fileDelete(hsvo.getHs_img1(), request);
		}
		if (delete == 1) {
			url = "HairStyleList.do";
		} else {
			url = "admin/board/HairStyleDetail?hs_num=" + hsvo.getHs_num();
		}

		return "redirect:" + url;

	}

	@RequestMapping(value = "/board/HSUpdate.do")
	public String update(@ModelAttribute AdminHairStyleVO hsvo, Model model, HttpServletRequest request)
			throws IOException {
		log.info("글수정 메소드 성공");
		String url = "";

		/* 이미지파일 수정 */
		/* 썸네일 이미지 변경 */
		if (!hsvo.getUploadFile().isEmpty()) { // 이미지가 있을때
			FileUploadUtil.fileDelete(hsvo.getHs_thumb(), request); // 기존 파일 삭제
			String hg_thumb = FileUploadUtil.fileUpload(hsvo.getUploadFile(), request, "HairGoods"); // 새로운파일 업로드
			hsvo.setHs_thumb(hg_thumb);
		} else { // 이미지가 없을때
			hsvo.setHs_thumb("400");// 400=쿼리에서 구분할 값
		}
		/* 상세이미지 변경 */
		if (!hsvo.getUploadFile2().isEmpty()) {
			System.out.println("{"+hsvo.getHs_img1()+"]");
			if (!hsvo.getHs_img1().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hsvo.getHs_img1(), request);
			}
			String hs_img1 = FileUploadUtil.fileUpload(hsvo.getUploadFile2(), request, "HairGoods"); // 새로운 파일 업로드
			hsvo.setHs_img1(hs_img1);
		} else { // 이미지가 없으면
			hsvo.setHs_img1("400"); // 400=쿼리에서 구분할 값
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
