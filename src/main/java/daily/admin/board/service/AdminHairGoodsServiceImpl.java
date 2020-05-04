package daily.admin.board.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.board.dao.AdminHairGoodsDAO;
import daily.admin.board.vo.AdminHairGoodsVO;
import daily.common.util.FileUploadUtil;

@Service
@Transactional
public class AdminHairGoodsServiceImpl implements AdminHairGoodsService {

	@Autowired
	private AdminHairGoodsDAO hairgoodsdao;

	@Override
	public List<AdminHairGoodsVO> hairGoodslist(AdminHairGoodsVO hgvo) {
		List<AdminHairGoodsVO> list = hairgoodsdao.hairGoodslist(hgvo);
		return list;
	}

	@Override
	public AdminHairGoodsVO hairGoodsdetail(int hg_num) {

		return hairgoodsdao.hairGoodsdetail(hg_num);
	}

	@Override
	public int hairGoodsinsert(AdminHairGoodsVO hgvo, HttpServletRequest request) throws IOException {

		String hg_thumb = FileUploadUtil.fileUpload(hgvo.getUploadFile(), request, "HairGoods");
		hgvo.setHg_thumb(hg_thumb);

		String hg_img1 = FileUploadUtil.fileUpload(hgvo.getUploadFile2(), request, "HairGoods");
		hgvo.setHg_img1(hg_img1);
		String hg_img2 = FileUploadUtil.fileUpload(hgvo.getUploadFile3(), request, "HairGoods");
		hgvo.setHg_img2(hg_img2);
		String hg_img3 = FileUploadUtil.fileUpload(hgvo.getUploadFile4(), request, "HairGoods");
		hgvo.setHg_img3(hg_img3);
		String hg_img4 = FileUploadUtil.fileUpload(hgvo.getUploadFile5(), request, "HairGoods");
		hgvo.setHg_img4(hg_img4);

		if (hgvo.getHg_img1() == null) {
			hgvo.setHg_img1("400");
		}
		if (hgvo.getHg_img2() == null) {
			hgvo.setHg_img2("400");
		}
		if (hgvo.getHg_img3() == null) {
			hgvo.setHg_img3("400");
		}
		if (hgvo.getHg_img4() == null) {
			hgvo.setHg_img4("400");
		}

		int result = hairgoodsdao.hairGoodsinsert(hgvo);
		return result;
	}

	@Override
	public int hairGoodsdelete(AdminHairGoodsVO hgvo, HttpServletRequest request) throws IOException {

		FileUploadUtil.fileDelete(hgvo.getHg_thumb(), request);
		if (hgvo.getHg_img1() != null) {
			FileUploadUtil.fileDelete(hgvo.getHg_img1(), request);
		}
		if (hgvo.getHg_img2() != null) {
			FileUploadUtil.fileDelete(hgvo.getHg_img2(), request);
		}
		if (hgvo.getHg_img3() != null) {
			FileUploadUtil.fileDelete(hgvo.getHg_img3(), request);
		}
		if (hgvo.getHg_img4() != null) {
			FileUploadUtil.fileDelete(hgvo.getHg_img4(), request);
		}
		return hairgoodsdao.hairGoodsdelete(hgvo.getHg_num());
	}

	@Override
	public int boardListCnt(AdminHairGoodsVO hgvo) {
		return hairgoodsdao.hairGoodsListCnt(hgvo);
	}

	@Override
	public int hairGoodsupdate(AdminHairGoodsVO hgvo, HttpServletRequest request) throws IOException {
		/* 이미지파일 수정 */
		/* 썸네일 이미지 변경 */
		if (!hgvo.getUploadFile().isEmpty()) { // 이미지가 있을때
			FileUploadUtil.fileDelete(hgvo.getHg_thumb(), request); // 기존 파일 삭제
			String hg_thumb = FileUploadUtil.fileUpload(hgvo.getUploadFile(), request, "HairGoods"); // 새로운파일 업로드
			hgvo.setHg_thumb(hg_thumb);
		} else { // 이미지가 없을때
			hgvo.setHg_thumb("400");// 400=쿼리에서 구분할 값
		}
		/* 상세이미지1 변경 */
		if (!hgvo.getUploadFile2().isEmpty()) {
			if (!hgvo.getHg_img1().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hgvo.getHg_img1(), request);
			}
			String hg_img1 = FileUploadUtil.fileUpload(hgvo.getUploadFile2(), request, "HairGoods"); // 새로운 파일 업로드
			hgvo.setHg_img1(hg_img1);
		} else { // 이미지가 없으면
			hgvo.setHg_img1("400"); // 400=쿼리에서 구분할 값
		}
		/* 상세이미지2 변경 */
		if (!hgvo.getUploadFile3().isEmpty()) {
			if (!hgvo.getHg_img2().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hgvo.getHg_img2(), request);
			}
			String hg_img2 = FileUploadUtil.fileUpload(hgvo.getUploadFile3(), request, "HairGoods"); // 새로운 파일 업로드
			hgvo.setHg_img2(hg_img2);
		} else { // 이미지가 없으면
			hgvo.setHg_img2("400"); // 400=쿼리에서 구분할 값
		}
		/* 상세이미지3 변경 */
		if (!hgvo.getUploadFile4().isEmpty()) {
			if (!hgvo.getHg_img3().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hgvo.getHg_img3(), request);
			}
			String hg_img3 = FileUploadUtil.fileUpload(hgvo.getUploadFile4(), request, "HairGoods"); // 새로운 파일 업로드
			hgvo.setHg_img3(hg_img3);
		} else { // 이미지가 없으면
			hgvo.setHg_img3("400"); // 400=쿼리에서 구분할 값
		}
		/* 상세이미지4 변경 */
		if (!hgvo.getUploadFile5().isEmpty()) {
			if (!hgvo.getHg_img4().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hgvo.getHg_img4(), request);
			}
			String hg_img4 = FileUploadUtil.fileUpload(hgvo.getUploadFile5(), request, "HairGoods"); // 새로운 파일 업로드
			hgvo.setHg_img4(hg_img4);
		} else { // 이미지가 없으면
			hgvo.setHg_img4("400"); // 400=쿼리에서 구분할 값
		}
		/* 이미지파일 수정 끝 */

		return hairgoodsdao.hairGoodsupdate(hgvo);
	}

}
