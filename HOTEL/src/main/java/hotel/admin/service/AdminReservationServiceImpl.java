package hotel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import hotel.admin.dao.AdminReservationDAO;

@Service("AdminReservationService")
public class AdminReservationServiceImpl implements AdminReservationService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminReservationDAO")
	private AdminReservationDAO adminReservationDAO;
	
	//리스트
	@Override
	public List<Map<String, Object>> reservationList(Map<String, Object> map) throws Exception {
		return adminReservationDAO.reservationList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectReservationList(Map<String, Object> map) throws Exception {
		return adminReservationDAO.selectReservationList(map);
	}

}
