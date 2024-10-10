package com.edu.springboot.order;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String cartList(Model model, HttpServletRequest req , ProductDTO productDTO) {
		String member_id  =(String)req.getSession().getAttribute("id");
		 if (member_id == null) {
	           return "redirect:/login.do";
	       }
		 productDTO.setMember_id(member_id);
		ArrayList<ProductDTO> cartList = orderService.selectCart(productDTO);
		model.addAttribute("cartList", cartList);
		return "order/cartList";
	}
	
	
		 // 장바구니 등록 처리
	  @PostMapping("/cartInsert.do")
	  public String RegistProc(HttpServletRequest req, HttpServletResponse resp, ProductDTO productDTO, Model model) {
	      
		 String memberId = (String) req.getSession().getAttribute("id");
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
	
	// ajax quantity 변경  조회
		@PostMapping("/cartListAjax.do")
		@ResponseBody
		public ArrayList<ProductDTO> cartListAjax(Model model, HttpServletRequest req , ProductDTO productDTO) {
			String member_id  =(String)req.getSession().getAttribute("id");
				productDTO.setMember_id(member_id);
				ArrayList<ProductDTO> cartList = orderService.selectCart(productDTO);
				model.addAttribute("cartList", cartList);
			    return cartList;
		}
	
	// ajax 체크 변경  조회
		@RequestMapping(value="/cartListAjaxChk.do", method={RequestMethod.POST})
		@ResponseBody
		public ArrayList<ProductDTO> cartListAjaxChk(Model model,HttpServletRequest req , ProductDTO productDTO,
				@RequestParam(value="chkList") List<String> chkList){
			String member_id  =(String)req.getSession().getAttribute("id");
				productDTO.setMember_id(member_id);
				productDTO.setCart_dtl_id_list(chkList);
				ArrayList<ProductDTO> cartList = orderService.selectCartChk(productDTO);
				model.addAttribute("cartList", cartList);
			    return cartList;
			}
		
	// 장바구니페이지 수량변경
	@GetMapping("/cartUpdate.do")
	public String cartUpdate(Model model, HttpServletRequest req, ProductDTO productDTO) {
		 String member_id = (String) req.getSession().getAttribute("id");
	     String cart_dtl_id = req.getParameter("cart_dtl_id");
	     String quantityStr = req.getParameter("quantity");
	     int  quantity = Integer.parseInt(quantityStr);
	     productDTO.setMember_id(member_id);
	     productDTO.setCart_dtl_id(cart_dtl_id);
	     productDTO.setQuantity(quantity);
	  int result = orderService.updateCart(productDTO);
	    System.out.println(result);
		return "redirect:/cartList.do";
	}
		
	// 장바구니페이지 품목삭제
	@GetMapping("/cartDelete.do")
	public String cartDelete(Model model, HttpServletRequest req) {
		ProductDTO productDTO = new ProductDTO();
		String member_id = (String) req.getSession().getAttribute("id");
		String cart_dtl_id = req.getParameter("cart_dtl_id");
		String cart_dtl_id_list = req.getParameter("cart_dtl_id_list");
		
		if(cart_dtl_id_list==null) {
			productDTO.setMember_id(member_id);
			productDTO.setCart_dtl_id(cart_dtl_id);
			int result = orderService.deleteCart(productDTO);
			return "redirect:/cartList.do";
		}else {
			productDTO.setMember_id(member_id);
			String[] str =  cart_dtl_id_list.split(",");
			productDTO.setCart_dtl_id_list(Arrays.asList(str));
			int result = orderService.deleteCartSel(productDTO);
			return "redirect:/cartList.do";
		}
	}	

	
	/**************** 결제(창) ***********************/
	// 장바구니에서 결제페이지로
	@RequestMapping("/payment.do")
	public String payment(Model model, HttpServletRequest req, HttpServletResponse res
			,OrderDTO orderDTO) {
		
		String member_id  =(String)req.getSession().getAttribute("id");
		String cart_dtl_id_list = req.getParameter("cart_dtl_id_list");
		if(cart_dtl_id_list==null) {
			orderDTO.setMember_id(member_id);
			ArrayList<OrderDTO> orderDTOList =  orderService.selectCartPaymentAll(orderDTO);
			model.addAttribute("orderList", orderDTOList);
		}else {
			String[] str =  cart_dtl_id_list.split(",");
			System.out.println(str);
			orderDTO.setMember_id(member_id);
			orderDTO.setCart_dtl_id_list(Arrays.asList(str));

			ArrayList<OrderDTO> orderDTOList =  orderService.selectCartPaymentSel(orderDTO);
			model.addAttribute("orderList", orderDTOList);
		}
		
		return "order/pay";
	}
	// 결제페이지에서 품목삭제 후 다시 결제 페이지로
		@GetMapping("/paymentDelete.do")
		public String paymentDelete(Model model, HttpServletRequest req ,OrderDTO orderDTO) {
			ProductDTO productDTO = new ProductDTO();
			String member_id = (String) req.getSession().getAttribute("id");
			String cart_dtl_id = req.getParameter("cart_dtl_id_del");
			productDTO.setMember_id(member_id);
			productDTO.setCart_dtl_id(cart_dtl_id);
			int result = orderService.deletePayment(productDTO);
			
			
			String paymentList = req.getParameter("paymentList");
			String[] str =  paymentList.split(",");
			orderDTO.setMember_id(member_id);
			
			orderDTO.setCart_dtl_id_list(Arrays.asList(str));
			
			ArrayList<OrderDTO> orderDTOList =  orderService.selectCartPaymentSel(orderDTO);
			model.addAttribute("orderList", orderDTOList);
			
			return "order/pay";
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
	@PostMapping("/pay.do")
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

}
