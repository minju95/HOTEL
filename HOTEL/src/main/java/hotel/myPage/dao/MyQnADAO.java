package hotel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("MyQnADAO")
public class MyQnADAO extends AbstractDAO{

	//리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("qna.selectQnAList", map);
	}
	
	//등록
	public void insertQNA(Map<String, Object> map) throws Exception{
		insert("qna.insertQNA", map);
	}
}
