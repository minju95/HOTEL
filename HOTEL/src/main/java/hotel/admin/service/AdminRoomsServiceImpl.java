package hotel.admin.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import hotel.admin.dao.AdminRoomsDAO;
import hotel.common.common.FileUtils2;

@Service("AdminRoomsService")
public class AdminRoomsServiceImpl implements AdminRoomsService{
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name="AdminRoomsDAO")
	private AdminRoomsDAO adminRoomsDAO;
	
	@Resource(name="fileUtils2")
	private FileUtils2 fileUtils2;


	@Override
	public List<Map<String, Object>> selectRoomsList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) adminRoomsDAO.selectRoomsList(map);
	}

	@Override
	public List<Map<String, Object>> selectRoomType(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) adminRoomsDAO.selectRoomType(map);
	}

	@Override
	public void insertNewRoom(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminRoomsDAO.insertNewRoom(map);

		// FileUtils 클래스를 이용하여 파일을 저장하고 데이터를 가져온 후, DB에 저장
		List<Map<String, Object>> list = fileUtils2.parseInsertFileInfo(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			adminRoomsDAO.insertNewRoomImg(list.get(i));
		}
	}
	
	
	
	
}
