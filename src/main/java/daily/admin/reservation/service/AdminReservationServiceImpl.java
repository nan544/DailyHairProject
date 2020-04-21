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
	
	@Override
	public List<ReserveVo> reservationList() {
		return adminReservationDao.reservationList();
	}

}
