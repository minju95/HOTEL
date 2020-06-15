package hotel.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainController {
	Logger log = Logger.getLogger(this.getClass());

	//관리자 페이지 이동 (메인페이지 -> 일별 객실 현황)
	@RequestMapping(value="/admin")
	public ModelAndView modifyMemForm() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/resDayList");
		// 내용 작성
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String aa = request.getSession().getServletContext().getRealPath("/resources/");

		System.out.println(aa);

		return mv;
	}
}
