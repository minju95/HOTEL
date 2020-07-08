package hotel.myPage.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.service.MemberService;

@Controller
public class MyFavoriteController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name="MemberService")
	private MemberService memberService;
	
	//나의 관심목록
	@RequestMapping(value="/myFavorite")
		public ModelAndView myPage() throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myFavorite");
		return mv;
	}

}
