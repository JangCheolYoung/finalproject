package service;

import java.util.List;

import dao.OptionDAO;
import dto.OptionDTO;

public class OptionServiceImp implements OptionService {
	
	private OptionDAO odao;
	
	public OptionServiceImp() {
		
	}
	
	public void setOdao(OptionDAO odao) {
		this.odao = odao;
	}

	@Override
	public List<OptionDTO> loadOptionProcess(String item_title) {
		return odao.loadOption(item_title);
	}
	
}
