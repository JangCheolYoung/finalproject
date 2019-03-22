package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CartDTO;

public class CartDAOImp implements CartDAO {
	private SqlSessionTemplate sqlSession;

	public CartDAOImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CartDTO> selectCart(String member_id) {
		return sqlSession.selectList("cart.list", member_id);
	}

	@Override
	public CartDTO updateCartAmount(Map<String, Object> map) {
		sqlSession.update("cart.update", map); 
		return sqlSession.selectOne("cart.item", map.get("cart_num"));
	}

	@Override
	public List<CartDTO> deleteCart(int cart_num, String member_id) {
		sqlSession.delete("cart.del", cart_num);
		return sqlSession.selectList("cart.list", member_id);
	}

}
