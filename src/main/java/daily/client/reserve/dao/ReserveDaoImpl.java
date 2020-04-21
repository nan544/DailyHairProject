package daily.client.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.client.reserve.vo.ReserveVo;

@Repository
public class ReserveDaoImpl implements ReserveDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReserveVo> selectTime(ReserveVo rvo) {
		return sqlSession.selectList("selectTime",rvo);
	}
	
	//예약하기
	@Override
	public int insertReservation(ReserveVo rvo) {
		return sqlSession.insert("insertReservation",rvo);
	}

	@Override
	public int insertReservationDetail(int styling_num) {
		return sqlSession.insert("insertReservationDetail",styling_num);
	}

}
