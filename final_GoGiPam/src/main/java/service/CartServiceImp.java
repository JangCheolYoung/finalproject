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
	public List<CartDTO> cartListProcess(String member_id) {
		return cdao.selectCart(member_id);
	}

	@Override
	public CartDTO updateCartProcess(Map<String, Object> map) {
		return cdao.updateCartAmount(map);
	}

	@Override
	public List<CartDTO> deleteCartProcess(int cart_num, String member_id) {
		return cdao.deleteCart(cart_num, member_id);
	}

	@Override
	public List<CartDTO> insertCartProcess(CartDTO cdto) {
		return cdao.insertCart(cdto);
	}

	@Override
	public List<CartDTO> dupOrderProcess(CartDTO cdto) {
		return cdao.dupOrderCart(cdto);
	}

	@Override
	public int dupChkProcess(CartDTO cdto) {
		return cdao.dupChkCart(cdto);
	}

}
