package daily.admin.board.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import daily.admin.board.vo.AdminHairStyleVO;

public interface AdminHairStyleService {
	public List<AdminHairStyleVO> hairStylelist(AdminHairStyleVO hsvo); //전체리스트출력
	public AdminHairStyleVO hairStyledetail(int hg_num); //상세보기
	public int boardListCnt(AdminHairStyleVO hsvo); // 리스트 수 출력
	public List<AdminHairStyleVO> categoryList(int hs_category); // 카테고리별 리스트 출력
	int hairStyleinsert(AdminHairStyleVO hsvo, HttpServletRequest request) throws IOException;//등록
	int hairStyleupdate(AdminHairStyleVO hsvo, HttpServletRequest request) throws IOException;//수정
	int hairStyledelete(AdminHairStyleVO hsvo, HttpServletRequest request) throws IOException;//삭제
}
