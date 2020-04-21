package daily.client.reserve.dao;

import java.util.List;

import daily.client.reserve.vo.ReserveVo;

public interface ReserveDao {
	// view에서 controller로 service에 있는 기능 호출 - dao를 통해 DB조작
	// DaoImpl에서 사용될 기능들을 선언
	// DB에 접근하여 데이터를 조작하는 역할
	
	public List<ReserveVo> selectTime(ReserveVo rvo);
}
