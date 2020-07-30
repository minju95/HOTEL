package hotel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminMemberService;
import hotel.common.common.CommandMap;

@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;

	
	//회원 목록 조회
	@RequestMapping(value="/admin/memberList")
    public ModelAndView memberList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/admin/adminMemberList");
		List<Map<String, Object>> list = adminMemberService.selectMemInfo(commandMap.getMap());
		
		mv.addObject("list", list);
    	return mv;
    }
	
	//회원 목록 json 형태
	@RequestMapping(value="/admin/selectMemList")
	public ModelAndView selectMemList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = adminMemberService.selectMemInfo(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	//회원 상세보기
	@RequestMapping(value="admin/memberDetail")
	public ModelAndView memberDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminMemberDetail");
					
		Map<String, Object> map = adminMemberService.memberDetail(commandMap.getMap());
			
		mv.addObject("map", map);
		return mv;
	}
	
}
