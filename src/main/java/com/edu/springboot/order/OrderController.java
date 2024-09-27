package com.edu.springboot.order;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class OrderController {
	
	@Autowired
	IOrderService orderService;

	
	//장바구니페이지
	@GetMapping("/cart.do")
	public String cartOrder(Model model, HttpServletRequest req) {
		String member_id = "inee1945";
		ArrayList<Order_detailDTO> lists = orderService.selectCart(member_id) ;
		model.addAttribute("lists", lists);
		return "cart";
	}
	
	// 장바구니에서 결제페이지로 
	@PostMapping("/cartOrder.do")
	public String cartOrderProc(Model model, HttpServletRequest req) {
	
		String product_id = req.getParameter("cart_dtl_id");
		String member_id = "inee1945";
		Order_detailDTO order_detailDTO = new Order_detailDTO();
	//	ArrayList<Order_detailDTO> lists = orderService.selectOrderDtl(member_id) ;
		
	//	model.addAttribute("lists", lists);
		
		return "payment";
	}
	
	//상품 상세페이지 진입
	@GetMapping("/productDtl.do")
	public String productOrder() {
		return "productDtl";
	}
	
	// 상세페이지에서 결제 페이지로 진행 
	@PostMapping("/productOrder.do")
	public String orderProc(Model model, HttpServletRequest req) {
		
		String product_id = req.getParameter("product_id");
		String option_id = req.getParameter("option_id");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		Order_detailDTO order_detailDTO = new Order_detailDTO();
		order_detailDTO.setProduct_id(product_id);
		order_detailDTO.setOption_id(option_id);
		order_detailDTO.setQuantity(quantity);
		ArrayList<Order_detailDTO> lists = new ArrayList<Order_detailDTO>();
		lists.add(order_detailDTO);
		model.addAttribute("lists", lists);
		return "payment";
	}
	
	// 결제페이지에서 (결제)진행 
	@PostMapping("/payment.do")
	public String paymentProc(Model model, HttpServletRequest req) {
		
		String product_id = req.getParameter("product_id");
		String option_id = req.getParameter("option_id");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		Order_detailDTO order_detailDTO = new Order_detailDTO();
		order_detailDTO.setProduct_id(product_id);
		order_detailDTO.setOption_id(option_id);
		order_detailDTO.setQuantity(quantity);
		ArrayList<Order_detailDTO> lists = new ArrayList<Order_detailDTO>();
		lists.add(order_detailDTO);
		model.addAttribute("lists", lists);
		return "paymentComplet";
	}

}
