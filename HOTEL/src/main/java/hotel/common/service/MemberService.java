package hotel.common.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface MemberService {

	
	public String selectMyLogin(Map<String, Object> map, String id) throws Exception;
	
	public Map<String, Object> selectMemInfo(String id) throws Exception;
	
	public void updateMember(Map<String, Object> map) throws Exception;
	
	public void deleteMember(Map<String, Object> map) throws Exception;

	public boolean send(String subject, String text, String from, String to, String filePath);	
	
	
	Map<String, Object> selectMemInfo2(Map<String, Object> map) throws Exception;

	 /* 
	 * void updateBoard(Map<String, Object> map) throws Exception;
	 * 
	 * void deleteBoard(Map<String, Object> map) throws Exception;
	 */

}
