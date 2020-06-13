package hotel.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.admin.service.AdminRoomsService;
import hotel.common.common.CommandMap;
import hotel.user.service.ReservationService;

@Controller
public class AdminRoomsController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminRoomsService")
	private AdminRoomsService adminRoomsService;
	
	@Resource(name = "ReservationService")
	private ReservationService reservationService;

	//객실 목록 조회
	@RequestMapping(value="/admin/roomsList")
    public ModelAndView roomsList(CommandMap commandMap) throws Exception{
		
    	ModelAndView mv = new ModelAndView("/admin/roomsList");
    	
    	List<Map<String,Object>> list = adminRoomsService.selectRoomsList(commandMap.getMap());
    	mv.addObject("list", list);

    	return mv;
    }

	//객실 목록 페이징
	@RequestMapping(value="/admin/selectRoomsList")
	public ModelAndView selectRoomsList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = adminRoomsService.selectRoomsList(commandMap.getMap());
		
		
		mv.addObject("list", list);
		
		
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	//객실 등록 폼 이동
		@RequestMapping(value="/admin/newRoomForm")
		public ModelAndView modifyMemForm(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/admin/newRoomForm");
			
			List<Map<String,Object>> list = adminRoomsService.selectRoomType(commandMap.getMap());
			
			mv.addObject("list", list);
			
			return mv;
		}
		
	//객실 등록
		@RequestMapping(value="/admin/newRoom")
		public ModelAndView newRoom(CommandMap commandMap, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("/admin/roomsList");
			
			//ROOM_TYPE을 이름으로 변경 (ex : 1 -> Business Double)
			String ROOM_NAME = (String)commandMap.get("ROOM_TYPE");
			System.out.println(ROOM_NAME);
			String room_name[] = {
					"Business Double",
					"Business Twin",
					"Superior Double",
					"Superior Twin",
					"Drama Suite",
					"Deluxe Suite",
					"Premium Suite",
					"Sienna Suite"
			};
			
			for(int i=1; i<=8; i++) {
				if(ROOM_NAME.equals(Integer.toString(i))) {
					ROOM_NAME = room_name[i-1];
				}
			}
			commandMap.getMap().put("ROOM_NAME", ROOM_NAME);
		
			//,구분자를 하나로 합침
			List fac = new ArrayList();
			StringBuilder sb = new StringBuilder("");
			
			for(int i=1; i<=11; i++) {
				if((String)commandMap.get("fac"+i) != "" && (String)commandMap.get("fac"+i) != null) {
					fac.add((String) commandMap.get("fac"+i));
				}
			}
			
			for(int i=0; i<fac.size(); i++) {
				sb.append(fac.get(i)+",");
			}
			String ROOM_FAC_NAME = sb.substring(0, sb.length()-1);

			commandMap.put("ROOM_FAC_NAME", ROOM_FAC_NAME);
			
			adminRoomsService.insertNewRoom(commandMap.getMap(), request);
			
			return mv;
		}
		
		// 객실 상세보기
		/*
		 * @RequestMapping(value = "/admin/roomsDetail") public ModelAndView
		 * roomsDetail(CommandMap commandMap) throws Exception { ModelAndView mv = new
		 * ModelAndView("/admin/roomsDetail"); System.out.println(commandMap.getMap());
		 * 
		 * Map<String, Object> map =
		 * adminRoomsService.selectRoomsDetail(commandMap.getMap()); mv.addObject("map",
		 * map.get("map")); //기존의 게시글 상세정보 mv.addObject("list", map.get("list")); //첨부파일
		 * 목록
		 * 
		 * return mv; }
		 */

		// 객실 수정 폼 이동
		@RequestMapping(value = "/admin/modifyRoomForm")
		public ModelAndView modifyRoomForm(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("/admin/modifyRoomForm");
			List<Map<String,Object>> list = adminRoomsService.selectRoomType(commandMap.getMap());
			mv.addObject("type", list);
			
			Map<String, Object> map = adminRoomsService.selectRoomsDetail(commandMap.getMap());
			mv.addObject("map", map.get("map"));
			System.out.println("map : "+map.get("map"));
			mv.addObject("list", map.get("list"));
			System.out.println("list"+map.get("list"));

			return mv;
		}
		
		// 객실 수정처리
		@RequestMapping(value="/admin/modifyRoom")
		public ModelAndView modifyRoom(CommandMap commandMap, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/admin/roomsList");
			
			//ROOM_TYPE을 이름으로 변경 (ex : 1 -> Business Double)
			String ROOM_NAME = (String)commandMap.get("ROOM_TYPE");
			System.out.println(commandMap.getMap());
			String room_name[] = {
					"Business Double",
					"Business Twin",
					"Superior Double",
					"Superior Twin",
					"Drama Suite",
					"Deluxe Suite",
					"Premium Suite",
					"Sienna Suite"
			};
			
			for(int i=1; i<=8; i++) {
				if(ROOM_NAME.equals(Integer.toString(i))) {
					ROOM_NAME = room_name[i-1];
				}
			}
			commandMap.getMap().put("ROOM_NAME", ROOM_NAME);
			//,구분자를 하나로 합침
			List fac = new ArrayList();
			StringBuilder sb = new StringBuilder("");
			
			for(int i=1; i<=11; i++) {
				if((String)commandMap.get("fac"+i) != "" && (String)commandMap.get("fac"+i) != null) {
					fac.add((String) commandMap.get("fac"+i));
				}
			}
			
			for(int i=0; i<fac.size(); i++) {
				sb.append(fac.get(i)+",");
			}
			String ROOM_FAC_NAME = sb.substring(0, sb.length()-1);

			commandMap.put("ROOM_FAC_NAME", ROOM_FAC_NAME);
			adminRoomsService.modifyRoom(commandMap.getMap(), request);
			mv.addObject("ROOM_ID", commandMap.get("ROOM_ID"));
			
			return mv;
		}
		
		// 객실 삭제
		@RequestMapping(value="admin/deleteRoom")
		public ModelAndView deleteRoom(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/admin/roomsList");
			System.out.println("삭제컨트롤러"+commandMap.getMap());
			adminRoomsService.deleteRoom(commandMap.getMap());
				
			return mv;
		}
		
}
