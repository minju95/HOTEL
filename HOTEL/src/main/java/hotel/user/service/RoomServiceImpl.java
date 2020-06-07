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

import hotel.user.dao.RoomDAO;


@Service("RoomService")
public class RoomServiceImpl implements RoomService{

Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RoomDAO")
	private RoomDAO roomDAO;
	
	@Override
	public List<Map<String, Object>> selectRoom(Map<String, Object> map) throws Exception {
		return roomDAO.selectRoom(map);
		
	}

	@Override
	public Map<String, Object> selectTypeByRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = roomDAO.selectTypeByRoom(map);
		return resultMap;
	}
	
	
}
