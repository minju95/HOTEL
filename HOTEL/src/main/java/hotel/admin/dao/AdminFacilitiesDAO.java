package hotel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("AdminFacilitiesDAO")
public class AdminFacilitiesDAO extends AbstractDAO{
	
	//리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFacList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("adminFac.facilitiesList", map);
	}
	
	//등록
	public void insertFacilities(Map<String, Object> map) throws Exception{
		insert("adminFac.insertNewFacilities", map);
	}
	
	//이미지 등록
	public void insertFacilitiesImage(Map<String, Object> map) throws Exception{
		insert("adminFac.insertFacilitiesImage", map);
	}
	
	//상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminFacDetail(Map<String, Object> map) 
		throws Exception{
		return (Map<String, Object>) selectOne("adminFac.facilitiesDetail", map);
	}
	
	//부대시설 인덱스 증가
	public int selectFacId() throws Exception {
		return (int) selectOne("adminFac.selectFacId");
	}
	
}
