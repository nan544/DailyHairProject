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
	
	//예약 리스트출력
	@Override
	public List<ReserveVo> reservationList() {
		return sqlSession.selectList("reservationList");
	}

	//예약 상세보기출력
	@Override
	public ReserveVo reservationDetail(int rest_num) {
		return sqlSession.selectOne("reservationDetail",rest_num);
	}
	
	//예약완료내역
	@Override
	public List<ReserveVo> resultList(String m_id) {
		return sqlSession.selectList("resultList",m_id);
	}
	
	//날짜변경시 리스트 출력
	@Override
	public List<ReserveVo> dateList(ReserveVo rvo) {
		return sqlSession.selectList("dateList",rvo);
	}

	//예약상태 수정하기
	@Override
	public int updateReservation(ReserveVo rvo) {
		return sqlSession.update("updateReservation",rvo);
	}

}
