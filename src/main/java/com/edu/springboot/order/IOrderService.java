package com.edu.springboot.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.edu.springboot.product.ProductDtlDTO;

import jakarta.servlet.http.HttpServletRequest;

@Mapper
public interface IOrderService {
	
	// 주문 목록 조회
	public OrderDTO selectOrder(String member_id);
	// 주문 등록
	public int insertOrder(OrderDTO orderDTO );
	// 주문 상세등록
	public int  insertOrderDtl(List<OrderDetailDTO> orderDetailDTOList);
	
	
	
			/* 결제 */
	//상세페이지에서 선택한 항목 결제창에 뿌리기
	public String orderProc(Model model, HttpServletRequest req);
	
	//장바구니에서 선택한 항목 셀렉트 (결제창에 뿌리기)
	//public ProductDtlDTO selectCartPayment(ProductDtlDTO productDtlDTO);
	public ProductDtlDTO selectCartPayment (ProductDtlDTO productDtlDTO);
	
	
			/* 장바구니 */
	//장바구니 조회
	public ArrayList<ProductDtlDTO> selectCart(String member_id);
	//장바구니 등록
	public int insertCart(List<ProductDtlDTO> productDtlDTOList);
	//장바구니 수정
	public int updateCart(ProductDtlDTO productDtlDTO);
	//장바구니 삭제
	public int deleteCart(ProductDtlDTO productDtlDTO);
	
}
