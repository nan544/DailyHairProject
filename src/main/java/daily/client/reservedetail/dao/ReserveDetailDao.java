package daily.client.reservedetail.dao;

public interface ReserveDetailDao {
	
	public int insertReservationDetail(int styling_num);			//예약상세테이블 인서트
	
	public int confirmStyle(int styling_num);	//예약중인 시술확인
}
