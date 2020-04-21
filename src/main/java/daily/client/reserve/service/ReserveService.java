package daily.client.reserve.service;

import java.util.*;

import daily.client.reserve.vo.ReserveVo;

public interface ReserveService {
	// view에서 controller로 service에 있는 기능 호출 - dao를 통해 DB조작
	// ServiceImpl에서 사용될 기능들을 선언
	// Controller에서 호출되는 기능들
	
	public List<ReserveVo> selectTime(ReserveVo rvo);
	public int insertReservation(ReserveVo rvo);					//예약하기
	public int insertReservationDetail(int styling_num);			//예약상세테이블 인서트
}
