package hotel.common.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface SignUpService {

	/*
	 * List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws
	 * Exception;
	 */
	
	void insertSignUp(Map<String, Object> map) throws Exception;
	
	int selectIdCheck(String mem_userid) throws Exception;
	/*
	 * Map<String, Object> selectBoardDetail(Map<String, Object> map) throws
	 * Exception;
	 * 
	 * void updateBoard(Map<String, Object> map) throws Exception;
	 * 
	 * void deleteBoard(Map<String, Object> map) throws Exception;
	 */

}
