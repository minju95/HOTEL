package hotel.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("AdminQnAService")
public interface AdminQnAService {
	//리스트
	List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception;
	
	//상세보기
	Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;
	
	//답변달기
	void qnaReply(Map<String,Object> map) throws Exception;
}
