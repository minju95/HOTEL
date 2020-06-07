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
import hotel.user.service.RoomService;
import hotel.user.service.RoomServiceImpl;


@Controller
public class RoomController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RoomService")
	private RoomService roomService;
	 
	@RequestMapping("/roomslist")
	public ModelAndView selectRoom(CommandMap commandMap) throws Exception {
		// view 화면인 main.jsp에 DB로부터 읽어온 데이터를 보여준다.
		ModelAndView mv = new ModelAndView("room/roomList");
		//addObject view에 넘어가는 데이터
		List<Map<String,Object>> list = roomService.selectRoom(commandMap.getMap());
		mv.addObject("list", list);
		System.out.println(mv);
		return mv;
	}
	
	
	@RequestMapping(value="/rooms")
	public ModelAndView selectTypeByRoom(CommandMap commandMap) 
		throws Exception{
		ModelAndView mv = new ModelAndView("room/room");
		
		Map<String, Object> map = roomService.selectTypeByRoom(commandMap.getMap());
		mv.addObject("map", map);
		System.out.println(mv);
		return mv;
	}
}
