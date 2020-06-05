package hotel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("AdminReservationDAO")
public class AdminReservationDAO extends AbstractDAO{
	
	//리스트 출력
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reservationList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("adminRes.reservationList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReservationList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("sample.selectBoardList", map);
	}
}
