package com.edu.springboot.order;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	private int order_id;
	private String member_id;
	private Date order_date;
	private String order_name;
	private String order_phone;
	private String order_addr;
	private int order_amount;
	private String paymnet;
	private String deliv_charge;
	private String order_prog;
	private String deliv_prog;
	
	private List<Order_detailDTO> list ;
}
