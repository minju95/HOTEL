package hotel.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hotel.common.common.CommandMap;

public interface AdminRoomsService {

	List<Map<String, Object>> selectRoomsList(Map<String, Object> map) throws Exception;
	 /* 
	 * void updateBoard(Map<String, Object> map) throws Exception;
	 * 
	 * void deleteBoard(Map<String, Object> map) throws Exception;
	 */

}
