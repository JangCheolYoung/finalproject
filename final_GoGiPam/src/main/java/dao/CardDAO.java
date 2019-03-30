package dao;

import java.util.List;

import dto.CardDTO;

public interface CardDAO {
	public List<CardDTO> selectCard(String member_id);
	public void insertCard(CardDTO cdto);
	public void deleteCard(CardDTO cdto);
	public void selectDefault(CardDTO cdto);
	public void selectnonDefault(CardDTO cdto);
	public CardDTO viewDefaultCard(String member_id);
}
