package com.edu.springboot.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.ParameterDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.product.IProductService;
import com.edu.springboot.product.ProductDTO;

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
		
}
