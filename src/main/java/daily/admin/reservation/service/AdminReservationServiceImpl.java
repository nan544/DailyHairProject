package daily.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.reservation.dao.AdminReservationDao;
import daily.client.reserve.vo.ReserveVo;

@Service
@Transactional
public class AdminReservationServiceImpl implements AdminReservationService {

	
	@Autowired
	AdminReservationDao adminReservationDao;
	
	//예약리스트 출력
	@Override
	public List<ReserveVo> reservationList() {
		return adminReservationDao.reservationList();
	}
	//예약  상세보기
	@Override
	public ReserveVo reservationDetail(int rest_num) {
		return adminReservationDao.reservationDetail(rest_num);
	}
	
	//예약 완료내역
	@Override
	public List<ReserveVo> resultList(String m_id) {
		return adminReservationDao.resultList(m_id);
	}
	//날짜변경시 리스트출력
	@Override
	public List<ReserveVo> dateList(ReserveVo rvo) {
		return adminReservationDao.dateList(rvo);
	}

}
