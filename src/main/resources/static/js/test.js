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
	 
/*-------------------------------------------------------------------------------	*/

	  function chkFn(id){
	intlData.forEach((elememt)=>{
		if(elememt.product_id===id){
			var optionss = elememt.option_list.split(';');
			return optionss;
		}
		
	});
}