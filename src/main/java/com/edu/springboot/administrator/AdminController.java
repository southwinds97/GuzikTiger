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

@Controller
public class AdminController extends CommonController {

	@Autowired
	IProductService dao;

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

	@RequestMapping("/productReg.do")
	public String productReg() {
		return "administrator/productReg"; 
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
    	productDTO.setOption_id("뚱랑이삼색이");
    	productDTO.setOption_yn("N");
    	productDTO.setImg_id("kk.jpg");
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

}
