package daily.client.reservedetail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.client.reservedetail.dao.ReserveDetailDao;

@Service
@Transactional
public class ReserveDetailServiceImpl implements ReserveDetailService {
	
	@Autowired
	ReserveDetailDao reserveDetailDao;
	
	@Override
	public int insertReservationDetail(int styling_num) {
		return reserveDetailDao.insertReservationDetail(styling_num);
	}

	@Override
	public int confirmStyle(int styling_num) {
		return reserveDetailDao.confirmStyle(styling_num);
	}
}
