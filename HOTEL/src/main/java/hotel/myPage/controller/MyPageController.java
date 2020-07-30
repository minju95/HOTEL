package hotel.myPage.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminMemberService;
import hotel.common.common.CommandMap;
import hotel.common.service.MemberService;

@Controller
public class MyPageController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name="MemberService")
	private MemberService memberService;
	
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;
	
	
	//마이페이지(메인)
	@RequestMapping(value="/myPage")
		public ModelAndView myPage(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myMembership");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");
		commandMap.put("MEM_USERID", id);
		Map<String, Object> map = memberService.selectMemInfo2(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}

}
