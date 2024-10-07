package com.edu.springboot.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.edu.springboot.product.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;

@Mapper
public interface IOrderService {
	
	// 주문 목록 조회
	 OrderDTO selectOrder(String member_id);
	// 주문 등록
	 int insertOrder(OrderDTO orderDTO );
	// 주문 상세등록
	 int  insertOrderDtl(List<OrderDTO> orderDTOList);
	
	
	
			/* 결제 */
	//상세페이지에서 선택한 항목 결제창에 뿌리기
	 String orderProc(Model model, HttpServletRequest req);
	
	//장바구니에서 선택한 항목 셀렉트 (결제창에 뿌리기)
	//public ProductDTO selectCartPayment(ProductDTO productDTO);
	 ProductDTO selectCartPayment (ProductDTO productDTO);
	
	
			/* 장바구니 */
	//장바구니 조회
	 ArrayList<ProductDTO> selectCart(String member_id);
	//장바구니 등록
	 int insertCart(List<ProductDTO> productDTOList);
	//장바구니 수정
	 int updateCart(ProductDTO productDTO);
	//장바구니 삭제
	 int deleteCart(ProductDTO productDTO);
	
}
