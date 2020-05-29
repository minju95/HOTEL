package hotel.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.common.service.JoinService;

@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="JoinService")
	private JoinService joinService;
	
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
	
	@RequestMapping(value="/join/joinWriteTEST")
	public ModelAndView joinWriteTEST() throws Exception{
		ModelAndView mv = new ModelAndView("/common/joinWriteTEST");
		
		return mv;
	}
	
	@RequestMapping(value="/join/memberVerify")
	public ModelAndView insertOneMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/main");
		
		joinService.insertOneMember(commandMap.getMap());
		
		return mv;
	}
	
	/*
	 * @RequestMapping(value="/sample/openBoardDetail.do") public ModelAndView
	 * openBoardDetail(CommandMap commandMap) throws Exception{ ModelAndView mv =
	 * new ModelAndView("/sample/boardDetail");
	 * 
	 * Map<String,Object> map =
	 * sampleService.selectBoardDetail(commandMap.getMap()); mv.addObject("map",
	 * map);
	 * 
	 * return mv; }
	 * 
	 * @RequestMapping(value="/sample/openBoardUpdate.do") public ModelAndView
	 * openBoardUpdate(CommandMap commandMap) throws Exception{ ModelAndView mv =
	 * new ModelAndView("/sample/boardUpdate");
	 * 
	 * Map<String,Object> map =
	 * sampleService.selectBoardDetail(commandMap.getMap()); mv.addObject("map",
	 * map);
	 * 
	 * return mv; }
	 * 
	 * @RequestMapping(value="/sample/updateBoard.do") public ModelAndView
	 * updateBoard(CommandMap commandMap) throws Exception{ ModelAndView mv = new
	 * ModelAndView("redirect:/sample/openBoardDetail.do");
	 * 
	 * sampleService.updateBoard(commandMap.getMap());
	 * 
	 * mv.addObject("IDX", commandMap.get("IDX")); return mv; }
	 * 
	 * @RequestMapping(value="/sample/deleteBoard.do") public ModelAndView
	 * deleteBoard(CommandMap commandMap) throws Exception{ ModelAndView mv = new
	 * ModelAndView("redirect:/sample/openBoardList.do");
	 * 
	 * sampleService.deleteBoard(commandMap.getMap());
	 * 
	 * return mv; }
	 */
}
