package service;

import java.util.List;

import dao.OrderDAO;
import dto.OrderDTO;

public class OrderServiceImp implements OrderService {
	
	private OrderDAO orderDao;
	
	public OrderServiceImp() {
		
	}

	public void setOrderDao(OrderDAO orderDao) {
		this.orderDao = orderDao;
	}


	@Override
	public List<OrderDTO> orderListProcess(String member_id) {
		return orderDao.orderList(member_id);
	}

	@Override
	public List<OrderDTO> orderInsertProcess(OrderDTO orderDto) {
		orderDao.orderInsert(orderDto);
		return orderDao.orderList(orderDto.getMember_id());
	}

	@Override
	public List<OrderDTO> orderStatusUpdateProcess(OrderDTO orderDto) {
		orderDao.orderStatusUpdate(orderDto);
		return orderDao.orderList(orderDto.getMember_id());
	}

	@Override
	public List<OrderDTO> orderDeleteProcess(OrderDTO orderDto) {
		orderDao.orderDelete(orderDto);
		return orderDao.orderList(orderDto.getMember_id());
	}

	@Override
	public void orderSeqProcess() {
		orderDao.orderSeq();
	}
	
}
