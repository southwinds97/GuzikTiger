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
import com.edu.springboot.product.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@Controller
public class OrderController {

	@Autowired
	IOrderService orderService;
	
	@Autowired
	IProductService iProductService;
	
	ProductDTO productDTO = new ProductDTO();
	OrderDTO orderDTO = new OrderDTO()	;
	
	/**************** 장바구니 ***********************/
	// 장바구니페이지 조회
	@GetMapping("/cartList.do")
	public String cartList(Model model, HttpServletRequest req) {
		String member_id  =(String)req.getSession().getAttribute("id");
		ArrayList<ProductDTO> lists = orderService.selectCart(member_id);
		model.addAttribute("lists", lists);
		return "orderTest/cart2";
	}
	 // 장바구니 등록 처리
   @PostMapping("/cartInsert.do")
   public String RegistProc(HttpServletRequest req, HttpServletResponse resp, ProductDTO productDTO, Model model) {
       
   	ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
   	
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
		ProductDTO productDTO = new ProductDTO();
		String member_id = req.getParameter("member_id");
		String cart_dtl_id = req.getParameter("cart_dtl_id");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		productDTO.setMember_id(member_id);
		productDTO.setCart_dtl_id(cart_dtl_id);
		productDTO.setQuantity(quantity);
		int result = orderService.updateCart(productDTO);
		return "orderTest/cart2";
	}
		
	// 장바구니페이지 품목삭제
	@GetMapping("/cartDelete.do")
	public String cartDelete(Model model, HttpServletRequest req) {
		ProductDTO productDTO = new ProductDTO();
		String member_id = req.getParameter("member_id");
		String cart_dtl_id = req.getParameter("cart_dtl_id");
		productDTO.setMember_id(member_id);
		productDTO.setCart_dtl_id(cart_dtl_id);
		int result = orderService.deleteCart(productDTO);
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
		List<ProductDTO> cartlist=new ArrayList<>();
			for(String str: list) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setCart_dtl_id(str);
				productDTO.setMember_id(member_id);
				cartlist.add(orderService.selectCartPayment(productDTO));
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
		//req.....productDTOList  상품상세 리스트로 받아오기 
	
		
	//	model.addAttribute("lists", productDTOList); 다시 결제페이지로 넘기기
		return "payment";
	}

	// 결제페이지에서 (결제)진행
	@PostMapping("/payment.do")
	public String paymentProc(Model model, HttpServletRequest req) {

		String product_id = req.getParameter("product_id");
		String option_id = req.getParameter("option_id");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setProduct_id(product_id);
		orderDTO.setOption_id(option_id);
		orderDTO.setQuantity(quantity);
		ArrayList<OrderDTO> lists = new ArrayList<OrderDTO>();
		lists.add(orderDTO);
		model.addAttribute("lists", lists);
		return "paymentComplet";
	}

	@RequestMapping("/orderList.do")
	public String orderList(Model model, HttpServletRequest req) {
		return "orderList";
	}
	
	@GetMapping("/pay.do")
	public String pay(Model model, HttpServletRequest req) {
		return "pay";
	}

}
