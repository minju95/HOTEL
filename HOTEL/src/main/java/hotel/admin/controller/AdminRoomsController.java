package hotel.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminRoomsService;
import hotel.common.common.CommandMap;

@Controller
public class AdminRoomsController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminRoomsService")
	private AdminRoomsService adminRoomsService;

	//객실 목록 조회
	@RequestMapping(value="/admin/roomsList")
    public ModelAndView roomsList(CommandMap commandMap) throws Exception{
		
    	ModelAndView mv = new ModelAndView("/admin/roomsList");
    	
    	List<Map<String,Object>> list = adminRoomsService.selectRoomsList(commandMap.getMap());

    	mv.addObject("list", list);

    	return mv;
    }

	//객실 목록 페이징
	@RequestMapping(value="/admin/selectRoomsList")
	public ModelAndView selectRoomsList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = adminRoomsService.selectRoomsList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	//객실 등록 폼 이동
		@RequestMapping(value="/admin/newRoomForm")
		public ModelAndView modifyMemForm() throws Exception{
			ModelAndView mv = new ModelAndView("/admin/newRoomForm");
			
			return mv;
		}
	//객실 등록 폼 이동
		@RequestMapping(value="/admin/modifyRoomForm")
		public ModelAndView modifyRoomForm() throws Exception{
			ModelAndView mv = new ModelAndView("/admin/modifyRoomForm");
			
			return mv;
		}
		
}
