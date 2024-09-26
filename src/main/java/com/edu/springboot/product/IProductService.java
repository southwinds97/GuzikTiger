package com.edu.springboot.product;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.ParameterDTO;

@Mapper
public interface IProductService {
	// 토탈카운드
	public int getTotalCount(ParameterDTO parameterDTO);

	// 메인 조회
	public ArrayList<ProductDTO> getAllSelect(Map<String, Object> param);

	// new상품리스트 조회
	public ArrayList<ProductDTO> getProductNewList(ParameterDTO parameterDTO);

	// best상품리스트 조회
	public ArrayList<ProductDTO> getProductBestList(ParameterDTO parameterDTO);

	// 카테고리테이블조회
	public ArrayList<CodeListDTO> mainCategoryList();

	public ArrayList<CodeListDTO> subCategoryList(@Param("category") String category);

	// cd_name으로 code 가져오기
	public String getCodeByCdName(@Param("cd_name") String cd_name);

	// cd_name으로 up_code 리스트 조회 메서드 추가
	ArrayList<CodeListDTO> getCategoriesByCdName(String cdName);

	// up_code로 cd_name 리스트 조회
	public ArrayList<CodeListDTO> getCategoriesByUpCode(@Param("up_code") String up_code);

	// code로 mainCate상품리스트 조회
	ArrayList<ProductDTO> getSelectByCodeMain(Map<String, Object> param);

	// code로 mainCate상품 검색한 수
	int getSelectByCodeMainCount(@Param("code") String code);

	// code로 subCate상품리스트 조회
	ArrayList<ProductDTO> getSelectByCodeSub(Map<String, Object> param);

	// code로 subCate상품 검색한 수
	int getSelectByCodeSubCount(@Param("code") String code);

	// 상품 전체 검색 수
	int getMainCategoryCount();
}