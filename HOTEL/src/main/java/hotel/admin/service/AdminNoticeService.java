package hotel.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("AdminNoticeService")
public interface AdminNoticeService {

	//리스트
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
		
	//상세보기
	Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception;
	
	//등록
	void insertNewNotice (Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;
	
	//삭제
	void deleteNotice(Map<String, Object> map) throws Exception;
	
	//수정
	void modifyNotice(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;
		
}
