package com.edu.springboot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

@RestController
@RequestMapping("api")
public class ApiController {
	
	@Autowired
	private IMemberService memberDAO;
	
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
