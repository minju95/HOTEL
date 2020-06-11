package hotel.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> mainBoardList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectNextBoard(Map<String, Object> map) throws Exception;

	

}