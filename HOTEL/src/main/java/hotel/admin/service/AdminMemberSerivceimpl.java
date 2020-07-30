package hotel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import hotel.admin.dao.AdminMemberDAO;

@Service("AdminMemberService")
public class AdminMemberSerivceimpl implements AdminMemberService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	@Override
	public List<Map<String, Object>> selectMemInfo(Map<String, Object> map) throws Exception {
		return adminMemberDAO.selectMemInfo(map);
	}
	
	@Override
	public Map<String, Object> memberDetail(Map<String, Object> map) throws Exception {
		return adminMemberDAO.memberDetail(map);
		
	}

	@Override
	public int selectMemNum() throws Exception {
		return adminMemberDAO.selectMemNum();
	}
}
