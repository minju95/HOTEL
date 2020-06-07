package hotel.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import hotel.common.dao.AbstractDAO;

@Repository("reservationDAO")
public class ReservationDao extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRooms(Map<String, Object> map)
	throws Exception {
		return (List<Map<String, Object>>)selectList("reservation.selectRooms", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchRooms(Map<String, Object> map)
	throws Exception {
		return (List<Map<String, Object>>)selectList("reservation.selectSearchByRooms", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectResId()
	throws Exception {
		return (int) selectOne("reservation.selectResId");
	}
	
	@SuppressWarnings("unchecked")
	public int selectCarId()
	throws Exception {
		return (int) selectOne("reservation.selectCarId");
	}

	@SuppressWarnings("unchecked")
	public void insertReservation(Map<String, Object> map)
	throws Exception {
		insert("reservation.insertReservation", map);
	}
	
	@SuppressWarnings("unchecked")
	public void insertCard(Map<String, Object> map)
	throws Exception {
		insert("reservation.insertCard", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectResult(Map<String, Object> map)
	throws Exception {
		return (List<Map<String, Object>>) selectList("reservation.selectResult", map);
	}
	
}
