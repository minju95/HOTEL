package hotel.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("NoticeDAO")
public class NoticeDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("notice.selectBoardList", map);
	}
	

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNextBoard(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("notice.selectNextBoard", map);
	}



	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("notice.mainBoardList", map);
	}

	

}

