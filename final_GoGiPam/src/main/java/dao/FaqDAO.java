package dao;

import java.util.List;

import dto.FaqDTO;

public interface FaqDAO {
	public List<FaqDTO> list(String faq_category);
	public int count();
}
