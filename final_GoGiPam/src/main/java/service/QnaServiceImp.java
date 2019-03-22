package service;

import java.util.List;
import java.util.Map;

import dao.QnaDAO;
import dto.QnaDTO;

public class QnaServiceImp implements QnaService {
	private QnaDAO qdao;

	public QnaServiceImp() {
	}

	public void setQdao(QnaDAO qdao) {
		this.qdao = qdao;
	}
	
	@Override
	public int countPro(String member_id) {
		return qdao.count(member_id);
	}
	@Override
	public void insertQuestionPro(QnaDTO qdto) {
		qdao.insertQuestion(qdto);
	}

	@Override
	public List<QnaDTO> listQuestionPro(Map<String, Object> map) {
		return qdao.listQuestion(map);
	}

	

}
