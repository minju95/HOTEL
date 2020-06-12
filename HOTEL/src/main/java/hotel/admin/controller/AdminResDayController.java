package hotel.admin.controller;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminResDayController {
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value="/admin/resDayList")
	public ModelAndView modifyMemForm() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/resDayList");

		return mv;
	}
}
