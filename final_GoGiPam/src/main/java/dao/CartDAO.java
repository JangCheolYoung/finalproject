package dao;

import java.util.List;
import java.util.Map;

import dto.CartDTO;

public interface CartDAO {
	public List<CartDTO> selectCart(String member_id);
	
	// 증감 시켜주는 메소드.
	public CartDTO updateCartAmount(Map<String, Object> map);
	
	// cart에서 데이터 삭제해주고 리스트 반환.
	public List<CartDTO> deleteCart(int cart_num, String member_id);
}
