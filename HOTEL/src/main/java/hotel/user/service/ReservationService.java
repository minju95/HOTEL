package hotel.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReservationService {

	List<Map<String, Object>> selectRooms(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> searchRooms(Map<String, Object> map) throws Exception;
	
	int selectResId() throws Exception;
	
	int selectCarId() throws Exception;
	
	List<Map<String, Object>> insert(Map<String, Object> map) throws Exception;
	
}
