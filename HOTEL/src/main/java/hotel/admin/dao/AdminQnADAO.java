package hotel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hotel.common.dao.AbstractDAO;

@Repository("AdminQnADAO")
public class AdminQnADAO extends AbstractDAO {
	
	//관리자 페이지: Q&A 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("adminQnA.qnaList", map);
	}
	
	//관리자 페이지: Q&A 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnADetail(Map<String,Object>map)throws Exception{
		return (Map<String,Object>) selectOne("adminQnA.qnaDetail",map);
	}
	
	//관리자 페이지: Q&A 답변등록
	public void qnaReply(Map<String,Object> map)throws Exception{
		update("adminQnA.qnaReply",map);
	}
}
