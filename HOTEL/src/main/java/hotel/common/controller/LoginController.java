package hotel.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.common.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="LoginService")
	private LoginService loginService;

	//로그인 폼 이동
		@RequestMapping(value="/loginForm")
		public ModelAndView loginForm() throws Exception{
			ModelAndView mv = new ModelAndView("/common/loginForm");
			
			return mv;
		}
		// 로그인 성공 or 실패시

		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public ModelAndView login(CommandMap commandMap, HttpSession session) throws Exception {
			// 로그인했을때 전달받을 주소값
			ModelAndView mv = new ModelAndView();

			Map<String, Object> map = loginService.selectLogin(commandMap.getMap());
			String id = (String) map.get("MEM_USERID");
			int type = Integer.parseInt(map.get("MEM_TYPE").toString());
			
			// 로그인 실패
			if (id == null) {
				mv.addObject("MESSAGE","잘못된 정보입니다 다시 입력 하세요");
				mv.setViewName("alert/alertPage");

				// 로그인 성공
			} else {
				mv.setViewName("redirect:/main");
				if (type == 1) {
					session.setAttribute("USERID", id);
				}
				else {
					session.setAttribute("USERID", id);
					session.setAttribute("ADMIN", "Y");
				}
			}

			return mv;

		}
		
		
	//아이디 찾기 폼 이동
		@RequestMapping(value="/idSearchForm")
		public ModelAndView idSearchForm() throws Exception{
			ModelAndView mv = new ModelAndView("/common/idSearchForm");
			
			return mv;
		}
		
	//아이디 찾기 폼 이동
		@RequestMapping(value="/passwordResetForm")
		public ModelAndView passwordResetForm() throws Exception{
			ModelAndView mv = new ModelAndView("/common/passwordResetForm");
			
			return mv;
		}
}
