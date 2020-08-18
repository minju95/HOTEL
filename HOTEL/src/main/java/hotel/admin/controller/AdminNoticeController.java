package hotel.admin.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminNoticeService;
import hotel.common.common.CommandMap;


@Controller
public class AdminNoticeController {
	Logger log = Logger.getLogger(this.getClass());
	//private String uploadPath ="C:\\Users\\학생용\\git\\HOTEL\\HOTEL\\src\\main\\webapp\\resources\\";
	private String uploadPath = "C:\\Users\\parks\\git\\HOTEL\\HOTEL\\src\\main\\webapp\\resources\\"; //성환pc

	@Resource(name="AdminNoticeService")
	private AdminNoticeService adminNoticeService;
	
	//공지사항  목록 조회
	@RequestMapping(value="/admin/noticeList")
	public ModelAndView boardList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/admin/noticeList");
		List<Map<String, Object>> list = adminNoticeService.selectNoticeList(commandMap.getMap());
			
		mv.addObject("list", list);
	    return mv;
	}
	
	@RequestMapping(value="/admin/selectNoticeList")
	public ModelAndView selectFacList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
			
		List<Map<String, Object>> list = adminNoticeService.selectNoticeList(commandMap.getMap());
			
		mv.addObject("list", list);
			
		if(list.size()>0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
			
		return mv;
	}
	
	//공지사항 상세보기
	@RequestMapping(value="admin/noticeDetail")
	public ModelAndView adminNoticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/noticeDetail");
				
		Map<String, Object> map = adminNoticeService.adminNoticeDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		System.out.println(mv);
		return mv;
	}
	
	//공지사항 등록 "폼"
	@RequestMapping(value="/admin/newNoticeForm")
	public ModelAndView insertNotice(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/newNoticeForm");
		return mv;
	}
	
	//공지사항 등록처리
	@RequestMapping(value="/admin/newNotice")
	public ModelAndView insertFac(CommandMap commandMap, MultipartHttpServletRequest request) throws Exception {
	//첨부파일의 경우, HttpServletRequest에서 처리
		
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		
		
		MultipartFile file = request.getFile("NOTICE_IMG");

		System.out.println("파일명 : "+file);


		String fileName = file.getOriginalFilename();
		System.out.println("원래 파일명 :  " + fileName);

			commandMap.put("NOTICE_IMG", fileName); // map에 파일명 집어넣기

			File uploadFile = new File(uploadPath + fileName);
			System.out.println("업로드 경로 : " + uploadFile);

			if(uploadFile.exists()) {  //파일 객체가 존재하면
				fileName = new Date().getTime()+fileName;
				System.out.println("파일 명(date 포함) : "+fileName);
				uploadFile = new File(uploadPath + fileName); 
			}
			
			try {
				file.transferTo(uploadFile);
			} catch(Exception e) {
			}
			// 업로드 경로에 파일 삽입
			file.transferTo(uploadFile);
		adminNoticeService.insertNewNotice(commandMap.getMap(), request);
		return mv;
		
	}
	//공지사항 삭제
	@RequestMapping(value="admin/deleteNotice")
	public ModelAndView deleteNotice(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		
		adminNoticeService.deleteNotice(commandMap.getMap());
		
		return mv;
	}
	
	//공지사항 수정
	@RequestMapping(value="admin/modifyNoticeForm")
	public ModelAndView AdminNoticeModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/modifyNoticeForm");
		
		Map<String, Object> map = adminNoticeService.adminNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//공지사항 수정처리
	@RequestMapping(value="admin/modifyNotice")
	public ModelAndView modifynotice(CommandMap commandMap, MultipartHttpServletRequest request)
			throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeDetail");
		
		String orgFileName = request.getParameter("orgFile");
		MultipartFile newFile = request.getFile("newFile");
		
		
		
		System.out.println(newFile);
		
		
		String newFileName = newFile.getOriginalFilename();
		
		
		
		commandMap.getMap().put("NOTICE_IMG",orgFileName); //기존파일명을 map에 집어넣기
		System.out.println("map에 들어간 데이터를 꺼내보자"+commandMap.getMap());
		
		if(newFile != null && !newFileName.equals("")) { //새로 등록된 파일이 있다면
			
			if(orgFileName != null || !orgFileName.equals("")) { //기존파일이 있다면
				File removeFile = new File(uploadPath + orgFileName); //업로드 폴더 경로+파일명 가져와서
				removeFile.delete(); //기존파일 삭제
			}
			File newUploadFile = new File(uploadPath + newFileName); //업로드 폴더 경로+파일명 가져오기
			try {
				newFile.transferTo(newUploadFile); //집어넣어
			} catch(Exception e) {
				e.printStackTrace();
			}
		
			commandMap.getMap().put("NOTICE_IMG", newFileName); //새로운 파일을 map에 집어넣기(NOTICE_IMG라는 이름으로 MAP에 삽입)
			System.out.println("map의 데이터를 다시 꺼내라"+commandMap.getMap());
		}
		
		//새로 등록된 파일이 없고 기존 이미지를 없애려면?
		
		
		adminNoticeService.modifyNotice(commandMap.getMap(), request);
		
		mv.addObject("NOTICE_ID", commandMap.get("NOTICE_ID"));
		System.out.println(mv);
		
		return mv;
		
	}
	
	
	
}