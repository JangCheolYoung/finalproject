package service;

import java.util.List;
import java.util.Map;

import dto.CartDTO;

public interface CartService {
	public List<CartDTO> cartListPro(String member_id);
	public CartDTO updateCartPro(Map<String, Object> map);
	public List<CartDTO> deleteCartPro(int cart_num, String member_id);
}
