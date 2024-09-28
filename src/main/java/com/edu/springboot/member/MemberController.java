package com.edu.springboot.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

    @Autowired
    private IMemberService dao;

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

        MemberDTO dto = dao.login(id, pass);

        if (dto != null) {
            // 로그인 성공
            req.getSession().setAttribute("id", dto.getId());
            req.getSession().setAttribute("name", dto.getName());
            return "redirect:/";
        }
        // 로그인 실패
        return "login";
    }

    @PostMapping("/loginCheck.do")
    @ResponseBody
    public Map<String, Object> loginCheck(@RequestParam("id") String id, @RequestParam("pass") String pass) {
        Map<String, Object> result = new HashMap<>();
        MemberDTO dto = dao.login(id, pass);
        if (dto != null) {
            result.put("success", true);
        } else {
            result.put("success", false);
            result.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        return result;
    }

    // 로그아웃
    @GetMapping("/logout.do")

    public String Logout(HttpServletRequest req, HttpServletResponse resp) {
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
    public int IdCheck(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        return dao.idCheck(id);
    }

    // 회원가입 처리
    @PostMapping("/regist.do")
    public String RegistProc(HttpServletRequest req, HttpServletResponse resp, MemberDTO memberDTO, Model model) {
        // 데이터 확인
        System.out.println(memberDTO.getId() + " " + memberDTO.getName() + " " + memberDTO.getPass() + " "
                + memberDTO.getHint() + " " + memberDTO.getHintas() + " "
                + memberDTO.getTel() + " " + memberDTO.getEmail() + " " + memberDTO.getPostcode() + " "
                + memberDTO.getAddr() + " " + memberDTO.getDetailaddr() + " " + memberDTO.getGen() + " "
                + memberDTO.getBirth() + " " + memberDTO.getCalendar());
        int result = dao.insertMember(memberDTO);

        if (result > 0) {
            // 회원가입 성공 메세지
            JSFunction.alertLocation(resp, "회원가입이 완료되었습니다.", "login.do");
            return null;
        } else {
            // 회원가입 실패
            JSFunction.alertBack(resp, "회원가입에 실패했습니다.");
            return null;
        }
    }

    // 회원정보 수정(정보 가져오기)
    @GetMapping("/registEdit.do")
    public String RegistEdit(HttpServletRequest req, MemberDTO memberDTO , Model model) {
        // 로그인 확인
        if (req.getSession().getAttribute("id") == null) {
            return "redirect:/login.do";
        }
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
    return "registEdit";
    }

    // 회원정보 수정 처리
    @PostMapping("/registEdit.do")
    public String RegistEditProc(HttpServletRequest req, HttpServletResponse resp, MemberDTO memberDTO, Model model) {
        // 데이터 확인
        System.out.println(memberDTO.getId() + " " + memberDTO.getName() + " " + memberDTO.getPass() + " "
                + memberDTO.getHint() + " " + memberDTO.getHintas() + " "
                + memberDTO.getTel() + " " + memberDTO.getEmail() + " " + memberDTO.getPostcode() + " "
                + memberDTO.getAddr() + " " + memberDTO.getDetailaddr() + " " + memberDTO.getGen() + " "
                + memberDTO.getBirth() + " " + memberDTO.getCalendar());
        int result = dao.updateMember(memberDTO);

        if (result > 0) {
            // 회원정보 수정 성공
            JSFunction.alertLocation(resp,"회원정보가 수정되었습니다.", "myPage.do");
            return null;
        } else {
            // 회원정보 수정 실패
            JSFunction.alertBack(resp, "회원정보 수정에 실패했습니다.");
            return null;
        }
    }

    // 아이디 찾기
    @GetMapping("/idFinder.do")
    public String idFinder() {
        return "idFinder";
    }

    // 비밀번호 찾기
    @GetMapping("/passFinder.do")
    public String passFinder() {
        return "passFinder";
    }
}