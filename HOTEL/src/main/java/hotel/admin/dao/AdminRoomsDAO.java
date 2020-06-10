package hotel.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("AdminRoomsDAO")
public class AdminRoomsDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomsList(Map<String, Object> map) throws Exception{
	
		return (List<Map<String, Object>>) selectPagingList("AdminRooms.selectRoomsList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomType(Map<String, Object> map) throws Exception{
	
		return (List<Map<String, Object>>) selectList("AdminRooms.selectRoomType", map);
	}
	
	//등록
	public void insertNewRoom(Map<String, Object> map) throws Exception{
		insert("AdminRooms.insertNewRoom", map);
	}
	
	//이미지 등록
	public void insertNewRoomImg(Map<String, Object> map) throws Exception{
		System.out.println(map);
		insert("AdminRooms.insertNewRoomImg", map);
	}
}
