package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CardDTO;

public class CardDAOImp implements CardDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public CardDAOImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CardDTO> selectCard(String member_id) {
		return sqlSession.selectList("card.selectCard", member_id);
	}

	@Override
	public void insertCard(CardDTO cdto) {
		sqlSession.insert("card.insertCard", cdto);
		
	}

	@Override
	public void deleteCard(CardDTO cdto) {
		sqlSession.delete("card.deleteCard", cdto);
		
	}

	@Override
	public void selectDefault(CardDTO cdto) {
		sqlSession.update("card.selectDefault", cdto);
		
	}

	@Override
	public void selectnonDefault(CardDTO cdto) {
		sqlSession.update("card.selectnonDefault", cdto);
		
	}

	@Override
	public CardDTO viewDefaultCard(String member_id) {
		return sqlSession.selectOne("card.viewDefaultCard", member_id);
	}

}
