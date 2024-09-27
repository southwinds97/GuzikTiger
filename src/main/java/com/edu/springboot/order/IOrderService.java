package com.edu.springboot.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IOrderService {
	
	// 주문 목록 조회
	public OrderDTO selectOrder(String member_id);
	
	//장바구니
	public ArrayList<Order_detailDTO> selectCart(String member_id);
	
	// 주문 등록
	public int insertOrder(OrderDTO orderDTO );
	// 주문 상세등록
	public int  insertOrderDtl(List<Order_detailDTO> order_detailDTO);
}
