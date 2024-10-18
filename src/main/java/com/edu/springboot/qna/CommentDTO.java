package com.edu.springboot.qna;

import lombok.Data;

@Data
public class CommentDTO {
	private String idx;
	private String board_idx;
	private String name;
	private String member_id;
	private String comments;
	private String password;
	private String secretYN;
	private java.sql.Date postdate;
}
