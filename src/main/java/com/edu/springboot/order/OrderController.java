package com.edu.springboot.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
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
	
	@Autowired
	private IMemberService dao;
	
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
	@PostMapping("/payProcess.do")
    @ResponseBody
	public String payProcess(Model model, HttpServletRequest req, OrderDTO orderDTO) throws IOException {
		String member_id = (String) req.getSession().getAttribute("id");
		
		
		String intlOrder = req.getParameter("obj");
		String paymentInfo = req.getParameter("paymentInfo");
		String orderInfo = req.getParameter("orderInfo");
		
		
		
		
		System.out.println(intlOrder);

		/*
		 *
		 * 
		 * 
		 * 
		 * orderDTO.setOrder_name(orderInfo)
		 * orderDTO.setOrder_phone(orderInfo)
		 * orderDTO.setOrder_addr(orderInfo)
		 *  orderDTO.setOrder_amount(0)
		 * orderDTO.setPayment(paymentInfo)
		 *  orderDTO.setPayment("현금");
		 * orderDTO.setDeliv_charge(orderInfo)
		 *  orderDTO.setOrder_prog("주문완료");
		 * orderDTO.setDeliv_prog("배송준비중");
		 */
		
	
		//int result = orderService.insertOrder(orderDTO);
	
		return "paymentComplet";
	}
	
	// 회원정보 수정(정보 가져오기)
    @GetMapping("/payMember.do")
    @ResponseBody
    public MemberDTO  payMember(HttpServletRequest req, MemberDTO memberDTO, Model model) {
        // 회원정보 가져오기
        String id = (String) req.getSession().getAttribute("id");
        MemberDTO dto = dao.viewMember(id);

        // 전화번호 나누기
        if (dto.getTel() != null) {
            String[] telParts = dto.getTel().split("-");
            if (telParts.length == 3) {
                model.addAttribute("tel1", telParts[0]);
                model.addAttribute("tel2", telParts[1]);
                model.addAttribute("tel3", telParts[2]);
            }
        }

        // 생년월일 나누기
        if (dto.getBirth() != null) {
            String[] birthParts = dto.getBirth().split("-");
            if (birthParts.length == 3) {
                model.addAttribute("year", birthParts[0]);
                model.addAttribute("month", birthParts[1]);
                model.addAttribute("day", birthParts[2]);
            }
        }

        model.addAttribute("member", dto);
        return dto;
    }

}
