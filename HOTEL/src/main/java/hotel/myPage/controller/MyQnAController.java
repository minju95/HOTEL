package hotel.myPage.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.myPage.service.MyQnAService;

@Controller
public class MyQnAController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name="MyQnAService")
	private MyQnAService myQnAService;
	
	//나의 Q&A리스트
	@RequestMapping(value="/myQnA")
		public ModelAndView myPage(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myQnA");
		List<Map<String, Object>> list = myQnAService.selectQnAList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}

	//Q&A 등록폼
	@ResponseBody
	@RequestMapping(value="/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/myPage/qnaWriteForm");
		return mv;
	}
	
	//Q&A 등록처리(json)
	@RequestMapping(value="/qnaWrite")
	public ModelAndView qnaWrite(CommandMap commandMap, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv = new ModelAndView("redirect:/myQnA");
		
		myQnAService.insertQNA(commandMap.getMap());
		System.out.println("json 데이터 : "+myQnAService.selectQnAList(commandMap.getMap()));
		return mv;
	}
}
