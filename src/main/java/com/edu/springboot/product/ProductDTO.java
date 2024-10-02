package com.edu.springboot.product;

import java.sql.Date;
import java.util.List;

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
	private String member_id;
	private String option_cate;
	private int idx;
	private int sell_count;
	private List<String>option_list;
	
	//장바구니/주문 관련
	private String  cart_dtl_id;
	private int quantity;

}
