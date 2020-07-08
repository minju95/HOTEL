package hotel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("AdminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{
	//리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemInfo(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("adminMember.selectMemInfo", map);
	}
}
