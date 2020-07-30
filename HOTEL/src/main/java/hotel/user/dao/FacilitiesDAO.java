package hotel.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("FacilitiesDAO")
public class FacilitiesDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFacTypeAndName(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("facilities.selectFacTypeAndName", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFacType(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("facilities.selectFacType", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFacilities(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("facilities.selectFacilities", map);
	}
	
	//ajax로 리스트 출력
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFacList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("facilities.selectFacList",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> facDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("facilities.facDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> facImgsDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("facilities.facImgsDetail", map);
	}
	
}
