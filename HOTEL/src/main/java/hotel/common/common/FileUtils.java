package hotel.common.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils") // 이 객체의 관리를 스프링이 담당하도록 함
public class FileUtils { //파일을 특정 폴더에 저장하고 DB에 입력될 정보를 반환하도록 구성한 클래스
	private static final String filePath ="C:\\Users\\UploadFile\\"; //파일이 저장될 위치 선언
	
	public  List<Map<String, Object>> parseInsertFileInfo(Map<String, Object>
	map, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		//클라이언트에 전송된 파일 정보를 담아서 반환해줄 List(다중 파일 전송을 위해 list로 설정)
		
		Map<String, Object> listMap = null;
		
		String fac_id = (String) map.get("FAC_HOTEL_ID"); //ServiceImpl에서 전달해준 map에서 신규 생성되는 게시글의 번호를 받아오도록 함
		File file = new File(filePath);
		System.out.println(file);
		
		if(file.exists()== false) { //파일을 저장할 경로에 해당 폴더가 없으면
			file.mkdirs(); //폴더 생성
		}
		
		while(iterator.hasNext()) { 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()==false) {
				
				originalFileName = multipartFile.getOriginalFilename(); //파일의 원본이름을 받아옴
			
				//서버에 실제 파일을 저장
				file = new File(filePath+originalFileName);
				multipartFile.transferTo(file); //multipartFile.transferTo(): 지정된 경로에 파일을 생성
				
				//위에서 만든 정보를 list에 추가
				listMap = new HashMap<String, Object>();
				listMap.put("FAC_HOTEL_ID", fac_id);
				listMap.put("HOTEL_IMGS_FILE", originalFileName);
				list.add(listMap);
			}
		}
		return list;
	}
	
	/*
	public  List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object>
	map, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		//클라이언트에 전송된 파일 정보를 담아서 반환해줄 List(다중 파일 전송을 위해 list로 설정)
		
		Map<String, Object> listMap = null;
		
		String fac_id = (String) map.get("FAC_HOTEL_ID"); //ServiceImpl에서 전달해준 map에서 신규 생성되는 게시글의 번호를 받아오도록 함
		String requestName = null;
		String idx = null;
		
		while(iterator.hasNext()) { 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()==false) { //multipartFile이 비어있지 않은 경우(=첨부파일이 있는 경우)
				//파일의 정보를 받아서 새로운 이름으로 변경
				originalFileName = multipartFile.getOriginalFilename(); //파일의 원본이름을 받아옴
			
				
				multipartFile.transferTo(new File(filePath+storedFileName)); //multipartFile.transferTo(): 지정된 경로에 파일을 생성
				
				//위에서 만든 정보를 list에 추가
				listMap = new HashMap<String, Object>();
				listMap.put("FAC_HOTEL_ID", fac_id);
				listMap.put("HOTEL_IMGS_FILE", originalFileName);
				list.add(listMap);
			}
			else { //multipartFile이 비어있는 경우(=첨부파일이 없는 경우, 게시글에서 파일을 수정하지 않은 경우)
				requestName = multipartFile.getName(); //html태그에서 file태그의 name값(file_숫자)을 가져옴
				idx = "IDX_"+requestName.substring(requestName.indexOf("_")+1);
				if(map.containsKey(idx) == true && map.get(idx)!= null) {
					listMap = new HashMap<String, Object>();
					listMap.put("FILE_IDX", map.get(idx));
					list.add(listMap);
				}
			}
		}
		return list;
	}
	*/
	
}
