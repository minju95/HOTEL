package hotel.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("AmdminReservationService")
public interface AdminReservationService { 
	
	//리스트, 검색
	List<Map<String, Object>> selectResList (Map<String, Object> map) throws Exception;
	
	
}
