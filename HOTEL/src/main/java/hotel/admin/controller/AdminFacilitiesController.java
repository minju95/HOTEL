package hotel.admin.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminFacilitiesService;
import hotel.common.common.CommandMap;
import hotel.common.logger.LoggerAspect;

@Controller
public class AdminFacilitiesController {
	Logger log = Logger.getLogger(LoggerAspect.class);
	
	@Resource(name="AdminFacilitiesService")
	private AdminFacilitiesService adminFacilitiesService;
	
	//부대시설 목록 조회
	@RequestMapping(value="/admin/facilitiesList")
    public ModelAndView facilitiesList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/admin/facilitiesList");
		List<Map<String, Object>> list = adminFacilitiesService.selectFacList(commandMap.getMap());
		
		mv.addObject("list", list);
    	return mv;
    }
	
	@RequestMapping(value="/admin/selectFacList")
	public ModelAndView selectFacList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = adminFacilitiesService.selectFacList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	//부대시설 등록 "폼"(이 메소드 안에선 등록 처리 로직 X)
	@RequestMapping(value="/admin/newFacilitiesForm")
	public ModelAndView insertFacilities(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/newFacilitiesForm");
		int FAC_HOTEL_ID = adminFacilitiesService.selectFacId(); //부대시설 인덱스 증가
		mv.addObject("FAC_HOTEL_ID", FAC_HOTEL_ID);
		System.out.println(mv);
		return mv;
	}
	
	//부대시설 등록처리
	@RequestMapping(value="/admin/newFacilities")
	public ModelAndView insertFac(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/facilitiesList");
		adminFacilitiesService.insertFacilities(commandMap.getMap());
		adminFacilitiesService.insertFacilitiesImage(commandMap.getMap());
		System.out.println(mv);
		return mv;
		}
	
	//부대시설 상세보기
	@RequestMapping(value="admin/facilitiesDetail")
	public ModelAndView adminFacDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/facilitiesDetail");
			
		Map<String, Object> map = adminFacilitiesService.adminFacDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	//부대시설 수정 "폼"(이 메소드 안에선 수정 처리 로직 X)	
	@RequestMapping(value="admin/modifyFacilitiesForm")
	public ModelAndView AdminNoticeModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/modifyFacilitiesForm");
		
		Map<String, Object> map = adminFacilitiesService.adminFacDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
}
