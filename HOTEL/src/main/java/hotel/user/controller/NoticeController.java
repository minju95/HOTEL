package hotel.user.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.user.service.NoticeServiceImpl;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeService")
	private NoticeServiceImpl noticeService;
	
	@RequestMapping(value="/board/list")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/board/boardList");
    
    	return mv;
    }
	
	@RequestMapping(value="/board/selectlist")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = noticeService.selectBoardList(commandMap.getMap());
    	mv.addObject("list", list);
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
    	
    	return mv;
    }
	
	@RequestMapping(value="/sample/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/boardWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/board/boardDetail")
	public ModelAndView AdminNoticeDetail(CommandMap commandMap) 
		throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		
		Map<String, Object> map = noticeService.selectNextBoard(commandMap.getMap());
		mv.addObject("map", map);
		System.out.println(mv);
		return mv;
	}
	
	/*@RequestMapping(value="/board/boardDetail")
	public ModelAndView selectNextBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		
		Map<String,Object> map = noticeService.selectNextBoard(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list",map.get("list"));
		System.out.println(mv);
		return mv;
	}*/
	
	
	
	
}
