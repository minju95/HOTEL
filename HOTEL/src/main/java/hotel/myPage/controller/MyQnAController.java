package hotel.myPage.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.common.service.MemberService;
import hotel.myPage.service.MyQnAService;

@Controller
public class MyQnAController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MemberService")
	private MemberService memberService;
	
	@Resource(name="MyQnAService")
	private MyQnAService myQnAService;
	
	//나의 Q&A리스트
	@RequestMapping(value="/myQnA")
		public ModelAndView myPage(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myQnA");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");
		
		commandMap.put("MEM_USERID", id);

		List<Map<String, Object>> list = myQnAService.selectQnAList(commandMap.getMap());
		Map<String, Object> map = memberService.selectMemInfo2(commandMap.getMap());
		
		mv.addObject("list", list);
		mv.addObject("map", map);
		return mv;
	}
	
	
	@RequestMapping(value="/qnaList")
	public ModelAndView selectFacList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");
		System.out.println("세션 USERID 값 : "+id);
		
		commandMap.put("MEM_USERID", id);
		List<Map<String, Object>> list = myQnAService.selectQnAList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}

	//Q&A 등록폼
	@ResponseBody
	@RequestMapping(value="/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myPage/qnaWriteForm");
		

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");
		
		commandMap.put("MEM_USERID", id);

		Map<String, Object> map = memberService.selectMemInfo2(commandMap.getMap());
		
		mv.addObject("map", map);
		
		
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
	
	//Q&A 상세화면
	@RequestMapping("/qnaDetail")
	public ModelAndView facilitiesDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/myPage/myQnADetail");
		//addObject view에 넘어가는 데이터
		//List<Map<String,Object>> list = memberService.
		//mv.addObject("list", list);
		//System.out.println(mv);
		return mv;
	}
}
