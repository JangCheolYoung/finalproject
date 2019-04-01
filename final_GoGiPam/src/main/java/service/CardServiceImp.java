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
	public List<CardDTO> insertCardProcess(CardDTO cdto) {
		cardDao.insertCard(cdto);
		return cardDao.selectCard(cdto.getMember_id());
	}

	@Override
	public List<CardDTO> deleteCardProcess(CardDTO cdto) {
		cardDao.deleteCard(cdto);
		return cardDao.selectCard(cdto.getMember_id());
	}

	@Override
	public void selectDefaultProcess(CardDTO cdto) {
		cardDao.selectDefault(cdto);
	}

	@Override
	public void selectnonDefaultProcess(CardDTO cdto) {
		cardDao.selectnonDefault(cdto);
	}

	@Override
	public CardDTO viewDefaultCardProcess(String member_id) {
		return cardDao.viewDefaultCard(member_id);
	}

}
