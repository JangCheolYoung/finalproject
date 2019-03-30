package service;

import java.util.List;

import dao.ListDAO;
import dto.ItemDTO;

public class ListServiceImp implements ListService {
	
	private ListDAO ldao;
	
	public ListServiceImp() { }
	
	public ListServiceImp(ListDAO ldao) {
		this.ldao = ldao;
	}
	
	public void setLdao(ListDAO ldao) {
		this.ldao = ldao;
	}

	@Override
	public ItemDTO listContentProcess(String item_key) {
		return ldao.listContent(item_key);
	}

	@Override
	public List<ItemDTO> listGroupProcess(String list_category) {
		return ldao.listGroup(list_category);
	}

	@Override
	public List<ItemDTO> listAllProcess() {
		return ldao.listAll();
	}

}
