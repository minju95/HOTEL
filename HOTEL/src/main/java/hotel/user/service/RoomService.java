package hotel.user.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface RoomService {

	List<Map<String, Object>> selectRoom(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectTypeByRoom(Map<String, Object> map) throws Exception;
}
