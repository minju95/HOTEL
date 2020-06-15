package hotel.user.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/*import org.apache.log4j.Logger;*/
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.user.service.ReservationService;

@Controller
public class ReservationController {

	/* Logger log = Logger.getLogger(this.getClass()); */

	@Resource(name = "ReservationService")
	private ReservationService reservationService;

	// RESERVATION Main View
	@RequestMapping(value = "/reservation/main", method = RequestMethod.GET)
	public ModelAndView mainList(Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/main");
		List<Map<String, Object>> list = reservationService.selectRooms(map);
		mv.addObject("list", list);
		return mv;
	}

	// RESERVATION Search View - KeyWord (fromdate, todate, adult, child)
	@RequestMapping(value = "/reservation/main", method = RequestMethod.POST)
	public ModelAndView search(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/main");
		List<Map<String, Object>> list = reservationService.searchRooms(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	// RESERVATION Select > writeFrom
	@RequestMapping(value="/reservation/writeForm", method = RequestMethod.POST)
	public ModelAndView select() throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/writeForm");
		int RES_ID = reservationService.selectResId();
		int CAR_ID = reservationService.selectCarId();
		mv.addObject("RES_ID", RES_ID);
		mv.addObject("CAR_ID", CAR_ID);
		return mv;
	}
	
	// RESERVATION Select > pay
	@RequestMapping(value = "/reservation/pay", method = RequestMethod.POST)
	public ModelAndView next(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/result");
		List<Map<String, Object>> list = reservationService.insert(commandMap.getMap());
		//System.out.print("1::::::::"+commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}

	// RESERVATION result > cancel
	@RequestMapping(value = "/reservation/cancel", method = RequestMethod.POST)
	public ModelAndView cancel(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/common/main");
		
		reservationService.cancelReservation(commandMap.getMap());
		reservationService.cancelCard(commandMap.getMap());
		return mv;
	}
	
	// Room_view -- maincontoller 에 기재
	/*
	 * @RequestMapping(value = "/reservation/view") public ModelAndView
	 * roomView(CommandMap commandMap) throws Exception { ModelAndView mv = new
	 * ModelAndView("/reservation/view");
	 * 
	 * List<Map<String, Object>> list =
	 * reservationService.roomView(commandMap.getMap()); mv.addObject("list", list);
	 * return mv; }
	 */
	
}
