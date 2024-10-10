package com.edu.springboot.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;

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

		// category가 'mainCate', 'BEST', 'NEW' 가 아닌 경우에만 code 조회
		if (!"mainCate".equals(category) && !"BEST".equals(category) && !"NEW".equals(category)) {
			// category를 cd_name으로 사용하여 code 찾기
			String code = dao.getCodeByCdName(category);
			if (code == null) {
				// code가 null인 경우 처리
				return "product/productList"; // 에러 페이지로 이동
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
		} else if ("mainCate".equals(category)) {
			// category가 'mainCate'인 경우 메인 카테고리의 전체 카운트 조회
			int mainCategoryCount = dao.getSelectByCodeAllCount();
			model.addAttribute("productCount", mainCategoryCount);
		}

		return "product/productList";
	}

	@RequestMapping("/productListContent.do")
	public String productListContent(Model model, HttpServletRequest req, ParameterDTO parameterDTO,
			@RequestParam(value = "code", required = false) String code,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "list_array", required = false) String listArray,
			@RequestParam(value = "offset", defaultValue = "0") int offset,
			@RequestParam(value = "limit", defaultValue = "20") int limit,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) {
		ArrayList<ProductDTO> lists;

		int count = 0;

		// System.out.println("code : " + code);
		// System.out.println("category : " + category);
		System.out.println("list_array : " + listArray);

		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("list_array", String.valueOf(listArray));
		params.put("offset", offset);
		params.put("limit", limit);
		params.put("searchKeyword", searchKeyword);

		if (code == null || code.isEmpty()) {
			if ("BEST".equals(category)) {
				lists = dao.getSelectByCodeBest(params);
			} else if ("NEW".equals(category)) {
				lists = dao.getSelectByCodeNew(params);
			} else if ("mainCate".equals(category)) {
				count = dao.getSelectByCodeAllCount();
				lists = dao.getSelectByCodeAll(params);
			} else {
				count = dao.getSelectByKeywordCount(searchKeyword);
				lists = dao.getSelectByKeyword(params);
			}
			// count = dao.getSelectByCodeAllCount();
			// // code 값이 null이거나 비어있는 경우
			// lists = dao.getSelectByCodeAll(params);
		} else if (code.startsWith("A")) {
			count = dao.getSelectByCodeMainCount(code);
			// code 값이 'A'로 시작하는 경우
			lists = dao.getSelectByCodeMain(params);
		} else if (code.startsWith("B")) {
			count = dao.getSelectByCodeSubCount(code);
			// code 값이 'B'로 시작하는 경우
			lists = dao.getSelectByCodeSub(params);
		} else {

			count = dao.getSelectByCodeAllCount();
			// 그 외의 경우
			lists = dao.getSelectByCodeAll(params);
		}

		if (lists.isEmpty())

		{
			return "";
		}

		model.addAttribute("allLists", lists);
		model.addAttribute("totalCount", count);
		return "product/productListContent";
	}

	/// 상품상세 페이지 (임시)
	@RequestMapping("/product_review.do")
	public String productReview(HttpServletRequest req, Model model, ProductDTO productDTO) {

		String id = "P10856";
		productDTO = dao.getProductDtl(id);

		model.addAttribute("product_dtl", productDTO);

		return "product/product_review";
	}

	// 상품 검색 페이지
	@RequestMapping("/product_search.do")
	public String productSearch(HttpServletRequest req, Model model, ParameterDTO parameterDTO, ProductDTO productDTO) {
		String searchKeyword = req.getParameter("searchKeyword");

		int productCount = dao.getSelectByKeywordCount(searchKeyword);

		model.addAttribute("productCount", productCount);
		model.addAttribute("searchKeyword", searchKeyword);

		return "product/product_search";
	}

}