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
	public List<Map<String, Object>> selectFacTypeAndName(Map<String, Object> map) throws Exception {
		return facilitiesDAO.selectFacTypeAndName(map);
	}
	
	@Override
	public List<Map<String, Object>> selectFacType(Map<String, Object> map) throws Exception {
		return facilitiesDAO.selectFacType(map);
	}
	
	@Override
	public List<Map<String, Object>> selectFacilities(Map<String, Object> map) throws Exception {
		return facilitiesDAO.selectFacilities(map);
	}
	
	@Override
	public Map<String, Object> facDetail(Map<String, Object> map) throws Exception {
		return facilitiesDAO.facDetail(map);
	}
	
	@Override
	public List<Map<String, Object>> facImgsDetail(Map<String, Object> map) throws Exception {
		return facilitiesDAO.facImgsDetail(map);
	}
	
	//ajax로 리스트 출력
	@Override
	public List<Map<String, Object>> selectFacList(Map<String, Object> map) throws Exception {
		return facilitiesDAO.selectFacList(map);
	}
	
}
