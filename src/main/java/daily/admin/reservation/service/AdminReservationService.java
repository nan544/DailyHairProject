package daily.admin.reservation.service;

import java.util.*;

import daily.client.reserve.vo.ReserveVo;
public interface AdminReservationService {
	public List<ReserveVo> reservationList();	//예약리스트 출력
	public ReserveVo reservationDetail(int rest_num); //예약상세보기
	public List<ReserveVo> resultList(ReserveVo rvo);	//시술 완료 리스트
	public List<ReserveVo> dateList(ReserveVo rvo); //날짜선택시 리스트출력
	public int updateReservation(ReserveVo rvo);	//예약상태 수정하기
	public int cofirmReservation(int des_num);		//디자이너별 예약건수 확인하기
	
	public List<ReserveVo> resultSearchList(ReserveVo rvo); //시술완료 검색 리스트 출력
	public int searchListCnt(ReserveVo rvo);		//검색조건마다 게시물 수 구하기
	public List<ReserveVo> reservationCancleList(ReserveVo rvo);	//예약취소 리스트 출력
}
