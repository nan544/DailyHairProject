package daily.client.reservedetail.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDetailDaoImpl implements ReserveDetailDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertReservationDetail(int styling_num) {
		return sqlSession.insert("insertReservationDetail",styling_num);
	}

	@Override
	public int confirmStyle(int styling_num) {
		return sqlSession.selectOne("confirmStyle",styling_num);
	}

}
