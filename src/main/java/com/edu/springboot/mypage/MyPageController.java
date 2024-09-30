package com.edu.springboot.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
public class MyPageController {

    @Autowired
    private IMyPageService dao;

    @RequestMapping("/myPage.do")
    public String myPage() {
        return "myPage";
    }

    // 위시리스트 조회
    @GetMapping("/wishList.do")
    public String wishList(HttpServletRequest req, HttpServletResponse res, Model model, WishListDTO wishListDTO) {
        String memberId = (String) req.getSession().getAttribute("id");

        if (memberId == null) {
            return "redirect:/login.do";
        }

        List<Map<String, Object>> wishListData = dao.wishListSelect(memberId);

        model.addAttribute("wishListData", wishListData);

        System.out.println(wishListData);

        return "wishList";
    }

    // 위시리스트 추가
    @RequestMapping("/wishListInsert.do")
    public String wishListInsert(HttpServletRequest req, HttpServletResponse res, WishListDTO wishListDTO) {

        return "redirect:/wishList.do";
    }

    @RequestMapping("/recentView.do")
    public String recentView() {
        return "recentView";
    }

    @RequestMapping("/myPost.do")
    public String myPost() {
        return "myPost";
    }
}