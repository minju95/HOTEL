package hotel.admin.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import hotel.admin.dao.AdminRoomsDAO;

@Service("AdminRoomsService")
public class AdminRoomsServiceImpl implements AdminRoomsService{
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name="AdminRoomsDAO")
	private AdminRoomsDAO adminRoomsDAO;


	@Override
	public List<Map<String, Object>> selectRoomsList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) adminRoomsDAO.selectRoomsList(map);
	}
	

	
}
