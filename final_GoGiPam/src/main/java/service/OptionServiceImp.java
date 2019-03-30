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
	public List<OptionDTO> loadFullOptionProcess(String item_key) {
		return odao.loadFullOption(item_key);
	}

	@Override
	public String loadOptionKeyProcess(OptionDTO odto) {
		return odao.loadOptionKey(odto);
	}

	@Override
	public String loadOptionProcess(String option_key) {
		return odao.loadOption(option_key);
	}
	
}
