package com.edu.springboot.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @GetMapping("/wishList.do")
    public String wishList(HttpServletRequest req, HttpServletResponse res) {
        String memberId = (String) req.getSession().getAttribute("id");

        if (memberId == null) {
            return "redirect:/login.do";
        }

        List<Map<String, Object>> wishListData = dao.wishListSelect(memberId);

        req.setAttribute("wishListData", wishListData);

        System.out.println(wishListData);

        return "wishList";
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