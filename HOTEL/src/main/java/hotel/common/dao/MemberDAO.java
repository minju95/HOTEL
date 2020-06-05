package hotel.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO extends AbstractDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String selectMyLogin(Map<String, Object> map, String id) throws Exception{
		
		return (String) selectOne("member.selectMyLogin", map);
	}
	  
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemInfo(String id) throws Exception{
	
		return (Map<String,Object>) sqlSession.selectOne("member.selectMemInfo", id);
	}
	
	public void updateMember(Map<String, Object> map) throws Exception{
		update("member.updateMember", map);
	}
	
	public void deleteMember(Map<String, Object> map) throws Exception{
		delete("member.deleteMember", map);
	}
}
