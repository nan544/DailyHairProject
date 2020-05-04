package daily.admin.board.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import daily.admin.board.vo.AdminHairGoodsVO;

public interface AdminHairGoodsService {
	
	public List<AdminHairGoodsVO> hairGoodslist(AdminHairGoodsVO hgvo); //전체리스트출력
	public AdminHairGoodsVO hairGoodsdetail(int hg_num); 				//상세보기
	public int hairGoodsupdate(AdminHairGoodsVO hgvo, HttpServletRequest request) throws IOException;//수정
	public int boardListCnt(AdminHairGoodsVO hgvo);
	int hairGoodsinsert(AdminHairGoodsVO hgvo, HttpServletRequest request) throws IOException;//등록
	int hairGoodsdelete(AdminHairGoodsVO hgvo, HttpServletRequest request) throws IOException;//삭제
	
	
}
