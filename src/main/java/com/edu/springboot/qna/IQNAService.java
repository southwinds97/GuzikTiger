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
}