package hotel.user.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface FacilitiesService {
	
	List<Map<String, Object>> selectFacTypeAndName(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectFacType(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectFacilities(Map<String, Object> map) throws Exception;
	
	//ajax로 리스트 출력
	List<Map<String, Object>> selectFacList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> facDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> facImgsDetail(Map<String, Object> map) throws Exception;
	
}
