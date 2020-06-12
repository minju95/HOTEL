package hotel.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReservationService {

	/*예약 메인 리스트, /reservation/main - get */
	List<Map<String, Object>> selectRooms(Map<String, Object> map) throws Exception;
	
	/*예약 메인 검색 리스트, /reservation/main - post */
	List<Map<String, Object>> searchRooms(Map<String, Object> map) throws Exception;
	
	/*메인 > 예약, /reservation/writeForm - post, RES_ID  CAR_ID 가져오기 */
	int selectResId() throws Exception;
	int selectCarId() throws Exception;
	
	/*예약화면 결제하기, /reservation/pay - post */
	List<Map<String, Object>> insert(Map<String, Object> map) throws Exception;
	
	/*결제완료화면 취소하기, /reservation/cancel - post */
	void cancelReservation(Map<String, Object> map) throws Exception;
	
	/*결제완료화면 취소하기, /reservation/cancel - post */
	void cancelCard(Map<String, Object> map) throws Exception;
	
	/*roomView*/
	List<Map<String, Object>> roomView(Map<String, Object> map) throws Exception;
	
}
