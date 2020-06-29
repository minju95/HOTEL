package hotel.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.common.service.MemberService;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MemberService")
	private MemberService memberService;

	
	//수정 전 비밀번호 확인
	@RequestMapping(value="/modifyMemForm", method=RequestMethod.GET)
	public ModelAndView pwdCheck() throws Exception{
		ModelAndView mv = new ModelAndView("/common/pwdCheck");
			
		return mv;
	}
	
	//회원 정보 수정 폼 이동
		@RequestMapping(value="/modifyMemForm", method=RequestMethod.POST)
		public ModelAndView select(CommandMap commandMap,HttpSession session) throws Exception {
			
			ModelAndView mv = new ModelAndView();
			String id = (String) session.getAttribute("USERID");
			commandMap.put("MEM_USERID", id);
			
			String pw =(String)memberService.selectMyLogin(commandMap.getMap(),"MEM_USERID");
			Map<String, Object> MemberInfo;
			
			if(id.equals(pw)) {
				
				mv.setViewName("/common/modifyMemForm");
				MemberInfo = memberService.selectMemInfo(id);
				mv.addObject("MemberInfo",MemberInfo);
						
			}else{
				mv.addObject("alert","비밀번호가 올바르지 않습니다.");
				mv.setViewName("/common/pwdCheck");
			}
			return mv;
		}
				
	//회원 정보 수정
		@RequestMapping(value="/modifyMem")
		public ModelAndView modifyMem(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/main");
			
			memberService.updateMember(commandMap.getMap());
			
			return mv;
		}
	//회원탈퇴 페이지 이동
		@RequestMapping(value="/deleteMemPage")
		public ModelAndView deleteMemPage(HttpSession session) throws Exception{
			ModelAndView mv = new ModelAndView("/common/deleteMemPage");
			
			String id = (String)session.getAttribute("USERID");
			mv.addObject("id", id);
			
			return mv;
		}
	//회원탈퇴 처리
		@RequestMapping(value="/deleteMem")
		@ResponseBody
		public ModelAndView deleteMem(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			
			String id = (String)session.getAttribute("USERID");
			commandMap.put("MEM_USERID", id);
			memberService.deleteMember(commandMap.getMap());
			session.removeAttribute("USERID");
			String url = request.getScheme()+"://"
						+request.getServerName()+":"
						+request.getServerPort()
						+request.getContextPath()+"/main";
			mv.addObject("URL", url);
			mv.addObject("result", "complete");
			
			return mv;
		}
}
