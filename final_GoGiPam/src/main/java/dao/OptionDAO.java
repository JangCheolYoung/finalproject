package dao;

import java.util.List;

import dto.OptionDTO;

public interface OptionDAO {
	public List<OptionDTO> loadOption(String item_namekey);
}
