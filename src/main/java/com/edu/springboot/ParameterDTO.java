package com.edu.springboot;

import com.edu.springboot.qna.QNABoardDTO;

import lombok.Data;

@Data
public class ParameterDTO {
	private String searchField;
	private String searchKeyword;
	private int start;
	private int end;
	private int offset; // 기존 start 필드를 offset으로 변경
	private int limit; // 기존 end 필드를 limit으로 변경
	private QNABoardDTO qna;
}
