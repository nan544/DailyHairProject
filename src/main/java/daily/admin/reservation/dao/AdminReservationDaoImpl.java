package daily.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.client.reserve.vo.ReserveVo;

@Repository
public class AdminReservationDaoImpl implements AdminReservationDao {

	
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<ReserveVo> reservationList() {
		return sqlSession.selectList("reservationList");
	}

}
