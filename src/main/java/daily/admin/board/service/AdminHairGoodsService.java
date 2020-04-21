package daily.admin.board.service;

import java.util.List;

import daily.admin.board.vo.AdminHairGoodsVO;

public interface AdminHairGoodsService {
	public List<AdminHairGoodsVO> hairGoodslist(AdminHairGoodsVO hgvo); //전체리스트출력
	public AdminHairGoodsVO hairGoodsdetail(int hg_num); //상세보기
	public int hairGoodsupdate(AdminHairGoodsVO hgvo);//수정
	public int hairGoodsinsert(AdminHairGoodsVO hgvo);//등록
	public int hairGoodsdelete(int hg_num);//삭제
	public int boardListCnt(AdminHairGoodsVO hgvo);
	
	
}
