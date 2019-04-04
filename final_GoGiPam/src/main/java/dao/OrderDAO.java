package dao;

import java.util.List;

import dto.OrderDTO;

public interface OrderDAO {
	public List<OrderDTO> orderList(String member_id);
	public void orderInsert(OrderDTO orderDto);
	public void orderStatusUpdate(OrderDTO orderDto);
	public void orderDelete(OrderDTO orderDto);
}
