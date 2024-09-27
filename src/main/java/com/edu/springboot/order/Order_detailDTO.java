package com.edu.springboot.order;

import lombok.Data;

@Data
public class Order_detailDTO {
	private String member_id;
	private int order_id;
	private String product_id;
	private String product_name;
	private String option_id;
	private int quantity;
	private String  cart_dtl_id;
	private String img_id;
}
