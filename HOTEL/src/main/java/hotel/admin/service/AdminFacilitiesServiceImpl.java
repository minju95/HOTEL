package hotel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import hotel.admin.dao.AdminFacilitiesDAO;

@Service("AdminFacilitiesService")
public class AdminFacilitiesServiceImpl implements AdminFacilitiesService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminFacilitiesDAO")
	private AdminFacilitiesDAO adminFacilitiesDAO;
	
	//리스트
	@Override
	public List<Map<String, Object>> selectFacList(Map<String, Object> map) throws Exception {
		return adminFacilitiesDAO.selectFacList(map);
	}

	//등록
	@Override
	public void insertFacilities(Map<String, Object> map) throws Exception {
		adminFacilitiesDAO.insertFacilities(map);
	}
	
	//상세보기
	@Override
	public Map<String, Object> adminFacDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminFacilitiesDAO.adminFacDetail(map);
		return resultMap;
	}

	
	
}
