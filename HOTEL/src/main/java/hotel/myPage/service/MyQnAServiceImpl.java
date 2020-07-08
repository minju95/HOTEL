package hotel.myPage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import hotel.myPage.dao.MyQnADAO;


@Service("MyQnAService")
public class MyQnAServiceImpl implements MyQnAService{
	
	@Resource(name="MyQnADAO")
	private MyQnADAO myQnADAO;
	
	//등록
	@Override
	public void insertQNA(Map<String, Object> map) throws Exception {
		myQnADAO.insertQNA(map);
	}
	//리스트
	@Override
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) myQnADAO.selectQnAList(map);
	}
	
}
