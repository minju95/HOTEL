package hotel.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/*import org.apache.log4j.Logger;*/
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.common.CommandMap;
import hotel.user.dao.ReservationDao;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService{

	/* Logger log = Logger.getLogger(this.getClass()); */
	
	@Resource(name="reservationDAO")
	private ReservationDao reservationDAO;
	
	/*예약 메인 리스트, /reservation/main - get */
	@Override
	public List<Map<String, Object>> selectRooms(Map<String, Object> map)
	throws Exception {
		return reservationDAO.selectRooms(map);
	}
	
	/*예약 메인 검색 리스트, /reservation/main - post */
	@Override
	public List<Map<String, Object>> searchRooms(Map<String, Object> map)
	throws Exception {
		return reservationDAO.searchRooms(map);
	}
	
	/*메인 > 예약, /reservation/writeForm - post, RES_ID  CAR_ID 가져오기 */
	@Override
	public int selectResId() throws Exception {
		return reservationDAO.selectResId();
	}
	@Override
	public int selectCarId() throws Exception {
		return reservationDAO.selectCarId();
	}
	
	/*예약화면 결제하기, /reservation/pay - post */
	@Override
	public List<Map<String, Object>> insert(Map<String, Object> map)
	throws Exception {
		reservationDAO.insertCard(map);
		reservationDAO.insertReservation(map);
		
		return reservationDAO.selectResult(map);
	}
	
	/*결제완료화면 취소하기, /reservation/cancel - post */
	@Override
	public void cancelReservation(Map<String, Object> map) throws Exception {
		reservationDAO.deleteReservation(map);
	}
	/*결제완료화면 취소하기, /reservation/cancel - post */
	@Override
	public void cancelCard(Map<String, Object> map) throws Exception {
		reservationDAO.deleteCard(map);
	}
	
	/*roomView*/
	@Override
	public List<Map<String, Object>> roomView(Map<String, Object> map) throws Exception {
		return reservationDAO.roomView(map);
	}
	
	@Override
	public List<Map<String, Object>> selectUserResList(Map<String, Object> map) throws Exception {
		return reservationDAO.selectUserResList(map);
	}
	
	/*test kakao */
	@Override
	public List<Map<String, Object>> kakaoInsert(Map<String, Object> map)
	throws Exception {
		reservationDAO.kakaoInsertReservation(map);
		
		return reservationDAO.kakaoSelectResult(map);
	}
	
}
