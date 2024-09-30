package com.edu.springboot.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.product.IProductService;
import com.edu.springboot.product.ProductDtlDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@Controller
public class OrderController {

	@Autowired
	IOrderService orderService;
	
	@Autowired
	IProductService iProductService;
	
	ProductDtlDTO productDtlDTO = new ProductDtlDTO();
	OrderDetailDTO orderDetailDTO = new OrderDetailDTO()	;
	
	/**************** 장바구니 ***********************/
	// 장바구니페이지 조회
	@GetMapping("/cartList.do")
	public String cartList(Model model, HttpServletRequest req) {
		String member_id  =(String)req.getSession().getAttribute("id");
		ArrayList<ProductDtlDTO> lists = orderService.selectCart(member_id);
		model.addAttribute("lists", lists);
		return "orderTest/cart2";
	}
	 // 장바구니 등록 처리
   @PostMapping("/cartInsert.do")
   public String RegistProc(HttpServletRequest req, HttpServletResponse resp, ProductDtlDTO productDtlDTO, Model model) {
       
   	ArrayList<ProductDtlDTO> list = new ArrayList<ProductDtlDTO>();
   	
       int result = orderService.insertCart(list);

       if (result > 0) {
           // 회원가입 성공 메세지
           JSFunction.alertLocation(resp, "회원가입이 완료되었습니다.", "/");
           return null;
       } else {
           // 회원가입 실패
           JSFunction.alertBack(resp, "회원가입에 실패했습니다.");
           return null;
       }
   }
	// 장바구니페이지 수량변경
	@GetMapping("/cartUpdate.do")
	public String cartUpdate(Model model, HttpServletRequest req) {
		ProductDtlDTO productDtlDTO = new ProductDtlDTO();
		String member_id = req.getParameter("member_id");
		String cart_dtl_id = req.getParameter("cart_dtl_id");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		productDtlDTO.setMember_id(member_id);
		productDtlDTO.setCart_dtl_id(cart_dtl_id);
		productDtlDTO.setQuantity(quantity);
		int result = orderService.updateCart(productDtlDTO);
		return "orderTest/cart2";
	}
		
	// 장바구니페이지 품목삭제
	@GetMapping("/cartDelete.do")
	public String cartDelete(Model model, HttpServletRequest req) {
		ProductDtlDTO productDtlDTO = new ProductDtlDTO();
		String member_id = req.getParameter("member_id");
		String cart_dtl_id = req.getParameter("cart_dtl_id");
		productDtlDTO.setMember_id(member_id);
		productDtlDTO.setCart_dtl_id(cart_dtl_id);
		int result = orderService.deleteCart(productDtlDTO);
		return "orderTest/cart2";
	}	

	
	/**************** 결제(창) ***********************/
	// 장바구니에서 결제페이지로
	//@PostMapping("/cartOrderPage.do")
	@RequestMapping(value="cartOrderPage.do", method={RequestMethod.POST})
	public String cartOrderPage(Model model, HttpServletRequest req, @RequestParam(value="data[]") String[] list) {
		System.out.println("***********"+list);
		String member_id  =(String)req.getSession().getAttribute("id");
		//String member_id = "inee1945";	
		List<ProductDtlDTO> cartlist=new ArrayList<>();
			for(String str: list) {
				ProductDtlDTO productDtlDTO = new ProductDtlDTO();
				productDtlDTO.setCart_dtl_id(str);
				productDtlDTO.setMember_id(member_id);
				cartlist.add(orderService.selectCartPayment(productDtlDTO));
			}
			System.out.println(cartlist);
			
		model.addAttribute("lists", cartlist);
		return "payment";
	}

	// 상품 상세페이지 진입
	@GetMapping("/productDtl.do")
	public String productOrder() {
		return "productDtl";
	}

	// 상세페이지에서 결제 페이지로 진행
	@PostMapping("/productOrderPage.do")
	public String productOrderPage(Model model, HttpServletRequest req) {
		//req.....productDtlDTOList  상품상세 리스트로 받아오기 
	
		
	//	model.addAttribute("lists", productDtlDTOList); 다시 결제페이지로 넘기기
		return "payment";
	}

	// 결제페이지에서 (결제)진행
	@PostMapping("/payment.do")
	public String paymentProc(Model model, HttpServletRequest req) {

		String product_id = req.getParameter("product_id");
		String option_id = req.getParameter("option_id");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
		orderDetailDTO.setProduct_id(product_id);
		orderDetailDTO.setOption_id(option_id);
		orderDetailDTO.setQuantity(quantity);
		ArrayList<OrderDetailDTO> lists = new ArrayList<OrderDetailDTO>();
		lists.add(orderDetailDTO);
		model.addAttribute("lists", lists);
		return "paymentComplet";
	}

	@RequestMapping("/orderList.do")
	public String orderList(Model model, HttpServletRequest req) {
		return "orderList";
	}
	
	@RequestMapping("/pay.do")
	public String pay(Model model, HttpServletRequest req) {
		return "pay";
	}

}
