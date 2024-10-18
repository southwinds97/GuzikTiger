package com.edu.springboot.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.CommonController;
import com.edu.springboot.ParameterDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.mypage.IMyPageService;
import com.edu.springboot.mypage.WishListDTO;
import com.edu.springboot.product.IProductService;
import com.edu.springboot.product.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;

@RestController
@RequestMapping("api")
public class ApiController extends CommonController {
	
	@Autowired
	private IMemberService memberDAO;

	@Autowired
	IProductService productDAO;

	@Autowired
    private IMyPageService myPagedao;

	// 메인화면
	@GetMapping("/")
	public ResponseEntity<List<ProductDTO>> home(ParameterDTO parameterDTO) {
    	ArrayList<ProductDTO> lists = productDAO.getAllSelect(parameterDTO);
    	return ResponseEntity.ok(lists);
	}
	
	// 로그인
	@PostMapping("/login")
	public ResponseEntity<MemberDTO> loginUser(@RequestBody MemberDTO loginRequest) {
	    MemberDTO member = memberDAO.login(loginRequest.getId(), loginRequest.getPass());
	    if (member != null) {
	        return ResponseEntity.ok(member);
	    } else {
	        return ResponseEntity.status(401).body(null);
	    }
	}

	// 카테고리
	@PostMapping("/category")
	public ResponseEntity<List<ProductDTO>> category(@RequestBody Map<String, String> body) {
		String searchKeyword = body.get("keyword");
		// 검색 키워드를 기반으로 데이터를 조회합니다.
		ArrayList<ProductDTO> lists;
		String code = null;
		int listArray = 2;
		int offset = 0; // 기본값 설정
		int limit = 500; // 기본값 설정
		
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("list_array", String.valueOf(listArray));
		params.put("offset", offset);
		params.put("limit", limit);
		params.put("searchKeyword", searchKeyword);
		
		lists = productDAO.getSelectByKeyword(params);
		
		return ResponseEntity.ok(lists);
	}

	// 상품 상세
    @PostMapping("/productDetail")
    public ResponseEntity<Map<String, Object>> productDetail(@RequestBody Map<String, String> body) {
        String product_id = body.get("product_id");
        String member_id = body.get("member_id");
        ArrayList<ProductDTO> productViewList = productDAO.getProductDtl(product_id);
        ArrayList<ProductDTO> productRelateList = productDAO.getProductRelate(product_id);

        // 최근 본 상품 등록
        if (member_id != null) {
            Map<String, Object> param = new HashMap<>();
            param.put("product_id", product_id);
            param.put("member_id", member_id);
            myPagedao.recentViewInsert(param);
        }

        Map<String, Object> response = new HashMap<>();
        response.put("productViewList", productViewList);
        response.put("productRelateList", productRelateList);

        return ResponseEntity.ok(response);
    }


	// 위시리스트
	@GetMapping("/wishList")
	public ResponseEntity<Map<String, Object>> wishList(HttpServletRequest req) {
		String memberId = req.getParameter("id"); // URL 파라미터에서 memberId 가져오기

		if (memberId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
		}

		int pageNum = (req.getParameter("pageNum") == null || req.getParameter("pageNum").equals("")) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
		int pageSize = 10; // 페이지당 항목 수
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;

		WishListDTO wishListDTO = new WishListDTO();
		wishListDTO.setStart(start);
		wishListDTO.setEnd(end);
		wishListDTO.setMember_id(memberId);

		List<Map<String, Object>> wishListData = myPagedao.wishListSelect(wishListDTO);
		int totalCount = myPagedao.getWishListTotalCount(memberId);
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, 5, pageNum, req.getContextPath() + "/wishList.do?");

		Map<String, Object> response = new HashMap<>();
		response.put("wishListData", wishListData);
		response.put("pagingImg", pagingImg);

		return ResponseEntity.ok(response);
	}


		
}
