package service;

import java.util.List;

import dto.ItemDTO;

public interface ListService {
	public ItemDTO listContentProcess(String item_key);
	public List<ItemDTO> listGroupProcess(String item_category);
	public List<ItemDTO> listAllProcess();
}
