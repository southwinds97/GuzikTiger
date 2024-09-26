package com.edu.springboot.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {
	@Autowired
	IProductService dao;

	@RequestMapping("/productList.do")
	public String productList(Model model, @RequestParam("category") String category) {
		// 메인 카테고리 리스트 조회
		ArrayList<CodeListDTO> mainCategories = dao.mainCategoryList();
		model.addAttribute("categories", mainCategories);

		// 서브 카테고리 리스트 조회
		ArrayList<CodeListDTO> subCategories = dao.subCategoryList(category);
		model.addAttribute("subCategories", subCategories);

		// category가 'mainCate'가 아닌 경우에만 code 조회
		if (!"mainCate".equals(category)) {
			// category를 cd_name으로 사용하여 code 찾기
			String code = dao.getCodeByCdName(category);
			if (code == null) {
				// code가 null인 경우 처리
				return "productList"; // 에러 페이지로 이동
			}

			ArrayList<CodeListDTO> upCodeCategories;
			// code가 'A'로 시작하는 경우에만 up_code로 변환
			if (code.startsWith("A")) {
				upCodeCategories = dao.getCategoriesByUpCode(code);
			} else {
				// code가 'A'로 시작하지 않는 경우, category를 사용하여 up_code 조회
				String upCode = dao.getCategoriesByCdName(category).get(0).getUp_code();
				// 조회된 up_code를 사용하여 일치하는 cd_name 리스트 조회
				upCodeCategories = dao.getCategoriesByUpCode(upCode);
			}
			// upCodeCategories를 모델에 추가
			model.addAttribute("upCodeCategories", upCodeCategories);

			model.addAttribute("selectedCategory", category);
		}
		return "productList";
	}

	@RequestMapping("/productListContent.do")
	public String productListContent(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		ArrayList<ProductDTO> lists = dao.getAllSelect(parameterDTO);
		model.addAttribute("allLists", lists);
		return "productListContent";
	}

}