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
		ModelAndView mv = new ModelAndView("redirect:/main");
		
		reservationService.cancelReservation(commandMap.getMap());
		reservationService.cancelCard(commandMap.getMap());
		
		return mv;
	}
	
	// RESERVATION result > cancel
	@RequestMapping(value = "/reservation/resCancel", method = RequestMethod.POST)
	public ModelAndView resCancel(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/resList");
		
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
	
	// RESERVATION test kakaoPay 
	@RequestMapping(value = "/reservation/kakao")
	public ModelAndView kakao(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/kakao");
		List<Map<String, Object>> list = reservationService.kakaoInsert(commandMap.getMap());
		
		mv.addObject("list", list);
		return mv;
	}

	
	// RESERVATION test
	@RequestMapping(value = "/payments/complete")
	public ModelAndView complete() throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/complete");
		return mv;
	}
	
	// RESERVATION test
	@RequestMapping(value = "/order/payFail")
	public ModelAndView payFail() throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/payFail");
		return mv;
	}
	
	// RESERVATION test
	@RequestMapping(value = "/order/paySuccess")
	public ModelAndView paySuccess() throws Exception {
		ModelAndView mv = new ModelAndView("/order/paySuccess");
		return mv;
	}
	 
	
	// RESERVATION userList
	@RequestMapping(value = "/reservation/resList")
	public ModelAndView reservationList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/reservation/resList");
		List<Map<String, Object>> list = reservationService.selectUserResList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	// RESERVATION search userList
	@RequestMapping(value ="/reservation/searchResList", method = RequestMethod.POST)
	public ModelAndView searchReservationList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = reservationService.selectUserResList(commandMap.getMap());
		mv.addObject("list", list);
	 
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else{
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
}
