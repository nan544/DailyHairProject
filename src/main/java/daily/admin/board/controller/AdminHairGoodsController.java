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
import org.springframework.web.servlet.ModelAndView;

import daily.admin.board.service.AdminHairGoodsService;
import daily.admin.board.vo.AdminHairGoodsVO;
import daily.common.page.Paging;
import daily.common.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminHairGoodsController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AdminHairGoodsService HairGoodsService;

	@RequestMapping(value = "/board/HairGoodsList.do", method = RequestMethod.GET)
	public ModelAndView HairGoodsList(@ModelAttribute AdminHairGoodsVO hgvo) {
		ModelAndView mav = new ModelAndView();
		log.info("리스트 메소드 호출 성공");

		// 페이징 세팅
		Paging.setPage(hgvo);
		log.info(hgvo.getPage());

		// 전체 레코드 수 구현
		int total = HairGoodsService.boardListCnt(hgvo);

		System.out.println(total);
		List<AdminHairGoodsVO> hgList = HairGoodsService.hairGoodslist(hgvo);
		mav.addObject("hgList", hgList);
		mav.addObject("total", total);
		mav.addObject("data", hgvo);
		mav.setViewName("admin/board/HairGoodsList");
		return mav;

	}

	@RequestMapping(value = "/board/HGInsertForm.do")
	public String HairGoodsInsertForm() {
		log.info("입력 폼 호출 성공");

		return "admin/board/HairGoodsInsertForm";
	}

	@RequestMapping(value = "/board/HGInsert.do")
	@ResponseBody
	public int hairGoodsInsert(@ModelAttribute AdminHairGoodsVO hgvo, Model model, HttpServletRequest request)
			throws IOException {
		log.info("입력 로직 메소드 성공");

		String hg_thumb = FileUploadUtil.fileUpload(hgvo.getUploadFile(), request, "HairGoods");
		hgvo.setHg_thumb(hg_thumb);

		String hg_img1 = FileUploadUtil.fileUpload(hgvo.getUploadFile2(), request, "HairGoods");
		hgvo.setHg_img1(hg_img1);

		if (hgvo.getHg_img1() == null) {
			hgvo.setHg_img1("400");
		}

		System.out.println(hgvo.getHg_thumb());
		System.out.println(hgvo.getHg_img1());
		System.out.println(hgvo.getHg_title());

		int result = HairGoodsService.hairGoodsinsert(hgvo);

		return result;
	}

	@RequestMapping(value = "/board/HGDetail.do")
	public String detail(@ModelAttribute AdminHairGoodsVO hgvo, Model model) {
		log.info("디테일 호출 메소드 성공");

		log.info(hgvo.getHg_img1());

		AdminHairGoodsVO detail = HairGoodsService.hairGoodsdetail(hgvo.getHg_num());

		model.addAttribute("detail", detail);

		return "admin/board/HairGoodsDetail";
	}

	@RequestMapping(value = "/board/HGDelete.do")
	public String delete(@ModelAttribute AdminHairGoodsVO hgvo, Model model, HttpServletRequest request)
			throws IOException {
		log.info("글삭제 메소드 성공");
		String url = "";
		log.info(hgvo.getHg_num() + "");
		int delete = HairGoodsService.hairGoodsdelete(hgvo.getHg_num());

		FileUploadUtil.fileDelete(hgvo.getHg_thumb(), request);
		if (hgvo.getHg_img1() != null) {
			FileUploadUtil.fileDelete(hgvo.getHg_img1(), request);
		}
		log.info(request.getSession().getServletContext().getRealPath("/uploadStorage/"));

		if (delete == 1) {
			url = "HairGoodsList.do";
		} else {
			url = "admin/board/HairGoodsDetail?hg_num" + hgvo.getHg_num();
		}

		return "redirect:" + url;

	}

	// 게시글 수정
	@RequestMapping(value = "/board/HGUpdate.do")
	public String update(@ModelAttribute AdminHairGoodsVO hgvo, Model model, HttpServletRequest request)
			throws IOException {
		log.info("글수정 메소드 성공");

		/* 새로 입력(수정 및 추가)한 파일이 있으면 */
		if (hgvo.getUploadFile()!=null || hgvo.getUploadFile2()!=null) {
			/* 썸네일 이미지 변경 */
			if (hgvo.getUploadFile()!=null) { // 이미지가 있을때
				FileUploadUtil.fileDelete(hgvo.getHg_thumb(), request); // 기존 파일 삭제
				String hg_thumb = FileUploadUtil.fileUpload(hgvo.getUploadFile(), request, "HairGoods"); // 새로운파일 업로드
				hgvo.setHg_thumb(hg_thumb);
			} else { // 이미지가 없을때
				hgvo.setHg_thumb("400");// 400=쿼리에서 구분할 값
			}
			
			/* 상세이미지 변경 */
			if (hgvo.getUploadFile2()!=null) {

				if (hgvo.getHg_img1() != null) { // 이미지가 있으면 파일 삭제
					FileUploadUtil.fileDelete(hgvo.getHg_img1(), request);
				}
				String hg_img1 = FileUploadUtil.fileUpload(hgvo.getUploadFile2(), request, "HairGoods"); // 새로운 파일 업로드
				hgvo.setHg_img1(hg_img1);
			} else { // 이미지가 없으면
				hgvo.setHg_img1("400"); // 400=쿼리에서 구분할 값
			}
		} else { // 새로 입력(수정 및 추가)한 파일이 없으면
			hgvo.setHg_thumb("400");// 쿼리에서 구분할 값
			hgvo.setHg_img1("400"); // 쿼리에서 구분할 값
		}
		log.info("이미지 업로드 끝");

		int result = HairGoodsService.hairGoodsupdate(hgvo);
		String url = "";

		if (result == 1) {
			url = "HairGoodsList.do";
		} else {
			url = "admin/board/HairGoodsDetail";
		}

		return "redirect:" + url;

	}

}
