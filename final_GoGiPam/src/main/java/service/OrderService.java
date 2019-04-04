package service;

import java.util.List;

import dto.OrderDTO;

public interface OrderService {
	public List<OrderDTO> orderListProcess(String member_id);
	public List<OrderDTO> orderInsertProcess(OrderDTO orderDto);
	public List<OrderDTO> orderStatusUpdateProcess(OrderDTO orderDto);
	public List<OrderDTO> orderDeleteProcess(OrderDTO orderDto);
	public void orderSeqProcess();
}
