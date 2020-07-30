package hotel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("AdminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{
	//회원 수
	public int selectMemNum() throws Exception{
		return (Integer) selectOne("adminMember.selectMemNum");
	}
	
	//회원 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemInfo(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("adminMember.selectMemInfo", map);
	}
	
	//회원 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberDetail(Map<String, Object> map) 
		throws Exception{
		return (Map<String, Object>) selectOne("adminMember.memberDetail", map);
	}	
}
