package dao;

import java.util.List;

import dto.AddressDTO;

public interface AddressDAO {
	public int countAddress(String member_id);
	public List<AddressDTO> selectAddress(String member_id);
	public List<AddressDTO> selectAccountAddress(AddressDTO adto);
	public void selectdefault(AddressDTO adto);
	public void selectnondefault(AddressDTO adto);
	public void insertAddress(AddressDTO adto);
	public void updateAddress(AddressDTO adto);
	public void deleteAddress(AddressDTO adto);
	public AddressDTO viewdefaultAddress(String member_id);
}
