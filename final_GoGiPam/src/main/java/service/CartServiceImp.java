package service;

import java.util.List;
import java.util.Map;

import dao.CartDAO;
import dto.CartDTO;

public class CartServiceImp implements CartService {
	private CartDAO cdao;

	public CartServiceImp() {
	}

	public void setCdao(CartDAO cdao) {
		this.cdao = cdao;
	}

	@Override
	public List<CartDTO> cartListPro(String member_id) {
		return cdao.selectCart(member_id);
	}

	@Override
	public CartDTO updateCartPro(Map<String, Object> map) {
		return cdao.updateCartAmount(map);
	}

	@Override
	public List<CartDTO> deleteCartPro(int cart_num, String member_id) {
		return cdao.deleteCart(cart_num, member_id);
	}

}
