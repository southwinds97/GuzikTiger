package com.edu.springboot.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {
	@Autowired
	IProductService dao;

	@RequestMapping("/productList.do")
	public String productList(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		ArrayList<CodeListDTO> mainCategories = dao.mainCategoryList();
		model.addAttribute("categories", mainCategories);
		return "productList";
	}

	@RequestMapping("/productListContent.do")
	public String productListContent(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		ArrayList<ProductDTO> lists = dao.getAllSelect(parameterDTO);
		model.addAttribute("allLists", lists);
		return "productListContent";
	}

}