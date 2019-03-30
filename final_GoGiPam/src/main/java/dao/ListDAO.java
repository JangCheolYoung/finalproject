package dao;

import java.util.List;

import dto.ItemDTO;

public interface ListDAO {
	public ItemDTO listContent(String item_key);
	public List<ItemDTO> listGroup(String item_category);
	public List<ItemDTO> listAll();
}
