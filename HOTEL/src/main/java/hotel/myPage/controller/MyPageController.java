package hotel.myPage.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.service.MemberService;

@Controller
public class MyPageController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name="MemberService")
	private MemberService memberService;
	
	//마이페이지
	@RequestMapping(value="/myPage")
		public ModelAndView myPage() throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myMembership");
		return mv;
	}

}
