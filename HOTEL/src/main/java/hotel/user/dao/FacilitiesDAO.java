package hotel.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("FacilitiesDAO")
public class FacilitiesDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFacilities(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("facilities.selectFacilities", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTypeByFacilities(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("facilities.selectTypeByFacilities", map);
	}
}
