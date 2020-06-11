package hotel.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import hotel.user.service.NoticeServiceImpl;
import hotel.common.common.CommandMap;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="NoticeService")
	private NoticeServiceImpl noticeService;
	
	  @RequestMapping(value = "/main") public ModelAndView
	  openSampleList(CommandMap commandMap) throws Exception {
	  ModelAndView mv = new ModelAndView("common/main");
	  
	  List<Map<String,Object>> list = noticeService.mainBoardList(commandMap.getMap());
  	  mv.addObject("list", list);
  	
	  return mv; }
	 
	
	
}
