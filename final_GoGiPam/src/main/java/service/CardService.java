package service;

import java.util.List;

import dto.CardDTO;

public interface CardService {
	public List<CardDTO> selectCardProcess(String member_id);
	public List<CardDTO> insertCardProcess(CardDTO cardDto);
	public List<CardDTO> deleteCardProcess(CardDTO cardDto);
	public void selectDefaultProcess(CardDTO cardDto);
	public void selectnonDefaultProcess(CardDTO cardDto);
	public CardDTO viewDefaultCardProcess(String member_id);
}
