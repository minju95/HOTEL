package hotel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("AdminNoticeDAO")
public class AdminNoticeDAO extends AbstractDAO {
	
	//리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("adminNotice.noticeList", map);
	}
	
	//상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminNotice.noticeDetail", map);
	}
	
	//등록
	public void insertNewNotice(Map<String, Object> map) throws Exception{
		System.out.println(map.get("NOTICE_IMG"));
		insert("adminNotice.insertNewNotice", map);
	}
	
	//삭제
	public void deleteNotice(Map<String, Object> map) throws Exception{
		delete("adminNotice.deleteNotice", map);
	}
	
	// 수정
	public void modifyNotice(Map<String, Object> map) throws Exception{
		update("adminNotice.updateNotice", map);
	}
}


