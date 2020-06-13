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
		insert("AdminRooms.insertNewRoomImg", map);
	}
	
	//객실 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRoomsDetail(Map<String, Object> map) throws Exception{
		
		return (Map<String, Object>)selectOne("AdminRooms.selectRoomsDetail", map);
	}
	//객실 상세보기 - 이미지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomImgs(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("AdminRooms.selectRoomImgs", map);
	}
	
	//객실 수정
	public void updateRoom(Map<String, Object> map) throws Exception{
		update("AdminRooms.updateRoom", map);
	}
	
	//객실 이미지 수정
	public void updateRoomImg(Map<String, Object> map) throws Exception{
		update("AdminRooms.updateRoomImg", map);
	}
	
	//객실 삭제
	public void deleteRoom(Map<String, Object> map) throws Exception{
		delete("AdminRooms.deleteRoom", map);
	}
	
	//객실 이미지 삭제
	public void deleteRoomImg(Map<String, Object> map) throws Exception{
		delete("AdminRooms.deleteRoomImg", map);
	}
	
}
