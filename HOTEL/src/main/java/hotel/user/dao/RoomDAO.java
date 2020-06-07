package hotel.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;
 
@Repository("RoomDAO")
public class RoomDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoom(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("room.selectRoom", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTypeByRoom(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("room.selectTypeByRoom", map);
	}
}
