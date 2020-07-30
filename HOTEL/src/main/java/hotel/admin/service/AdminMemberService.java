package hotel.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("AdminMemberService")
public interface AdminMemberService {
	
	//회원 수
	int selectMemNum() throws Exception;
	
	//회원 목록
	List<Map<String, Object>> selectMemInfo(Map<String, Object> map) throws Exception;
	
	//회원 상세보기
	Map<String, Object> memberDetail(Map<String, Object> map) throws Exception;
		
}
