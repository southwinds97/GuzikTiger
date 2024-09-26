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

			// code 값을 모델에 추가
			model.addAttribute("code", code);

			// code 값을 이용하여 결과 카운트 조회
			int productCount = 0;
			// int productCount = dao.getSelectByCodeMainCount(code);
			if (code.startsWith("A")) {
				productCount = dao.getSelectByCodeMainCount(code);
			} else if (code.startsWith("B")) {
				productCount = dao.getSelectByCodeSubCount(code);
			}
			model.addAttribute("productCount", productCount);

			model.addAttribute("selectedCategory", category);
		} else {
			// category가 'mainCate'인 경우 메인 카테고리의 전체 카운트 조회
			int mainCategoryCount = dao.getMainCategoryCount();
			model.addAttribute("productCount", mainCategoryCount);
		}
		return "productList";
	}

	@RequestMapping("/productListContent.do")
	public String productListContent(Model model, HttpServletRequest req, ParameterDTO parameterDTO,
			@RequestParam(value = "code", required = false) String code) {
		ArrayList<ProductDTO> lists;
		System.out.println("code : " + code);

		if (code == null || code.isEmpty()) {
			// code 값이 null이거나 비어있는 경우
			lists = dao.getAllSelect(parameterDTO);
		} else if (code.startsWith("A")) {
			// code 값이 'A'로 시작하는 경우
			lists = dao.getSelectByCodeMain(code);
		} else if (code.startsWith("B")) {
			// code 값이 'B'로 시작하는 경우
			lists = dao.getSelectByCodeSub(code);
		} else {
			// 그 외의 경우
			lists = dao.getAllSelect(parameterDTO);
		}

		model.addAttribute("allLists", lists);
		return "productListContent";
	}

}