package com.edu.springboot.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.ParameterDTO;

@Mapper
public interface IProductService {
	//토탈카운드
			public int getTotalCount(ParameterDTO parameterDTO);
			
			//상품리스트 조회
			public ArrayList<ProductDTO> getProductList(ParameterDTO parameterDTO);
			
			//상품리스트 조회
			public ArrayList<ProductDTO> getProductNewList(ParameterDTO parameterDTO);
					
			//상품리스트 조회
			public ArrayList<ProductDTO> getProductBestList(ParameterDTO parameterDTO);
			
			//카테고리테이블조회
			 public ArrayList<CodeListDTO> mainCategoryList(); 
			 public ArrayList<CodeListDTO> subCategoryList(); 
			 
			 //상품테이블 등록
			  public int write(ProductDTO productDTO, ProductDtlDTO productDTLDTO, CodeListDTO codeListDTO);
			  
			  //상품상세정보 보기 
			//  public BoardDTO view(BoardDTO boardDTO); 
			  //상품정보 수정 
			//  public int edit(BoardDTO boardDTO); 
			  //상품삭제 
			//  public int delete(String idx); 
			//  public int visitCntPlus(String idx);
}