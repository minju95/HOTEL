package hotel.user.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;

import hotel.user.service.FacilitiesServiceImpl;


@Controller
public class FacilitiesController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FacilitiesService")
	private FacilitiesServiceImpl facilitiesService;
	 
	@RequestMapping("/facilitieslist")
	public ModelAndView selectFacilities(CommandMap commandMap) throws Exception {
		// view 화면인 main.jsp에 DB로부터 읽어온 데이터를 보여준다.
		ModelAndView mv = new ModelAndView("facilities/facilitieList");
		//addObject view에 넘어가는 데이터
		List<Map<String,Object>> list = facilitiesService.selectFacilities(commandMap.getMap());
		mv.addObject("list", list);
		System.out.println(mv);
		return mv;
	}
	
	
	@RequestMapping(value="/facilities")
	public ModelAndView selectTypeByFacilities(CommandMap commandMap) 
		throws Exception{
		ModelAndView mv = new ModelAndView("facilities/facilitie");
		List<Map<String,Object>> list = facilitiesService.selectFacilities(commandMap.getMap());
		mv.addObject("list", list);
		Map<String, Object> map = facilitiesService.selectTypeByFacilities(commandMap.getMap());
		mv.addObject("map", map);
		System.out.println(mv);
		
		return mv;
	}
}
