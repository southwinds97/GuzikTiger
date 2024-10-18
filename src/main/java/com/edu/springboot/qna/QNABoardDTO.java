package com.edu.springboot.qna;

import lombok.Data;

@Data
public class QNABoardDTO {
	private String idx;
	private String product;
	private String product_img;
	private String product_price;
	private String category;
	private String title;
	private String content;
	private String name;
	private String member_id;
	private String secretYN;
	private Object ofile;
	private String sfile;
	private String password;
	private java.sql.Date postdate;
	private String uccURL;
	private int start;
	private int end;
	private String searchField;
    private String searchKeyword; // 추가된 프로퍼티
}
