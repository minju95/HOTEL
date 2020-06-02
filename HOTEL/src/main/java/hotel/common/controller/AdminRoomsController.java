package hotel.common.controller;

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

import hotel.common.common.CommandMap;
import hotel.common.service.SignUpService;

@Controller
public class AdminRoomsController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="SignUpService")
	private SignUpService signUpService;

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
