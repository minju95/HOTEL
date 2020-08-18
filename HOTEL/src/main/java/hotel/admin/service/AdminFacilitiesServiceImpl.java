package hotel.admin.service;

import java.util.HashMap;
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
import hotel.common.common.FileUtils;

@Service("AdminFacilitiesService")
public class AdminFacilitiesServiceImpl implements AdminFacilitiesService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminFacilitiesDAO")
	private AdminFacilitiesDAO adminFacilitiesDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	//리스트
	@Override
	public List<Map<String, Object>> selectFacList(Map<String, Object> map) throws Exception {
		return adminFacilitiesDAO.selectFacList(map);
	}

	//등록
	@Override
	public void insertFacilities(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminFacilitiesDAO.insertFacilities(map);
		
		//FileUtils 클래스를 이용하여 파일을 저장하고 데이터를 가져온 후, DB에 저장
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
			for(int i=0, size=list.size(); i<size; i++) {
				adminFacilitiesDAO.insertFacilitiesImage(list.get(i));
			}
		
			/*
		 MultipartHttpServletRequest multipartHttpServletRequest =
		 (MultipartHttpServletRequest) request; //MultipartHttpServletRequest 형식으로 형변환
		 Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		 //iterator를 이용하여 map에 있는 데이터에 순차적 접근
		 
		 MultipartFile multipartFile = null;
		 
			 while(iterator.hasNext()) { //Iterator 인터페이스의 hasNext메소드를 통해 iterator에 다음 값이 있는 동안 반복해서 작업 수행
				 //hasNext() : iterator 내에 그 다음 데이터의 존재 유무를 알려줌
			 multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			 
			 if(multipartFile.isEmpty()== false) { //로그찍기
			 log.debug("-----------file start-----------");
			 log.debug("name: "+multipartFile.getName());
			 log.debug("fileName : "+multipartFile.getOriginalFilename());
			 log.debug("size : "+multipartFile.getSize());
			 log.debug("-----------file end-----------");
			 }
		}
		*/
	}
	
	//상세보기
	@Override
	public Map<String, Object> adminFacDetail(Map<String, Object> map) throws Exception {
			
		Map<String, Object> resultMap = adminFacilitiesDAO.adminFacDetail(map); //상세정보 결과값을 map이라는 이름으로 resultMap에 저장
		Map<String, Object> tempMap = adminFacilitiesDAO.adminFacDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String, Object>> list = adminFacilitiesDAO.selectFileList(map); //selectFileList(): 게시글의 첨부파일 목록을 가져옴
		resultMap.put("list", list); //그 목록을 resultMap에 "list"라는 이름으로 저장
		System.out.println(resultMap);
		
		//resultMap에는 map과 list라는 이름의 키가 저장되어 있음을 알아둘 것!
		//키는 Controller에서 map.get("map")과 map.get("list")라는 키로 사용됨
		
		return resultMap;
	}
	
	//수정
	@Override
	public void modifyFacilities(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminFacilitiesDAO.modifyFacilities(map);
		
		//FileUtils 클래스를 이용하여 파일을 저장하고 데이터를 가져온 후, DB에 저장
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		System.out.println("이미지 파일명: 어어어얼ㅇㄹ언ㄹㅇ"+list);
		
		 for(int i=0, size=list.size(); i<size; i++) {
			 //System.out.println("ㅎㅎㅎㅎㅎㅎㅎㅎ" + list.get(i));
		 adminFacilitiesDAO.modifyFacImg(list.get(i));
		 }
	}
	
	//삭제
	@Override
	public void deleteFacilities(Map<String, Object> map) throws Exception {
		adminFacilitiesDAO.deleteFacilities(map);
		List<Map<String, Object>> list = fileUtils.parseDeleteFileInfo(map);
		
		for (int i = 0, size = list.size(); i < size; i++) {
			
			adminFacilitiesDAO.deleteFacImg(list.get(i));
		}
		
	}
}
