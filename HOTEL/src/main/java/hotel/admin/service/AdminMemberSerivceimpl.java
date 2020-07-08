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
		// TODO Auto-generated method stub
		return adminMemberDAO.selectMemInfo(map);
	}

}
