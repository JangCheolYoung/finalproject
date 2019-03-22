package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.QnaDTO;

public class QnaDAOImp implements QnaDAO{
	private SqlSessionTemplate sqlSession;

	public QnaDAOImp() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count(String member_id) {
		return sqlSession.selectOne("qna.count", member_id);
	}
	@Override
	public void insertQuestion(QnaDTO qdto) {
		sqlSession.insert("qna.ins", qdto);
	}
	@Override
	public List<QnaDTO> listQuestion(Map<String, Object> map) {
		return sqlSession.selectList("qna.list", map);
	}

}
