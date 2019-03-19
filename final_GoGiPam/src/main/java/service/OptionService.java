package service;

import java.util.List;

import dto.OptionDTO;

public interface OptionService {
	public List<OptionDTO> loadOptionProcess(String item_title);
}
