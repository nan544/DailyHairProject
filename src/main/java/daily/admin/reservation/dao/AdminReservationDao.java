package daily.admin.reservation.dao;

import java.util.List;

import daily.client.reserve.vo.ReserveVo;

public interface AdminReservationDao {
	public List<ReserveVo> reservationList();		//예약리스트 출력하기
	public ReserveVo reservationDetail(int rest_num); //예약상세보기
	public List<ReserveVo> resultList(String m_id); //예약완료내역
	public List<ReserveVo> dateList(ReserveVo rvo); //날짜선택시 리스트출력
}
