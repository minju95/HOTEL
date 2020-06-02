package hotel.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("SignUpDAO")
public class SignUpDAO extends AbstractDAO{

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * selectBoardList(Map<String, Object> map) throws Exception{ return
	 * (List<Map<String, Object>>)selectList("sample.selectBoardList", map); }
	 */

	public void insertSignUp(Map<String, Object> map) throws Exception{
		insert("signUp.insertSignUp", map);
	}
	
	public int selectIdCheck(String mem_userid) throws Exception{
		return selectOne("signUp.selectIdCheck", mem_userid);
	}
	
	/*
	 * public void updateHitCnt(Map<String, Object> map) throws Exception{
	 * update("sample.updateHitCnt", map); }
	 * 
	 * @SuppressWarnings("unchecked") 
	 * public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
	 * return (Map<String, Object>) selectOne("sample.selectBoardDetail", map); 
	 * }
	 * 
	 * public void updateBoard(Map<String, Object> map) throws Exception{
	 * update("sample.updateBoard", map); }
	 * 
	 * public void deleteBoard(Map<String, Object> map) throws Exception{
	 * update("sample.deleteBoard", map); }
	 */

}
