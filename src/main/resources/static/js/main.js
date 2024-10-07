const Basket = {
	/**
	 * '△' 버튼 클릭, 수량증가
	 */
	addQuantityShortcut: function(option_id)
	{
	  
	    var iQuantity = Number($('#'+option_id).val()) + 1;
		this.chkQuantity(iQuantity);
	    if (isNaN(iQuantity) === false) {
	        $('#'+option_id).val(iQuantity);
			
	    }
	   
	},
	/**
	 * '▽' 버튼 클릭, 수량감소
	 */
	outQuantityShortcut: function(option_id)
	{
		var iQuantity = Number($('#'+option_id).val()) - 1;
		
			this.chkQuantity(iQuantity,option_id);
			   
	   
	},
	
	chkQuantity: function(iQuantity,option_id) {
		if (iQuantity < 1) {
		            alert('수량은 1 이상이어야 합니다.');
		            return ;
		}else{
			if (isNaN(iQuantity) === false) {
					        $('#'+option_id).val(iQuantity);
							changeQuantity= $('#'+option_id).val();
			}
		}
	},
	
	modifyQuantity: function(cart_dtl_id){

		                     location.href = 'cartUpdate.do?${cart_dtl_id}';
		
		
	}
	
}
