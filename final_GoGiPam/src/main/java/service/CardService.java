package service;

import java.util.List;

import dto.CardDTO;

public interface CardService {
	public List<CardDTO> selectCardProcess(String member_id);
	public List<CardDTO> insertCardProcess(CardDTO cdto);
	public List<CardDTO> deleteCardProcess(CardDTO cdto);
	public void selectDefaultProcess(CardDTO cdto);
	public void selectnonDefaultProcess(CardDTO cdto);
	public CardDTO viewDefaultCardProcess(String member_id);
}
