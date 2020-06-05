package hotel.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("AmdminReservationService")
public interface AdminReservationService { 
	
	List<Map<String, Object>> reservationList (Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectReservationList (Map<String, Object> map) throws Exception;
	
	
}
