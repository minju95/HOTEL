package hotel.common.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

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
import hotel.common.service.SignUpService;

@Controller
public class SignUpController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="SignUpService")
	private SignUpService signUpService;
	@Resource(name="LoginService")
	private LoginService loginService;
	
	//회원 가입 폼 이동
	@RequestMapping(value="/signUpForm")
	public ModelAndView SignUpForm() throws Exception{
		ModelAndView mv = new ModelAndView("/common/signUpForm");
		
		return mv;
	}
	//회원 가입 처리
	@RequestMapping(value="/signUp")
	public ModelAndView insertSignUp(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/main");
		
		signUpService.insertSignUp(commandMap.getMap());
		
		return mv;
	}
	//아이디 중복 체크
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int selectIdCheck(@RequestParam("mem_userid") String mem_userid) throws Exception{
		
		int cnt = signUpService.selectIdCheck(mem_userid);
		
		return cnt;
	}
	
	//이메일 인증-회원가입
    @RequestMapping(value = "/emailAuth", produces = "application/json")
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam String user_email) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "<HOTEL> 회원가입 인증 코드입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        return loginService.send(subject, sb.toString(), "1teampjt@gmail.com", user_email, null);
    }
    
    //이메일 인증확인
    @RequestMapping(value = "/emailAuthCheck", produces = "application/json")
    @ResponseBody
    public ModelAndView emailAuth(HttpSession session, @RequestParam String joinCode) {
    	ModelAndView mv = new ModelAndView("jsonView");
    	String originalJoinCode = (String)session.getAttribute("joinCode");
    	log.debug("originalJoinCode >>>>"+originalJoinCode +" & "+joinCode);
    	if(originalJoinCode.equals(joinCode)) mv.addObject("result","complete");
    	else mv.addObject("result","fail");
    	
    	return mv;
    }
}
