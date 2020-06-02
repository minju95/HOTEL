package hotel.common.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface LoginService {

	/*
	 * List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws
	 * Exception;
	 */
	
	Map<String, Object> selectLogin(Map<String, Object> map) throws Exception;
	
	 /* 
	 * void updateBoard(Map<String, Object> map) throws Exception;
	 * 
	 * void deleteBoard(Map<String, Object> map) throws Exception;
	 */

}
