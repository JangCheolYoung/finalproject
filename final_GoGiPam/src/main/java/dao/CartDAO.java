package dao;

import java.util.List;
import java.util.Map;

import dto.CartDTO;

public interface CartDAO {
	public List<CartDTO> selectCart(String member_id);
	
	// 카트 수량 체크
	public int countCart(String member_id);
	
	// 증감 시켜주는 메소드.
	public CartDTO updateCartAmount(Map<String, Object> map);
	
	// cart에서 데이터 삭제해주고 리스트 반환.
	public List<CartDTO> deleteCart(int cart_num, String member_id);
	
	// cart에 insert
	public List<CartDTO> insertCart(CartDTO cdto);
	
	// cart 중복 사항이 있을 경우 처리해야하므로 검사
	public int dupChkCart(CartDTO cdto);
	
	// cart에 중복된 사항이 들어올 경우 수량만 증가 시킴.
	public List<CartDTO> dupOrderCart(CartDTO cdto);
	
	// 결제완료시 전부 장바구니 전부 제거
	public void deleteAllCart(String member_id);
}
