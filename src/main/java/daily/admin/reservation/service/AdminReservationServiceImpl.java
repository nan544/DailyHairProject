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
	public List<ReserveVo> resultList(ReserveVo rvo) {
		return adminReservationDao.resultList(rvo);
	}
	//날짜변경시 리스트출력
	@Override
	public List<ReserveVo> dateList(ReserveVo rvo) {
		return adminReservationDao.dateList(rvo);
	}
	
	//예약상태 수정하기
	@Override
	public int updateReservation(ReserveVo rvo) {
		return adminReservationDao.updateReservation(rvo);
	}
	
	//디자이너별 예약건수 확인하기
	@Override
	public int cofirmReservation(int des_num) {
		return adminReservationDao.cofirmReservation(des_num);
	}
	
	//검색조건  시술완료 리스트
	@Override
	public List<ReserveVo> resultSearchList(ReserveVo rvo) {
		return adminReservationDao.resultSearchList(rvo);
	}
	
	//시술완료리스트 검색시마다 레코드수 체크
	@Override
	public int searchListCnt(ReserveVo rvo) {
		return adminReservationDao.searchListCnt(rvo);
	}
	
	//예약취소리스트 출력
	@Override
	public List<ReserveVo> reservationCancleList(ReserveVo rvo) {
		return adminReservationDao.reservationCancleList(rvo);
	}

}
