package hotel.admin.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public void insertFacilities(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminFacilitiesDAO.insertFacilities(map);
		
		 MultipartHttpServletRequest multipartHttpServletRequest =
		 (MultipartHttpServletRequest) request; //MultipartHttpServletRequest 형식으로 형변환
		 Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		 //iterator를 이용하여 map에 있는 데이터에 순차적 접근
		 MultipartFile multipartFile = null;
		 
			 while(iterator.hasNext()) { //Iterator 인터페이스의 hasNext메소드를 통해 iterator에 다음 값이 있는 동안 반복해서 작업 수행
				 //hasNext() : iterator 내에 그 다음 데이터의 존재 유무를 알려줌
			 multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			 if(multipartFile.isEmpty()== false) {
			 log.debug("-----------file start-----------");
			 log.debug("name: "+multipartFile.getName());
			 log.debug("fileName : "+multipartFile.getOriginalFilename());
			 log.debug("size : "+multipartFile.getSize());
			 log.debug("-----------file end-----------");
			 }
		}
	}
	
	//상세보기
	@Override
	public Map<String, Object> adminFacDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminFacilitiesDAO.adminFacDetail(map);
		return resultMap;
	}
	
	
	
}
