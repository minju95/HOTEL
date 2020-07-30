package hotel.common.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController {
	Logger log = Logger.getLogger(this.getClass());
	
	//호텔 소개 페이지
	@RequestMapping(value = "/information")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
	  ModelAndView mv = new ModelAndView("common/hotelInformation");
	  return mv;
	 }
}
