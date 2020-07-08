package hotel.common.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface LoginService {

	
	Map<String, Object> selectLogin(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectSearchMyId(Map<String, Object> map) throws Exception;
	
	String findPwd(Map<String, Object> map) throws Exception;
	
	void updatePwd(Map<String, Object> map) throws Exception;
	
	public boolean send(String subject, String text, String from, String to, String filePath);	
	/* 메일 전송
	 * subject: 제목
	 * text: 내용
	 * from: 보내는 메일 주소 
	 * to: 받는 메일 주소 
	 * filePath: 첨부파일 경로, 첨부파일이 없을 경우 null처리
	 * */
}
