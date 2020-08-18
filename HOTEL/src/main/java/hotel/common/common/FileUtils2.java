package hotel.common.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils2") // 이 객체의 관리를 스프링이 담당하도록 함
public class FileUtils2 { //파일을 특정 폴더에 저장하고 DB에 입력될 정보를 반환하도록 구성한 클래스
	
	
	//HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	//private static String filePath = request.getSession().getServletContext().getRealPath("")+"\\resources\\"; //파일이 저장될 위치 선언
	//String imagePath = request.getSession().getServletContext().getRealPath("")+"\\resources\\";

	
	public  List<Map<String, Object>> parseInsertFileInfo(Map<String, Object>
	map, HttpServletRequest request) throws Exception {
		String filePath = "C:\\Users\\parks\\git\\HOTEL\\HOTEL\\src\\main\\webapp\\resources\\rooms\\";

		//본인 경로로 변경하여 사용할 것!1
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		//클라이언트에 전송된 파일 정보를 담아서 반환해줄 List(다중 파일 전송을 위해 list로 설정)
		System.out.println(list);
		
		Map<String, Object> listMap = null;
		
		String room_type = (String) map.get("ROOM_TYPE"); //ServiceImpl에서 전달해준 map에서 신규 생성되는 게시글의 번호를 받아오도록 함
		File file = new File(filePath);
		
		
		if(file.exists()== false) { //파일을 저장할 경로에 해당 폴더가 없으면
			file.mkdirs(); //폴더 생성
		}
		
		while(iterator.hasNext()) { 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()==false) {
				
				originalFileName = multipartFile.getOriginalFilename(); //파일의 원본이름을 받아옴
			
				//서버에 실제 파일을 저장
				file = new File(filePath+originalFileName);
				System.out.println(filePath+originalFileName);
				multipartFile.transferTo(file); //multipartFile.transferTo(): 지정된 경로에 파일을 생성
				
				//위에서 만든 정보를 list에 추가
				listMap = new HashMap<String, Object>();
				listMap.put("ROOM_TYPE", room_type);
				listMap.put("ROOM_IMGS_FILE", originalFileName);
				list.add(listMap);
			}
		}
		return list;
	}
	
	
	//첨부파일 수정
	public  List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object>
	map, HttpServletRequest request) throws Exception {
		String filePath = "C:\\Users\\parks\\git\\HOTEL\\HOTEL\\src\\main\\webapp\\resources\\facilities\\"; //성환 pc
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// 클라이언트에 전송된 파일 정보를 담아서 반환해줄 List(다중 파일 전송을 위해 list로 설정)

		Map<String, Object> listMap = null;

		String ROOM_ID = (String) map.get("ROOM_ID"); // ServiceImpl에서 전달해준 map에서 신규 생성되는 게시글의 번호를 받아오도록 함
		String ROOM_IMGS_ID_1 = "";
		String ROOM_IMGS_ID_2 = "";
		String ROOM_IMGS_ID_3 = "";
		String ROOM_IMGS_ID_0 = (String) map.get("ROOM_IMGS_ID_0");
		if ((String) map.get("ROOM_IMGS_ID_1") != null) ROOM_IMGS_ID_1 = (String) map.get("ROOM_IMGS_ID_1");
		else if ((String) map.get("ROOM_IMGS_ID_2") != null) ROOM_IMGS_ID_2 = (String) map.get("ROOM_IMGS_ID_2");
		else if ((String) map.get("ROOM_IMGS_ID_3") != null) ROOM_IMGS_ID_3 = (String) map.get("ROOM_IMGS_ID_3");
		
		//수정하기 전 기존 파일이 있으면 이름값 받아오기 -> 업데이트시 기존파일 삭제하기 위해서(아직 미구현)
		List<String> oldFileName = new ArrayList<String>();
		for(int i=0; i<=3; i++) { // 등록할수 있는 최대 이미지 개수 4개
			if((String)map.get("OLD_FILE_NAME_"+i) != null) {
				oldFileName.add((String)map.get("OLD_FILE_NAME_"+i));
			}
		} // 출력 : ex) -> [businesstwin01.jpg, businesstwin02.jpg]
		
		String requestName = null;
		String idx = null;

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
			if (multipartFile.isEmpty() == false) { // multipartFile이 비어있지 않은 경우(=첨부파일이 있는 경우)
				
				requestName = multipartFile.getName();
				// System.out.println("helllllo "+requestName); //출력: file_

				idx = "IDX_" + requestName.substring(requestName.indexOf("_") + 1);
				System.out.println("byyyyyye " + idx); // 출력: IDX_0, IDX_1
				// 기존 파일 삭제
				
				// 파일의 정보를 받아서 새로운 이름으로 변경
				originalFileName = multipartFile.getOriginalFilename(); // 파일의 원본이름을 받아옴
				System.out.println("파일명: " + originalFileName);
				
				multipartFile.transferTo(new File(filePath + originalFileName)); // multipartFile.transferTo(): 지정된 경로에
																					// 파일을 생성

				// 위에서 만든 정보를 list에 map으로 추가
				listMap = new HashMap<String, Object>();

				listMap.put("ROOM_ID", ROOM_ID);
				/*
				 * if((String) map.get("HOTEL_IMGS_ID_1") != null) { //이미지가 2개 등록되면
				 * listMap.put("HOTEL_IMGS_ID_1", HOTEL_IMGS_ID_1);
				 * listMap.put("HOTEL_IMGS_ID_0", HOTEL_IMGS_ID_0); } else { //이미지가 1개 등록되면
				 * listMap.put("HOTEL_IMGS_ID_0", HOTEL_IMGS_ID_0); }
				 */

				String idx0_last = idx.substring(idx.length() - 1, idx.length());

				if (Integer.parseInt(idx0_last) == 0) listMap.put("ROOM_IMGS_ID_0", ROOM_IMGS_ID_0);
				else if (Integer.parseInt(idx0_last) == 1) listMap.put("ROOM_IMGS_ID_1", ROOM_IMGS_ID_1);
				else if (Integer.parseInt(idx0_last) == 2) listMap.put("ROOM_IMGS_ID_2", ROOM_IMGS_ID_2);
				else if (Integer.parseInt(idx0_last) == 3) listMap.put("ROOM_IMGS_ID_3", ROOM_IMGS_ID_3);
				

				listMap.put("ROOM_IMGS_FILE", originalFileName);
				list.add(listMap);
				System.out.println("리스트에 담긴 데이터 출력 : " + list);

			} else { // multipartFile이 비어있는 경우(=첨부파일이 없는 경우, 게시글에서 파일을 수정하지 않은 경우)
				/*
				 * requestName = multipartFile.getName(); //html태그에서 file태그의 name값(file_숫자)을 가져옴
				 * idx = "FAC_HOTEL_ID_"+requestName.substring(requestName.indexOf("_")+1);
				 * if(map.containsKey(idx) == true && map.get(idx)!= null) { listMap = new
				 * HashMap<String, Object>(); listMap.put("FILE_IDX", map.get(idx));
				 * list.add(listMap); }
				 */
			}
		}
		return list;
	}
	
	public  List<Map<String, Object>> parseDeleteFileInfo(Map<String, Object>
	map) throws Exception {
		String filePath = "C:\\Users\\KMK\\git\\HOTEL\\HOTEL\\src\\main\\webapp\\resources\\";
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> listMap = null;

		for(int i=0; i<=3; i++) {
			if((String)map.get("ROOM_IMGS_ID_"+i) != null) {
				listMap = new HashMap<String, Object>();
				listMap.put("ROOM_IMGS_ID", (String)map.get("ROOM_IMGS_ID_"+i));
				list.add(listMap);
			}
		}
		
		//기존 파일 이름 받아오기
		List<String> oldFileName = new ArrayList<String>();
		for(int i=0; i<=3; i++) { // 등록할수 있는 최대 이미지 개수 4개
			if((String)map.get("OLD_FILE_NAME_"+i) != null) {
				oldFileName.add((String)map.get("OLD_FILE_NAME_"+i));
			}
		} // 출력 : ex) -> [businesstwin01.jpg, businesstwin02.jpg]
		Iterator<String> iterator = oldFileName.iterator();
		
		//System.out.println("iterator 에 있는 기존파일이름"+iterator.next());
		while (iterator.hasNext()) {
			File file = new File(filePath+iterator.next());
			//System.out.println("기존파일들의 경로 : "+file.getPath());
			if(file.exists()) {
				file.delete();
			}
		}
		return list;
	}
	
}
