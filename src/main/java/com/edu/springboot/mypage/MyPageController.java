package com.edu.springboot.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyPageController {

    @RequestMapping("/myPage.do")
    public String myPage() {
        return "myPage";
    }

    @RequestMapping("/wishlist.do")
    public String wishlist() {
        return "wishlist";
    }

}
