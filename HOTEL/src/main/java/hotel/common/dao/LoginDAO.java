package hotel.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("LoginDAO")
public class LoginDAO extends AbstractDAO{

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * selectBoardList(Map<String, Object> map) throws Exception{ return
	 * (List<Map<String, Object>>)selectList("sample.selectBoardList", map); }
	 */
	
	/*
	 * public void updateHitCnt(Map<String, Object> map) throws Exception{
	 * update("sample.updateHitCnt", map); }
	 */
	 @SuppressWarnings("unchecked") 
	 public Map<String, Object> selectLogin(Map<String, Object> map) throws Exception{
		 
		 return (Map<String, Object>) selectOne("login.selectLogin", map); 
	 }
	 
	 @SuppressWarnings("unchecked")
	 public Map<String, Object> selectSearchMyId(Map<String, Object> map) throws Exception {
		 
		 return (Map<String, Object>) selectOne("login.selectSearchMyId", map);
	 }
	 
	 public String findPwd(Map<String, Object> map) throws Exception {
		 
		 return (String)selectOne("login.findPwd", map);
	 }
	 
	 public void updatePwd(Map<String, Object> map) throws Exception {
		 
		 update("login.updatePwd", map);
	 }
	  
	 /* public void updateBoard(Map<String, Object> map) throws Exception{
	 * update("sample.updateBoard", map); }
	 * 
	 * public void deleteBoard(Map<String, Object> map) throws Exception{
	 * update("sample.deleteBoard", map); }
	 */

}
