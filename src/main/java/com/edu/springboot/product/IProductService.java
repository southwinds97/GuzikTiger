package com.edu.springboot.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.ParameterDTO;

@Mapper
public interface IProductService {
	// 토탈카운드
	public int getTotalCount(ParameterDTO parameterDTO);

	// 메인 조회
	public ArrayList<ProductDTO> getAllSelect(ParameterDTO parameterDTO);

	// new상품리스트 조회
	public ArrayList<ProductDTO> getProductNewList(ParameterDTO parameterDTO);

	// best상품리스트 조회
	public ArrayList<ProductDTO> getProductBestList(ParameterDTO parameterDTO);

	// 카테고리테이블조회
	public ArrayList<CodeListDTO> mainCategoryList();

	public ArrayList<CodeListDTO> subCategoryList();

}