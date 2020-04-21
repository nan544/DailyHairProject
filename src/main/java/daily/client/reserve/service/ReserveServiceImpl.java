package daily.client.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.client.reserve.dao.ReserveDao;
import daily.client.reserve.vo.ReserveVo;

@Service
@Transactional
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveDao reserveDao;
	
	@Override
	public List<ReserveVo> selectTime(ReserveVo rvo) {
		return reserveDao.selectTime(rvo);
	}
	
	
	//예약하기
	@Override
	public int insertReservation(ReserveVo rvo) {
		return reserveDao.insertReservation(rvo);
	}


	@Override
	public int insertReservationDetail(int styling_num) {
		return reserveDao.insertReservationDetail(styling_num);
	}

}
