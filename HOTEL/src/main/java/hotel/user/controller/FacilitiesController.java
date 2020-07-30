package hotel.user.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;

import hotel.user.service.FacilitiesServiceImpl;


@Controller
public class FacilitiesController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FacilitiesService")
	private FacilitiesServiceImpl facilitiesService;
	
	//부대시설 목록
	@RequestMapping("/facilities")
	public ModelAndView facilitiesMain(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("facilities/facilitiesMain");
		Map<String, Object> map =commandMap.getMap();
		String FAC_HOTEL_TYPE=(String)commandMap.get("FAC_HOTEL_TYPE");
		mv.addObject("FAC_HOTEL_TYPE",FAC_HOTEL_TYPE);
		List<Map<String,Object>> list2 = facilitiesService.selectFacType(commandMap.getMap());
		mv.addObject("list2", list2);
		List<Map<String,Object>> list = facilitiesService.selectFacilities(commandMap.getMap());
		mv.addObject("list", list);
		
		System.out.println(mv);
		return mv;
	}
	
	//부대시설 상세화면
	@RequestMapping("/facilitiesDetail")
	public ModelAndView facilitiesDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("facilities/facilitiesDetail");
		Map<String, Object> map = facilitiesService.facDetail(commandMap.getMap());
		List<Map<String,Object>> list = facilitiesService.facImgsDetail(commandMap.getMap());
		mv.addObject("map", map);
		mv.addObject("list", list);
		System.out.println(mv);
		return mv;
	}
	
	
	//ajax로 데이터 받기
	@RequestMapping(value="/selectFacList", method=RequestMethod.POST)
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	String FAC_HOTEL_TYPE=(String)commandMap.get("FAC_HOTEL_TYPE");
    	
    	List<Map<String,Object>> list = facilitiesService.selectFacList(commandMap.getMap());
    	mv.addObject("list", list);
    	System.out.println(mv);
    	
    	return mv;
    }
	
}
