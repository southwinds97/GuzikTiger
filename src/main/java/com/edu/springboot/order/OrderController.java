package com.edu.springboot.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.tomcat.util.json.JSONParser;
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
	OrderDTO orderDTO = new OrderDTO();

	/**************** 장바구니 ***********************/
	// 장바구니페이지 조회
	@GetMapping("/cartList.do")
	public String cartList(Model model, HttpServletRequest req, ProductDTO productDTO) {
		String member_id = (String) req.getSession().getAttribute("id");
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
			// 장바구니 성공 메세지
			JSFunction.alertLocation(resp, "장바구니에 상품이 추가되었습니다.", "/");
			return null;
		} else {
			// 장바구니 실패
			JSFunction.alertBack(resp, "장바구니에 상품 등록이 실패했습니다.");
			return null;
		}
	}

	// ajax quantity 변경 조회
	@PostMapping("/cartListAjax.do")
	@ResponseBody
	public ArrayList<ProductDTO> cartListAjax(Model model, HttpServletRequest req, ProductDTO productDTO) {
		String member_id = (String) req.getSession().getAttribute("id");
		productDTO.setMember_id(member_id);
		ArrayList<ProductDTO> cartList = orderService.selectCart(productDTO);
		model.addAttribute("cartList", cartList);
		return cartList;
	}

	// ajax 체크 변경 조회
	@RequestMapping(value = "/cartListAjaxChk.do", method = { RequestMethod.POST })
	@ResponseBody
	public ArrayList<ProductDTO> cartListAjaxChk(Model model, HttpServletRequest req, ProductDTO productDTO,
			@RequestParam(value = "chkList") List<String> chkList) {
		String member_id = (String) req.getSession().getAttribute("id");
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
		int quantity = Integer.parseInt(quantityStr);
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

		if (cart_dtl_id_list == null) {
			productDTO.setMember_id(member_id);
			productDTO.setCart_dtl_id(cart_dtl_id);
			int result = orderService.deleteCart(productDTO);
			return "redirect:/cartList.do";
		} else {
			productDTO.setMember_id(member_id);
			String[] str = cart_dtl_id_list.split(",");
			productDTO.setCart_dtl_id_list(Arrays.asList(str));
			int result = orderService.deleteCartSel(productDTO);
			return "redirect:/cartList.do";
		}
	}

	/**************** 결제(창) ***********************/
	// 장바구니에서 결제페이지로
	@RequestMapping("/payment.do")
	public String payment(Model model, HttpServletRequest req, HttpServletResponse res, OrderDTO orderDTO) {

		String member_id = (String) req.getSession().getAttribute("id");
		String cart_dtl_id_list = req.getParameter("cart_dtl_id_list");
		if (cart_dtl_id_list == null) {
			orderDTO.setMember_id(member_id);
			ArrayList<OrderDTO> orderDTOList = orderService.selectCartPaymentAll(orderDTO);
			model.addAttribute("orderList", orderDTOList);
		} else {
			String[] str = cart_dtl_id_list.split(",");
			System.out.println(str);
			orderDTO.setMember_id(member_id);
			orderDTO.setCart_dtl_id_list(Arrays.asList(str));

			ArrayList<OrderDTO> orderDTOList = orderService.selectCartPaymentSel(orderDTO);
			model.addAttribute("orderList", orderDTOList);
		}

		return "order/pay";
	}

	// 결제페이지에서 품목삭제 후 다시 결제 페이지로
	@GetMapping("/paymentDelete.do")
	public String paymentDelete(Model model, HttpServletRequest req, OrderDTO orderDTO) {
		ProductDTO productDTO = new ProductDTO();
		String member_id = (String) req.getSession().getAttribute("id");
		String cart_dtl_id = req.getParameter("cart_dtl_id_del");
		productDTO.setMember_id(member_id);
		productDTO.setCart_dtl_id(cart_dtl_id);
		int result = orderService.deletePayment(productDTO);

		String paymentList = req.getParameter("paymentList");
		String[] str = paymentList.split(",");
		orderDTO.setMember_id(member_id);

		orderDTO.setCart_dtl_id_list(Arrays.asList(str));

		ArrayList<OrderDTO> orderDTOList = orderService.selectCartPaymentSel(orderDTO);
		model.addAttribute("orderList", orderDTOList);

		return "order/pay";
	}

	// 상세페이지에서 결제 페이지로 진행
	@PostMapping("/productOrderPage.do")
	public String productOrderPage(Model model, HttpServletRequest req) {
		// req.....productDTOList 상품상세 리스트로 받아오기

		// model.addAttribute("lists", productDTOList); 다시 결제페이지로 넘기기
		return "payment";
	}

	// 결제페이지에서 (결제)진행
	@PostMapping("/payProcess.do")
	@ResponseBody
	public String payProcess(Model model, HttpServletRequest req, OrderDTO orderDTO) throws IOException {
		String member_id = (String) req.getSession().getAttribute("id");

		// 결제상품 정보
		String intlOrder = req.getParameter("intlOrder");
		// 결제금액 정보
		String paymentInfo = req.getParameter("paymentInfo");
		// 결제자 정보
		String orderInfo = req.getParameter("orderInfo");
		/*----------insert 테스트를 위한 하드코딩---------*/

		System.out.println(intlOrder + "#######");
		System.out.println(paymentInfo + "#######");
		System.out.println(orderInfo + "#######");

		// 주문테이블
		orderDTO.setMember_id("admin");
		orderDTO.setOrder_name("관리자");
		orderDTO.setOrder_phone("010-9077-1999");
		orderDTO.setOrder_addr("서울 종로 더좋은");
		orderDTO.setOrder_amount(148000);
		orderDTO.setPayment("현금");
		orderDTO.setDeliv_charge("무료");
		orderDTO.setOrder_prog("주문완료");
		orderDTO.setDeliv_prog("배송준비중");

		int result = orderService.insertOrder(orderDTO);

		// 생성된 order_id 받기
		String o_id = orderDTO.getOrder_id();
		System.out.println("o_id" + o_id);
		if (result > 0) {
			OrderDTO orderDTODtl1 = new OrderDTO();
			// 주문상세(품목)테이블
			ArrayList<OrderDTO> orderDTOList = new ArrayList<>();
			orderDTODtl1.setOrder_id(o_id);
			orderDTODtl1.setProduct_id("P10636");
			orderDTODtl1.setOption_id("흑호 뚱랑이");
			orderDTODtl1.setQuantity(2); // 35000원
			orderDTOList.add(orderDTODtl1);

			OrderDTO orderDTODtl2 = new OrderDTO();
			orderDTODtl2.setOrder_id(o_id);
			orderDTODtl2.setProduct_id("P10670");
			orderDTODtl2.setOption_id("보냉백");
			orderDTODtl2.setQuantity(1); // 28000원
			orderDTOList.add(orderDTODtl2);

			OrderDTO orderDTODtl3 = new OrderDTO();
			orderDTODtl3.setOrder_id(o_id);
			orderDTODtl3.setProduct_id("P10670");
			orderDTODtl3.setOption_id("보냉백+피크닉매트 세트");
			orderDTODtl3.setQuantity(1); // 57000원
			orderDTOList.add(orderDTODtl3);

			int result2 = orderService.insertOrderDtl(orderDTOList);
			System.out.println(result2);
		}

		return "paymentComplet";
	}

	// 회원정보 수정(정보 가져오기)
	@GetMapping("/payMember.do")
	@ResponseBody
	public MemberDTO payMember(HttpServletRequest req, MemberDTO memberDTO, Model model) {
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
