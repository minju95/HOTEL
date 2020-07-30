package hotel.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminFacilitiesService;
import hotel.admin.service.AdminMemberService;

@Controller
public class AdminMainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;
	
	//관리자 페이지 이동
	@RequestMapping(value="/admin/main")
	public ModelAndView AdminMainPage() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/main");
		System.out.println("회원 수 : "+adminMemberService.selectMemNum());
		mv.addObject("memNum", adminMemberService.selectMemNum());
		return mv;
	}
}