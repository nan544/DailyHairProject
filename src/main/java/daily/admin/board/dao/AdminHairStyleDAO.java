package daily.admin.board.dao;

import java.util.List;

import daily.admin.board.vo.AdminHairStyleVO;

public interface AdminHairStyleDAO {
	public List<AdminHairStyleVO> hairStylelist(AdminHairStyleVO hsvo); //전체리스트출력
	public AdminHairStyleVO hairStyledetail(int hs_num); //상세보기
	public int hairStyleupdate(AdminHairStyleVO hsvo);//수정
	public int hairStyleinsert(AdminHairStyleVO hsvo);//등록
	public int hairStyledelete(int hs_num);//삭제
	public int hairStyleCnt(AdminHairStyleVO hsvo);
	
}
