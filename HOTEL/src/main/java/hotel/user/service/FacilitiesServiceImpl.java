package hotel.user.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.loading.MLet;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import hotel.user.dao.FacilitiesDAO;


@Service("FacilitiesService")
public class FacilitiesServiceImpl implements FacilitiesService{

Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FacilitiesDAO")
	private FacilitiesDAO facilitiesDAO;
	
	@Override
	public List<Map<String, Object>> selectFacilities(Map<String, Object> map) throws Exception {
		return facilitiesDAO.selectFacilities(map);
		
	}
	
	@Override
	public List<Map<String, Object>> mainFacilities(Map<String, Object> map) throws Exception {
		return facilitiesDAO.mainFacilities(map);
		
	}

	@Override
	public Map<String, Object> selectTypeByFacilities(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = facilitiesDAO.selectTypeByFacilities(map);
		return resultMap;
	}
	
	
}
