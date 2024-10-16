package com.edu.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.edu.springboot.order.IOrderService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CommonController {

    @Autowired
    IOrderService orderService;

    @ModelAttribute
    public void addCommonAttributes(HttpServletRequest req, Model model) {
        String member_id = (String) req.getSession().getAttribute("id");
        if(member_id != null) {
        	int countCart = orderService.countCart(member_id);
        	model.addAttribute("countCart", countCart);        	
        } else {
        	int countCart = 0;
        	model.addAttribute("countCart", countCart);
        }
    }
}