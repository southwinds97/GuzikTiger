package com.edu.springboot.product;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ProductDtlDTO {
	private String member_id;
	private String option_id;
	private String product_id;
	private String option_cate;
	private int idx;
	private int price;
	private int stock;
	private int sell_count;
	private String img_id;
	private String sub_cate;
	private String product_name;
	private String product_content;

	
	//장바구니/주문 관련
	private String  cart_dtl_id;
	private int quantity;
}

