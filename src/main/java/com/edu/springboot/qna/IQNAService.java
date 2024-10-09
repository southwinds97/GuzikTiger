package com.edu.springboot.qna;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.ParameterDTO;

@Mapper
public interface IQNAService {

	public int getTotalCount(ParameterDTO parameterDTO);

	public ArrayList<QNABoardDTO> listPage(ParameterDTO parameterDTO);

	public int write(QNABoardDTO qnaDTO);

	public QNABoardDTO view(QNABoardDTO qnaDTO);

	public int edit(QNABoardDTO qnaDTO);

	public int delete(String idx);

	// 이전 글의 정보를 가져오는 메서드
	public QNABoardDTO getPrevQna(String idx);

	// 다음 글의 정보를 가져오는 메서드
	public QNABoardDTO getNextQna(String idx);

	public ArrayList<QNABoardDTO> getRelatedQnaList(String category);
}