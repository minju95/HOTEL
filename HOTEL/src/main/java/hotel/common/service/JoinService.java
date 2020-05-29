package hotel.common.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface JoinService {

	/*
	 * List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws
	 * Exception;
	 */
	
	void insertOneMember(Map<String, Object> map) throws Exception;

	/*
	 * Map<String, Object> selectBoardDetail(Map<String, Object> map) throws
	 * Exception;
	 * 
	 * void updateBoard(Map<String, Object> map) throws Exception;
	 * 
	 * void deleteBoard(Map<String, Object> map) throws Exception;
	 */

}
