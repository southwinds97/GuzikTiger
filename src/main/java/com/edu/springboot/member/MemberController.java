package com.edu.springboot.member;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

    @Autowired
    private IMemberService memberService;

    // 로그인 페이지
    @GetMapping("/login.do")
    public String Login(HttpServletRequest req, MemberDTO memberDTO) {
        // 로그인 성공시 세션에 저장
        if (req.getSession().getAttribute("id") != null) {
            // 이미 로그인 된 상태
            return "redirect:/";
        }
        return "login";
    }

    // 로그인 처리
    @PostMapping("/login.do")
    public String LoginProc(HttpServletRequest req, MemberDTO memberDTO) {
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        MemberDTO dto = memberService.login(id, pass);
        if (dto != null) {
            // 로그인 성공
            req.getSession().setAttribute("id", dto.getId());
            req.getSession().setAttribute("name", dto.getName());
            return "redirect:/";
        } else {
            // 로그인 실패
            return "login";
        }
    }

    // 로그아웃
    @GetMapping("/logout.do")
    public String Logout(HttpServletRequest req) {
        req.getSession().invalidate();
        return "redirect:/";
    }

    // 회원가입
    @GetMapping("/regist.do")
    public String Regist() {
        return "regist";
    }

    // 아이디 중복 체크
    @PostMapping("/idCheck.do")
    @ResponseBody
    public int IdCheck(HttpServletRequest req) {
        String id = req.getParameter("id");
        return memberService.idCheck(id);
    }

    // 회원가입 처리
    @PostMapping("/regist.do")
    public String RegistProc(HttpServletRequest req, MemberDTO memberDTO) {
        // 데이터 확인
        System.out.println(memberDTO.getId() + " " + memberDTO.getName() + " " + memberDTO.getPass() + " "
                + memberDTO.getHint() + " " + memberDTO.getHintas() + " "
                + memberDTO.getTel() + " " + memberDTO.getEmail() + " " + memberDTO.getPostcode() + " "
                + memberDTO.getAddr() + " " + memberDTO.getDetailaddr() + " " + memberDTO.getGen() + " "
                + memberDTO.getBirth() + " " + memberDTO.getCalendar());
        int result = memberService.insertMember(memberDTO);

        if (result > 0) {
            // 회원가입 성공
            return "redirect:/login.do";
        } else {
            // 회원가입 실패
            return "regist";
        }
    }
}