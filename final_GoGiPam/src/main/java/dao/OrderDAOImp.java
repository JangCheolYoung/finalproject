package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.OrderDTO;

public class OrderDAOImp implements OrderDAO{

	private SqlSessionTemplate sqlSession;
	
	public OrderDAOImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<OrderDTO> orderList(String member_id) {
		return sqlSession.selectList("order.orderList", member_id);
	}

	@Override
	public void orderInsert(OrderDTO orderDto) {
		sqlSession.insert("order.orderInsert", orderDto);
		
	}

	@Override
	public void orderStatusUpdate(OrderDTO orderDto) {
		sqlSession.update("order.orderStatusUpdate", orderDto);
		
	}

	@Override
	public void orderDelete(OrderDTO orderDto) {
		sqlSession.delete("order.orderDelete", orderDto);
		
	}
	
	
}
