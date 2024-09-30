package com.edu.springboot.qna;

import lombok.Data;

@Data
public class QNABoardDTO {
	private int idx;
	private String product;
	private String category;
	private String title;
	private String content;
	private String name;
	private String secretYN;
	private Object ofile;
	private String sfile;
	private String password;
	private String postdate;
	private String uccURL;
}
