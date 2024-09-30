const order_data = 	[
	{product_id : 'P10522', option_id : '랜덤1종' ,quantity : 2},
	{product_id : 'P10522', option_id : '풀박스(15개입/히든확정)' ,quantity : 1},
	{product_id : 'P10523', option_id : '풀박스(15개입/히든확정)' ,quantity : 2}

]

function validateForm(form) {  // 폼 내용 검증
	     if (form.product_id.value == "") {
	         alert("상품을선ㅌ 입력하세요.");
	         form.product_id.focus();
	         return false;
	     }
	     if (form.option_id.value == "") {
	         alert("옵션 입력하세요.");
	         form.option_id.focus();
	         return false;
	     }
		 if (form.quantity.value == "") {
		 	         alert("수량 입력하세요.");
		 	         form.quantity.focus();
		 	         return false;
		 	     }
		}
	 
	
		
		/* OrderDTO orderDTO = new OrderDTO();
		orderDTO.setOrder_id(123456789);
		orderDTO.setMember_id("inee1945");
		orderDTO.setOrder_name("김종칠");
		orderDTO.setOrder_phone("010-9000-1111");
		orderDTO.setOrder_addr("서울 은평구 역촌동");
		orderDTO.setOrder_amount(7000);
		orderDTO.setPaymnet("현금");
		orderDTO.setDeliv_charge("유료");
		orderDTO.setOrder_prog("결제완료");
		orderDTO.setDeliv_prog("배송중");

		Order_detailDTO order_detailDTO = new Order_detailDTO();
		ArrayList<Order_detailDTO> order_detail_list = new ArrayList<Order_detailDTO>();
		order_detailDTO.setIdx(1);
		order_detailDTO.setOrder_id(123456789);
		order_detailDTO.setProduct_id("P10522");
		order_detailDTO.setOption_id("랜덤1종");
		order_detailDTO.setQuantity(2);

		order_detail_list.add(order_detailDTO);

		Order_detailDTO order_detailDTO2 = new Order_detailDTO();
		order_detailDTO2.setIdx(2);
		order_detailDTO2.setOrder_id(123456789);
		order_detailDTO2.setProduct_id("P10522");
		order_detailDTO2.setOption_id("풀박스(15개입/히든확정)1종");
		order_detailDTO2.setQuantity(1);

		order_detail_list.add(order_detailDTO2);

		Order_detailDTO order_detailDTO3 = new Order_detailDTO();
		order_detailDTO3.setIdx(3);
		order_detailDTO3.setOrder_id(123456789);
		order_detailDTO3.setProduct_id("P10523");
		order_detailDTO3.setOption_id("뚱랑이의-디저트카페-브릭피규어1종");
		order_detailDTO3.setQuantity(2); */