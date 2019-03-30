package service;

import java.util.List;

import dto.OptionDTO;

public interface OptionService {
	public List<OptionDTO> loadFullOptionProcess(String item_key);
	public String loadOptionKeyProcess(OptionDTO odto);
	public String loadOptionProcess(String option_key);
}
