package service;

import java.util.List;

import dao.AddressDAO;
import dto.AddressDTO;

public class AddressServiceImp implements AddressService {
	
	private AddressDAO adao;
		
	public AddressServiceImp() {
	
	}

	public AddressServiceImp(AddressDAO adao) {
		this.adao = adao;
	}
	
	public void setAdao(AddressDAO adao) {
		this.adao = adao;
	}

	@Override
	public List<AddressDTO> insertAddressProcess(AddressDTO adto) {
		adao.insertAddress(adto);
		return adao.selectAddress(adto.getMember_id());
	}

	@Override
	public List<AddressDTO> updateAddressProcess(AddressDTO adto) {
		adao.updateAddress(adto);
		return adao.selectAddress(adto.getMember_id());
	}

	@Override
	public List<AddressDTO> deleteAddressProcess(AddressDTO adto) {
		adao.deleteAddress(adto);
		return adao.selectAddress(adto.getMember_id());
		
	}

	@Override
	public List<AddressDTO> selectAddressProcess(String member_id) {
		return adao.selectAddress(member_id);
	}

	@Override
	public int countAddressProcess(String member_id) {
		return adao.countAddress(member_id);
	}

}
