package hotel.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/*import org.apache.log4j.Logger;*/
import org.springframework.stereotype.Service;
import hotel.user.dao.ReservationDao;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService{

	/* Logger log = Logger.getLogger(this.getClass()); */
	
	@Resource(name="reservationDAO")
	private ReservationDao reservationDAO;
	
	@Override
	public List<Map<String, Object>> selectRooms(Map<String, Object> map)
	throws Exception {
		return reservationDAO.selectRooms(map);
	}
	
	@Override
	public int selectResId()
	throws Exception {
		return reservationDAO.selectResId();
	}
	
	@Override
	public int selectCarId()
	throws Exception {
		return reservationDAO.selectCarId();
	}
	
	@Override
	public List<Map<String, Object>> searchRooms(Map<String, Object> map)
	throws Exception {
		return reservationDAO.searchRooms(map);
	}
	
	@Override
	public List<Map<String, Object>> insert(Map<String, Object> map)
	throws Exception {
		reservationDAO.insertReservation(map);
		reservationDAO.insertCard(map);
		
		return reservationDAO.selectResult(map);
	}
	
	
}
