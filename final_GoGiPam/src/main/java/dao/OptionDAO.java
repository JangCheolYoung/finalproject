package dao;

import java.util.List;

import dto.OptionDTO;

public interface OptionDAO {
	public List<OptionDTO> loadFullOption(String item_key);
	public String loadOptionKey(OptionDTO odto);
	public String loadOption(String option_key);
}
