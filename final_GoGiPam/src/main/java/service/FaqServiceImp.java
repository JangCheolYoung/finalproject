package service;

import java.util.List;

import dao.FaqDAO;
import dto.FaqDTO;

public class FaqServiceImp implements FaqService {
	private FaqDAO fdao;
	
	public FaqServiceImp() {
		
	}
	
	public FaqServiceImp(FaqDAO fdao) {
		this.fdao = fdao;
	}

	public void setFdao(FaqDAO fdao) {
		this.fdao = fdao;
	}

	@Override
	public List<FaqDTO> listProcess(String faq_category) {
		return fdao.list(faq_category);
	}

	@Override
	public int countPro() {
		return fdao.count();
	}

}
