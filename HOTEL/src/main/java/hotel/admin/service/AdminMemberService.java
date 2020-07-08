package hotel.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("AdminMemberService")
public interface AdminMemberService {
	//리스트
	List<Map<String, Object>> selectMemInfo(Map<String, Object> map) throws Exception;
		
}
