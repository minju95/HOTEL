package hotel.user.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.loading.MLet;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import hotel.user.dao.NoticeDAO;

@Service("NoticeService") 
public class NoticeServiceImpl implements NoticeService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeDAO")
	private NoticeDAO noticeDAO;
	
	
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectBoardList(map);
		
	}

	@Override
	public Map<String, Object> selectNextBoard(Map<String, Object> map) throws Exception{
		
		Map<String, Object> resultMap = noticeDAO.selectNextBoard(map);
		return resultMap;
	}
	
	
	//@Override
	//public Map<String, Object> selectNextBoard(Map<String, Object> map) throws Exception {
	
		//Map<String, Object> resultMap = new HashMap<String, Object>();
		//Map<String, Object> tempMap = noticeDAO.selectNextBoard(map);
		//resultMap.put("map", tempMap);
		
		//return resultMap;
	//}


}