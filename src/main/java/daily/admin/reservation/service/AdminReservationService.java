package daily.admin.reservation.service;

import java.util.*;

import daily.client.reserve.vo.ReserveVo;
public interface AdminReservationService {
	public List<ReserveVo> reservationList();	//예약리스트 출력
	public ReserveVo reservationDetail(int rest_num); //예약상세보기
	public List<ReserveVo> resultList(String m_id);
	public List<ReserveVo> dateList(ReserveVo rvo); //날짜선택시 리스트출력
	public int updateReservation(ReserveVo rvo);	//예약상태 수정하기
}
