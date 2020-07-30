package hotel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import hotel.admin.dao.AdminQnADAO;

@Service("AdminQnAService")
public class AdminQnAServiceImpl implements AdminQnAService {
	@Resource(name="AdminQnADAO")
	private AdminQnADAO adminQnADAO;
	
	Logger log = Logger.getLogger(this.getClass());

	@Override
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception {
		return adminQnADAO.selectQnAList(map);
	}

	@Override
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return adminQnADAO.selectQnADetail(map);
	}

	@Override
	public void qnaReply(Map<String, Object> map) throws Exception {
		adminQnADAO.qnaReply(map);
	}
	
			
}
