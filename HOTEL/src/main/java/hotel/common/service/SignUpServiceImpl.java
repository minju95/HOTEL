package hotel.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotel.common.dao.SignUpDAO;

@Service("SignUpService")
public class SignUpServiceImpl implements SignUpService{
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name="SignUpDAO")
	private SignUpDAO signUpDAO;
	
	/*
	 * @Override public List<Map<String, Object>> selectBoardList(Map<String,
	 * Object> map) throws Exception { return sampleDAO.selectBoardList(map);
	 * 
	 * }
	 */

	@Override
	public void insertSignUp(Map<String, Object> map) throws Exception {
		signUpDAO.insertSignUp(map);
	}

	@Override
	public int selectIdCheck(String mem_userid) throws Exception {
		   
		return signUpDAO.selectIdCheck(mem_userid); 
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
