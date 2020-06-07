
package hotel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminReservationService;
import hotel.common.common.CommandMap;
import hotel.common.logger.LoggerAspect;

@Controller
public class AdminReservationController {
	Logger log = Logger.getLogger(LoggerAspect.class);
	
	@Resource(name="AdminReservationService")
	private AdminReservationService adminReservationService;
	
	//리스트
	@RequestMapping(value ="/admin/reservationList") //단순히 reservationList.jsp를 호출하는 역할만 담당
	public ModelAndView reservationList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/reservationList");
		List<Map<String, Object>> list = adminReservationService.selectResList(commandMap.getMap());
		//System.out.println(list.get(0));
		
		mv.addObject("list", list);
				
		return mv;
	}
	
	//검색
	 @RequestMapping(value ="/admin/selectResList") public ModelAndView
	 searchReservationList(CommandMap commandMap) throws Exception {
	ModelAndView mv = new ModelAndView("jsonView"); //jsonView: 데이터를 json형식으로 변환해주는 역할
	 List<Map<String,Object>> list = adminReservationService.selectResList(commandMap.getMap());
	 mv.addObject("list", list);
	 
	 if(list.size() > 0) {
		 mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	 } else{
		 mv.addObject("TOTAL", 0);
	}
	
	 System.out.println(mv);
	 System.out.println(list);
	 return mv;
	 
	 }
	 
	
}
