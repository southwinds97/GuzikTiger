package com.edu.springboot.order;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	private BigDecimal order_id;
	private String member_id;
	private Date order_date;
	private String order_name;
	private String order_phone;
	private String order_addr;
	private int order_amount;
	private String payment;
	private String deliv_charge;
	private String order_prog;
	private String deliv_prog;
		
	private String product_id;
	private String product_name;
	private String option_id;
	private int quantity;
	private String  cart_dtl_id;
	private String img_id;
	private String option_yn;
	private List<String>option_list;
	private List<String>cart_dtl_id_list;
	
	
}
