package service;

import java.util.List;

import dto.AddressDTO;

public interface AddressService {
	public List<AddressDTO> selectAddressProcess(String member_id);
	public List<AddressDTO> insertAddressProcess(AddressDTO adto);
	public List<AddressDTO> updateAddressProcess(AddressDTO adto);
	public List<AddressDTO> deleteAddressProcess(AddressDTO adto);
	public void selectdefaultProcess(AddressDTO adto);
	public void selectnondefaultProcess(AddressDTO adto);
	public AddressDTO viewdefaultAddressProcess(String member_id);
}
