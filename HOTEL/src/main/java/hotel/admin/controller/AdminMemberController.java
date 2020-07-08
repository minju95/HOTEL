package hotel.admin.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import hotel.admin.service.AdminMemberService;
import hotel.common.common.CommandMap;

@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberSerivce;
	
	//회원 목록
	@RequestMapping(value="/admin/memberList", method=RequestMethod.GET)
	public ModelAndView adminMemberList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView("/admin/adminMemberList");  
			
		List<Map<String,Object>>list=adminMemberSerivce.selectMemInfo(commandMap.getMap());
		
		mv.addObject("list",list);
		 
		return mv;
	}
	
	//회원 목록 (json 형태)
	@RequestMapping(value="/admin/selectMemList")
	public ModelAndView selectFacList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = adminMemberSerivce.selectMemInfo(commandMap.getMap());
		
		mv.addObject("list", list);
		System.out.println(list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
}

	

