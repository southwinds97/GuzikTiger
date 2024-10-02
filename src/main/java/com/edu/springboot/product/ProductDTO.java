package com.edu.springboot.product;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private String product_id;
	private String sub_cate;
	private String product_name;
	private String product_content;
	private int stock;
	private String price;
	private String img_id;
	private Date regidate;
	private String option_id;

}
