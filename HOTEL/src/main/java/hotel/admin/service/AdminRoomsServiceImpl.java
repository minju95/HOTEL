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

	//상세보기
	@Override
	public Map<String, Object> selectRoomsDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = adminRoomsDAO.selectRoomsDetail(map); //상세정보 결과값을 map이라는 이름으로 resultMap에 저장
		Map<String, Object> tempMap = adminRoomsDAO.selectRoomsDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String, Object>> list = adminRoomsDAO.selectRoomImgs(map); //selectFileList(): 게시글의 첨부파일 목록을 가져옴
		resultMap.put("list", list); //그 목록을 resultMap에 "list"라는 이름으로 저장
		
		//resultMap에는 map과 list라는 이름의 키가 저장되어 있음을 알아둘 것!
		//키는 Controller에서 map.get("map")과 map.get("list")라는 키로 사용됨
		
		return resultMap;
	}
	
	public List<Map<String, Object>> selectRoomImgs(Map<String, Object> map) throws Exception{
		
		return adminRoomsDAO.selectRoomImgs(map);
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
	
	// 수정
	@Override
	public void modifyRoom(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminRoomsDAO.updateRoom(map);

		// FileUtils2 클래스를 이용하여 파일을 저장하고 데이터를 가져온 후, DB에 저장
		List<Map<String, Object>> list = fileUtils2.parseUpdateFileInfo(map, request);
		System.out.println("이미지 파일명: 어어어얼ㅇㄹ언ㄹㅇ" + list);

		for (int i = 0, size = list.size(); i < size; i++) {
			adminRoomsDAO.updateRoomImg(list.get(i));
		}
	}

	@Override
	public void deleteRoom(Map<String, Object> map) throws Exception {
		adminRoomsDAO.deleteRoom(map);
		
		List<Map<String, Object>> list = fileUtils2.parseDeleteFileInfo(map);
		
		for (int i = 0, size = list.size(); i < size; i++) {
			
			adminRoomsDAO.deleteRoomImg(list.get(i));
		}
	}
	
	
}
