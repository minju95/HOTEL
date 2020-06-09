package hotel.admin.service;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;

@Service("AdminNoticeService")
public interface AdminNoticeService {

	//리스트
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
		
	//상세보기
	Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception;
	
}
