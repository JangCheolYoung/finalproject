package service;

import java.util.List;

import dao.CardDAO;
import dto.CardDTO;

public class CardServiceImp implements CardService {

	private CardDAO cardDao;

	public CardServiceImp() {
		
	}

	public void setCardDao(CardDAO cardDao) {
		this.cardDao = cardDao;
	}

	@Override
	public List<CardDTO> selectCardProcess(String member_id) {
		return cardDao.selectCard(member_id);
	}

	@Override
	public List<CardDTO> insertCardProcess(CardDTO cardDto) {
		cardDao.insertCard(cardDto);
		return cardDao.selectCard(cardDto.getMember_id());
	}

	@Override
	public List<CardDTO> deleteCardProcess(CardDTO cardDto) {
		cardDao.deleteCard(cardDto);
		return cardDao.selectCard(cardDto.getMember_id());
	}

	@Override
	public void selectDefaultProcess(CardDTO cardDto) {
		cardDao.selectDefault(cardDto);
	}

	@Override
	public void selectnonDefaultProcess(CardDTO cardDto) {
		cardDao.selectnonDefault(cardDto);
	}

	@Override
	public CardDTO viewDefaultCardProcess(String member_id) {
		return cardDao.viewDefaultCard(member_id);
	}

}
