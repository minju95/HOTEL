package hotel.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.common.service.SignUpService;

@Controller
public class SignUpController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="SignUpService")
	private SignUpService signUpService;
	
	/*
	 * @RequestMapping(value="/sample/openBoardList.do") public ModelAndView
	 * openBoardList(CommandMap commandMap) throws Exception{ ModelAndView mv = new
	 * ModelAndView("/sample/boardList");
	 * 
	 * List<Map<String,Object>> list =
	 * sampleService.selectBoardList(commandMap.getMap()); mv.addObject("list",
	 * list);
	 * 
	 * return mv; }
	 * 
	 * @RequestMapping(value="/sample/openBoardWrite.do") public ModelAndView
	 * openBoardWrite(CommandMap commandMap) throws Exception{ ModelAndView mv = new
	 * ModelAndView("/sample/boardWrite");
	 * 
	 * return mv; }
	 */
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
		System.out.println(cnt);
		
		return cnt;
	}
	
	
	/*
	  @RequestMapping(value="/sample/openBoardDetail.do") 
	  public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception { 
		  ModelAndView mv = new ModelAndView("/sample/boardDetail");
	  
		  Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap()); 
		  mv.addObject("map",map);
	  
		  return mv; 
	  }
	 */
	/*
	  @RequestMapping(value="/sample/openBoardUpdate.do") public ModelAndView
	  openBoardUpdate(CommandMap commandMap) throws Exception{ ModelAndView mv =
	  new ModelAndView("/sample/boardUpdate");
	  
	  Map<String,Object> map =
	  sampleService.selectBoardDetail(commandMap.getMap()); mv.addObject("map",
	  map);
	  
	  return mv; }
	  */
	  /*
	  @RequestMapping(value="/sample/updateBoard.do") public ModelAndView
	  updateBoard(CommandMap commandMap) throws Exception{ ModelAndView mv = new
	  ModelAndView("redirect:/sample/openBoardDetail.do");
	  
	  sampleService.updateBoard(commandMap.getMap());
	  
	  mv.addObject("IDX", commandMap.get("IDX")); return mv; }
	  */
	/*
	  @RequestMapping(value="/sample/deleteBoard.do") public ModelAndView
	  deleteBoard(CommandMap commandMap) throws Exception{ ModelAndView mv = new
	  ModelAndView("redirect:/sample/openBoardList.do");
	  
	  sampleService.deleteBoard(commandMap.getMap());
	  
	  return mv; }
 */
}
