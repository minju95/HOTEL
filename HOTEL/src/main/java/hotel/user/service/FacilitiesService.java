package hotel.user.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface FacilitiesService {

	List<Map<String, Object>> selectFacilities(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> mainFacilities(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectTypeByFacilities(Map<String, Object> map) throws Exception;
}
