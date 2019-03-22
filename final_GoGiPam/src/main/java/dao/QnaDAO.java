package dao;

import java.util.List;
import java.util.Map;

import dto.QnaDTO;

public interface QnaDAO {
	public int count(String member_id);	
	public List<QnaDTO> listQuestion(Map<String, Object> map);	
	public void insertQuestion(QnaDTO qdto);
}
