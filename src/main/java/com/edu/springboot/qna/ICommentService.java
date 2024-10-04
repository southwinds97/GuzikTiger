package com.edu.springboot.qna;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.ParameterDTO;

@Mapper
public interface ICommentService {
	
	public int getTotalCount(ParameterDTO parameterDTO);
	public List<CommentDTO> getBoardIdx(String board_idx);
	public ArrayList<CommentDTO> listCom(ParameterDTO parameterDTO);
	public int write(CommentDTO comDTO);
	public int edit(CommentDTO comDTO);
	public int delete(String idx);
}