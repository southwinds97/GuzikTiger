package com.edu.springboot.product;

import lombok.Data;

@Data
public class ProductDtlDTO {
	private String option_id;
	private String product_id;
	private String option_cate;
	private int idx;
	private int price;
	private int stock;
	private int sell_count;
	private String img_id;
}

