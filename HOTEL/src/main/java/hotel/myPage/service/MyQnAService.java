package hotel.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("MyQnAService")
public interface MyQnAService {
	//등록
	void insertQNA (Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception;

	
	
}
