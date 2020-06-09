package hotel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminNoticeService;
import hotel.common.common.CommandMap;


@Controller
public class AdminNoticeController {
Logger log = Logger.getLogger(this.getClass());
	
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
	public ModelAndView insertFac(CommandMap commandMap, HttpServletRequest request) throws Exception {
	//첨부파일의 경우, HttpServletRequest에서 처리
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		adminNoticeService.insertNewNotice(commandMap.getMap(), request);
		return mv;
	}
		
}
