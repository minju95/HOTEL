package hotel.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import hotel.common.dao.AbstractDAO;

@Repository("reservationDAO")
public class ReservationDao extends AbstractDAO{

	/*예약 메인 리스트*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRooms(Map<String, Object> map)
	throws Exception {
		return (List<Map<String, Object>>)selectList("reservation.selectRooms", map);
	}
	
	/*예약 메인 검색 리스트*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchRooms(Map<String, Object> map)
	throws Exception {
		return (List<Map<String, Object>>)selectList("reservation.selectSearchByRooms", map);
	}
	
	/*메인 > 예약 (SEQ_RES_ID.NEXTVAL 리턴)*/
	@SuppressWarnings("unchecked")
	public int selectResId()
	throws Exception {
		return (int) selectOne("reservation.selectResId");
	}
	
	/*메인 > 예약 (SEQ_CAR_ID.NEXTVAL 리턴)*/
	@SuppressWarnings("unchecked")
	public int selectCarId()
	throws Exception {
		return (int) selectOne("reservation.selectCarId");
	}

	/*예약등록*/
	@SuppressWarnings("unchecked")
	public void insertReservation(Map<String, Object> map)
	throws Exception {
		insert("reservation.insertReservation", map);
	}
	
	/*카드등록*/
	@SuppressWarnings("unchecked")
	public void insertCard(Map<String, Object> map)
	throws Exception {
		insert("reservation.insertCard", map);
	}
	
	/*결제 후 완료 페이지에 노출할 리스트*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectResult(Map<String, Object> map)
	throws Exception {
		return (List<Map<String, Object>>) selectList("reservation.selectResult", map);
	}
	
	/*예약삭제*/
	@SuppressWarnings("unchecked")
	public void deleteReservation(Map<String, Object> map)
	throws Exception {
		insert("reservation.deleteReservation", map);
	}
	
	/*카드삭제*/
	@SuppressWarnings("unchecked")
	public void deleteCard(Map<String, Object> map)
	throws Exception {
		insert("reservation.deleteCard", map);
	}
	
	/*roomView*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> roomView(Map<String, Object> map)
	throws Exception {
		return (List<Map<String, Object>>) selectList("reservation.selectRoomView", map);
	}
	
}
