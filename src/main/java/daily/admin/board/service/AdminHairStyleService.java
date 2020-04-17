package daily.admin.board.service;

import java.util.List;

import daily.admin.board.vo.AdminHairStyleVO;

public interface AdminHairStyleService {
	public List<AdminHairStyleVO> hairStylelist(); //전체리스트출력
	public AdminHairStyleVO hairStyledetail(int hg_num); //상세보기
	public int hairStyleupdate(AdminHairStyleVO hsvo);//수정
	public int hairStyleinsert(AdminHairStyleVO hsvo);//등록
	public int hairStyledelete(int hs_num);//삭제
}
