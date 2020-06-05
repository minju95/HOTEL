package hotel.common.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			
			
			
			// 로그인 실패
			if (map == null) {
				mv.addObject("MESSAGE","잘못된 정보입니다 다시 입력 하세요");
				mv.setViewName("/common/alertPage");

				// 로그인 성공
			} else {
				mv.setViewName("redirect:/main");
				int type = Integer.parseInt(map.get("MEM_TYPE").toString());
				if (type == 2) {
					session.setAttribute("ADMIN", "Y");
				}
				String id = (String) map.get("MEM_USERID");
				session.setAttribute("USERID", id);
					
			}

			return mv;

		}
	//로그아웃
		@RequestMapping(value="/logout")
		public ModelAndView logout(HttpSession session) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/main");
			
			session.removeAttribute("USERID");
			session.removeAttribute("ADMIN");
			
			return mv;
		}
		
		
	//아이디 찾기 폼 이동
		@RequestMapping(value="/idSearchForm")
		public ModelAndView idSearchForm() throws Exception{
			ModelAndView mv = new ModelAndView("/common/idSearchForm");
			
			return mv;
		}
	//아이디 찾기
		@RequestMapping(value="/idSearch", method=RequestMethod.POST)
		public String selectSearchMyId(HttpSession session, CommandMap commandMap, RedirectAttributes ra) throws Exception{
			String email = (String)commandMap.get("MEM_EMAIL");
			Map<String, Object> map = loginService.selectSearchMyId(commandMap.getMap());
			if (map == null) {
				  ra.addFlashAttribute("resultMsg", "입력된 정보가 일치하지 않습니다."); 
				  return  "redirect:/idSearchForm";
			  } 
			String user_name = (String)map.get("MEM_NAME");
			String user = (String)map.get("MEM_USERID");
			
			String subject = "<HOTEL>"+user_name+"님, 아이디 찾기 결과 입니다."; 
			StringBuilder sb = new  StringBuilder();
			sb.append("귀하의 아이디는 " + user + " 입니다.");
			loginService.send(subject, sb.toString(), "1teampjt@gmail.com",  email, null); 
			ra.addFlashAttribute("resultMsg", "아이디가 발송되었습니다. 이메일을 확인해주세요.");  
			
			return "redirect:/idSearchForm";
		}
		
	//비밀번호 초기화 폼 이동
		@RequestMapping(value="/passwordResetForm")
		public ModelAndView passwordResetForm() throws Exception{
			ModelAndView mv = new ModelAndView("/common/passwordResetForm");
			
			return mv;
		}
	// 비밀번호 초기화
	  @RequestMapping(value = "/passwordReset", method = RequestMethod.POST)
	  public String sendMailPassword(HttpSession session, CommandMap commandMap, RedirectAttributes ra) throws Exception{
		  String email = (String)commandMap.get("MEM_EMAIL");
		  String user = loginService.findPwd(commandMap.getMap());
		  
	      if (user == null) {
				  ra.addFlashAttribute("resultMsg", "입력된 정보가 일치하지 않습니다."); 
				  return  "redirect:/passwordResetForm";
			  } 
	          int ran = new Random().nextInt(100000) + 10000;
	          String password = String.valueOf(ran);
	          
	          commandMap.put("MEM_PW", password);
	          loginService.updatePwd(commandMap.getMap()); 
	          
	          String subject = "<HOTEL>임시 비밀번호입니다."; 
			  StringBuilder sb = new  StringBuilder();
			  sb.append("귀하의 임시 비밀번호는 " + password + " 입니다. 로그인 후 패스워드를 변경해 주세요.");
			  loginService.send(subject, sb.toString(), "1teampjt@gmail.com",  email, null); 
			  ra.addFlashAttribute("resultMsg", "비밀번호가 재설정 되었습니다. 이메일을 확인해주세요.");  
		   
		  return "redirect:/passwordResetForm"; 

	  }   
}
