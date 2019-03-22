package service;

import java.util.List;
import java.util.Map;

import dto.QnaDTO;

public interface QnaService {
	
	public int countPro(String member_id);
	public List<QnaDTO> listQuestionPro(Map<String, Object> map);
	
	public void insertQuestionPro(QnaDTO dto);
}
