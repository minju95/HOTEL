package hotel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminQnAService;
import hotel.common.common.CommandMap;

@Controller
public class AdminQnAController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminQnAService")
	private AdminQnAService adminQnAService;
	
	//관리자: Q&A 목록
	@RequestMapping(value="/admin/adminQnAList")
	public ModelAndView adminQnAList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminQnAList");

		List<Map<String, Object>> list = adminQnAService.selectQnAList(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/admin/selectQnAList")
	public ModelAndView selectQnAList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = adminQnAService.selectQnAList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	//관리자: Q&A 상세보기
	@RequestMapping(value="/admin/adminQnADetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminQnADetail");
				
		Map<String, Object> map = adminQnAService.qnaDetail(commandMap.getMap());
		mv.addObject("map",map); //기존의 게시글 상세정보
		
		System.out.println(mv);
		return mv;
	}
	
	//관리자: Q&A 답변달기
	@RequestMapping(value="/admin/adminQnAReplyForm")
	public ModelAndView adminQnAReply(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("/admin/adminQnAwriteReply");
		Map<String,Object> map= adminQnAService.qnaDetail(commandMap.getMap());
		mv.addObject("map",map);
		return mv;
	}
	
	@RequestMapping(value="/admin/adminQnAwriteReply")
	public ModelAndView updateTable(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/adminQnAList");
		adminQnAService.qnaReply(commandMap.getMap());
		return mv;
	}
	
	
}
