package com.edu.springboot.administrator;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.CommonController;
import com.edu.springboot.ParameterDTO;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.order.OrderDTO;
import com.edu.springboot.product.IProductService;
import com.edu.springboot.product.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;
import utils.PagingUtil;

import org.springframework.web.bind.annotation.GetMapping;

import com.edu.springboot.member.IMemberService;


@Controller
public class AdminController extends CommonController {

	@Autowired
	IProductService dao;

	@Autowired
	IMemberService memberDAO;

	@RequestMapping("/admin.do")
	public String adminPage(HttpServletRequest req, Model model, ParameterDTO parameterDTO, OrderDTO orderDTO,
			MemberDTO memberDTO) {
		// ArrayList<ProductDTO> productList = dao.adminProductSelect(parameterDTO);
		// model.addAttribute("productList", productList);

		String id = (String) req.getSession().getAttribute("id");
		String user_level = String.valueOf(req.getSession().getAttribute("user_level"));

		if (id == null) {
			return "redirect:/login.do";
		}

		if (user_level.equals("1")) {
			return "redirect:/";
		}

		ArrayList<OrderDTO> orderList = dao.adminOrderSelect(orderDTO);
		model.addAttribute("orderList", orderList);

		ArrayList<MemberDTO> memberList = dao.adminMemberSelect(memberDTO);
		model.addAttribute("memberList", memberList);

		return "administrator/admin"; // 경로 수정
	}

	@RequestMapping("/adminProductList.do")
	public String adminProductPage(HttpServletRequest req, Model model, ParameterDTO parameterDTO) {
		int pageNum = (req.getParameter("pageNum") == null || req.getParameter("pageNum").equals(""))
				? 1
				: Integer.parseInt(req.getParameter("pageNum"));
		int pageSize = 10; // 페이지당 항목 수
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		// 검색 키워드 설정
		String searchKey = req.getParameter("searchKey");
		parameterDTO.setSearchKeyword(searchKey);

		ArrayList<ProductDTO> productList = dao.adminProductSelect(parameterDTO);
		int totalCount = dao.getTotalCount(parameterDTO);
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, 5, pageNum,
				req.getContextPath() + "/adminProductList.do?");

		// 각 페이지의 시작 순번 계산
		int startSeq = (pageNum - 1) * pageSize;

		model.addAttribute("productList", productList);
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("startSeq", startSeq);

		return "administrator/productList_admin"; // JSP 페이지 경로 반환
	}

	// 상품등록진입
	@RequestMapping("/productWrite.do")
	public String productWrite() {
		return "administrator/productWrite";
	}

	// 상품등록 처리
	@PostMapping("/productWrite.do")
	public String RegistProc(HttpServletRequest req, HttpServletResponse resp, ProductDTO productDTO, Model model) {
		// 데이터 확인
		productDTO.setOption_id("적호뚱랑이");
		productDTO.setOption_yn("N");
		productDTO.setImg_id("tiger_rug.jpg");
		int result = dao.insertPorduct(productDTO);

		String product_id = productDTO.getProduct_id();

		productDTO.setProduct_id(product_id);
		productDTO.setIdx(1);
		productDTO.setSell_count(0);
		int result2 = dao.insertPorductDtl(productDTO);

		if (result > 0) {
			// 회원가입 성공 메세지
			JSFunction.alertLocation(resp, "상품등록이 완료되었습니다.", "/");
			return null;
		} else {
			// 회원가입 실패
			JSFunction.alertBack(resp, "상품등록이 실패했습니다.");
			return null;
		}
	}

	@RequestMapping("/chat")
	public String chat() {
		return "forward:/reactChat/index.html";
	}

	@RequestMapping("/chat/talk")
	public String talk(HttpServletRequest req, HttpServletResponse resp, Model model,
			@RequestParam("roomId") String roomId, @RequestParam("userId") String userId) {
		String id = (String) req.getSession().getAttribute("id");

		model.addAttribute("id", id);
		return "forward:/reactChat/index.html";
	}

	@GetMapping("/memberEdit.do")
	public String memberEdit(@RequestParam("member_id") String member_id, Model model) {
		String id = member_id;
		MemberDTO dto = memberDAO.viewMember(id);

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

		return "administrator/memberEdit_admin";
	}
	
	@PostMapping("/memberEdit.do")
	public String memberEditProc(HttpServletRequest req, HttpServletResponse resp, MemberDTO memberDTO, Model model) {

		int result = memberDAO.updateMember(memberDTO);

		if (result > 0) {
			// 회원가입 성공 메세지
			JSFunction.alertLocation(resp, "회원정보 수정이 완료되었습니다.", "/admin.do");
			return null;
		} else {
			// 회원가입 실패
			JSFunction.alertBack(resp, "회원정보 수정이 실패했습니다.");
			return null;
		}
	}

	@GetMapping("/userDelete.do")
	public String userDelete(HttpServletRequest req, HttpServletResponse resp, MemberDTO memberDTO, Model model) {
		String member_id = req.getParameter("member_id");

		int result = memberDAO.deleteMember(member_id);

		if (result > 0) {
			// 회원가입 성공 메세지
			JSFunction.alertLocation(resp, "회원정보 삭제가 완료되었습니다.", "/admin.do");
			return null;
		} else {
			// 회원가입 실패
			JSFunction.alertBack(resp, "회원정보 삭제가 실패했습니다.");
			return null;
		}
	}

}
