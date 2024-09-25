package com.edu.springboot.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

    // 상품 목록
    @GetMapping("/productList.do")
    public String ProductList() {
        return "productList";
    }

    // 상품 목록 업데이트
    @GetMapping("/productListContent.do")
    public String ProductListContent() {
        return "productListContent";
    }
}