package service;

import java.util.List;

import dto.FaqDTO;

public interface FaqService {
	public List<FaqDTO> listProcess(String faq_category);
	public int countPro();
}
