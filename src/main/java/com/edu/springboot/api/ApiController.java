package com.edu.springboot.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.ParameterDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.product.IProductService;
import com.edu.springboot.product.ProductDTO;

import utils.PagingUtil;

@RestController
@RequestMapping("api")
public class ApiController {
	
	@Autowired
	private IMemberService memberDAO;

	@Autowired
	IProductService productDAO;

	// 메인화면
	@GetMapping("/")
	public ResponseEntity<List<ProductDTO>> home(ParameterDTO parameterDTO) {
    	ArrayList<ProductDTO> lists = productDAO.getAllSelect(parameterDTO);
    	return ResponseEntity.ok(lists);
	}
	
	 @PostMapping("/login")
	    public ResponseEntity<MemberDTO> loginUser(@RequestBody MemberDTO loginRequest) {
	        MemberDTO member = memberDAO.login(loginRequest.getId(), loginRequest.getPass());
	        if (member != null) {
	            return ResponseEntity.ok(member);
	        } else {
	            return ResponseEntity.status(401).body(null);
	        }
	    }

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
		
}
