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
import hotel.common.service.MemberService;
import hotel.common.service.SignUpService;

@Controller
public class SignUpController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="SignUpService")
	private SignUpService signUpService;
	@Resource(name="LoginService")
	private LoginService loginService;
	@Resource(name="MemberService")
	private MemberService memberService;
	
	//회원 가입 폼 이동  
	@RequestMapping(value="/signUpTerms")
	public ModelAndView SignUpForm1() throws Exception{
		ModelAndView mv = new ModelAndView("/common/signUpTerms");
		
		return mv;
	}
	
	//회원 가입 폼 이동
	@RequestMapping(value="/signUpForm")
	public ModelAndView SignUpForm2() throws Exception{
		ModelAndView mv = new ModelAndView("/common/signUpForm");
			
		return mv;
	}

	//회원 가입 처리
	@RequestMapping(value="/signUpComplete")
	public ModelAndView signUpComplete(CommandMap commandMap) throws Exception{
			
		signUpService.insertSignUp(commandMap.getMap());

		ModelAndView mv = new ModelAndView("/common/signUpComplete");
		Map<String, Object> list = memberService.selectMemInfo2(commandMap.getMap());
		System.out.println(list);
		mv.addObject("list",list);
		//mv.addObject("MEM_USERID", commandMap.get("MEM_USERID"));
		System.out.println(mv);
		return mv;
	}
	
	
	//아이디 중복 체크
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int selectIdCheck(@RequestParam("mem_userid") String mem_userid) throws Exception{
		
		int cnt = signUpService.selectIdCheck(mem_userid);
		return cnt;
	}
	
	//이메일 인증 (회원가입)
    @RequestMapping(value = "/emailAuth", produces = "application/json")
    // produces = "application/json": 요청에 대한 응답 형태로 json형식의 데이터를 원할 경우
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam String MEM_EMAIL) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "Complete your sign up!";
        StringBuilder sb = new StringBuilder();
        sb.append(" Please enter 5-digit code on the website to verify your email address as follows: "
        			+ "<span style=\"color:blue;font-weight:bold;font-size:15px;\">"
        			+ joinCode+"</span>");
        
        return loginService.send(subject, sb.toString(), "1teampjt@gmail.com", MEM_EMAIL, null);
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
