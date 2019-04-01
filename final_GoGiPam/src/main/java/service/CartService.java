package service;

import java.util.List;
import java.util.Map;

import dto.CartDTO;

public interface CartService {
	public List<CartDTO> cartListProcess(String member_id);
	public CartDTO updateCartProcess(Map<String, Object> map);
	public List<CartDTO> deleteCartProcess(int cart_num, String member_id);
	public List<CartDTO> insertCartProcess(CartDTO cdto);
	public int dupChkProcess(CartDTO cdto);
	public List<CartDTO> dupOrderProcess(CartDTO cdto);
}
