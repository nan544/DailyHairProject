package daily.admin.reservation.dao;

import java.util.List;

import daily.client.reserve.vo.ReserveVo;

public interface AdminReservationDao {
	public List<ReserveVo> reservationList();
}
