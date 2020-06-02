package hotel.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotel.common.dao.LoginDAO;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name="LoginDAO")
	private LoginDAO loginDAO;
	
	/*
	 * @Override public List<Map<String, Object>> selectBoardList(Map<String,
	 * Object> map) throws Exception { return sampleDAO.selectBoardList(map);
	 * 
	 * }
	 */

	@Override
	public Map<String, Object> selectLogin(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = loginDAO.selectLogin(map);
		
		return resultMap;
	}

	

	/*
	 * @Override public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
	 *  sampleDAO.updateHitCnt(map); 
	 *  Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map); 
	 *  
	 *  return resultMap; 
	 *  }
	 * 
	 * @Override public void updateBoard(Map<String, Object> map) throws Exception{
	 * sampleDAO.updateBoard(map); }
	 * 
	 * @Override public void deleteBoard(Map<String, Object> map) throws Exception {
	 * sampleDAO.deleteBoard(map); }
	 */

}
