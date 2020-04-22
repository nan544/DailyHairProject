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
		System.out.println(list);
		return list;
	}

	@Override
	public AdminHairGoodsVO hairGoodsdetail(int hg_num) {

		return hairgoodsdao.hairGoodsdetail(hg_num);
	}

	@Override
	public int hairGoodsinsert(AdminHairGoodsVO hgvo) {
		int result = hairgoodsdao.hairGoodsinsert(hgvo);
		return result;
	}

	@Override
	public int hairGoodsdelete(int hg_num) {
		return hairgoodsdao.hairGoodsdelete(hg_num);
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
		/* 상세이미지 변경 */
		if (!hgvo.getUploadFile2().isEmpty()) {
			if (!hgvo.getHg_img1().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hgvo.getHg_img1(), request);
			}
			String hg_img1 = FileUploadUtil.fileUpload(hgvo.getUploadFile2(), request, "HairGoods"); // 새로운 파일 업로드
			hgvo.setHg_img1(hg_img1);
		} else { // 이미지가 없으면
			hgvo.setHg_img1("400"); // 400=쿼리에서 구분할 값
		}
		/* 이미지파일 수정  끝*/
		
		return hairgoodsdao.hairGoodsupdate(hgvo);
	}

}
