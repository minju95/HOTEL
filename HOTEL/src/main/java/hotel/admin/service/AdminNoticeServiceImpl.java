package hotel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hotel.admin.dao.AdminNoticeDAO;

@Service("AdminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService{

	@Resource(name="AdminNoticeDAO")
	private AdminNoticeDAO adminNoticeDAO;
	
	
	//리스트
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return adminNoticeDAO.selectNoticeList(map);
	}
	
	//상세보기
	@Override
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception {
		return adminNoticeDAO.adminNoticeDetail(map);
	}
	
	//등록
	@Override
	public void insertNewNotice(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		adminNoticeDAO.insertNewNotice(map);
	}
	
	//삭제
	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		adminNoticeDAO.deleteNotice(map);
	}

	@Override
	public void modifyNotice(Map<String, Object> map, MultipartHttpServletRequest request)
			throws Exception {
		adminNoticeDAO.modifyNotice(map);
		
	}
	
}
