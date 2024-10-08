//장바구니 체크박스 배열
let chkList = [];

// ajax조회 장바구니 리스트
let  cartList ;

//상품수량 넣는 임시 목록 배열
var arrary = [] ; 
const Basket = {
	/**
	 * '△' 버튼 클릭, 수량증가
	 */

	addQuantityShortcut: function(cart_dtl_id )
	{
		this.allChkClear();
	    var iQuantity = Number($('#'+cart_dtl_id).val()) + 1;
		this.chkQuantity(iQuantity,cart_dtl_id);
	    if (isNaN(iQuantity) === false) {
	        $('#'+cart_dtl_id).val(iQuantity);
			this.quatityArrMod(cart_dtl_id,iQuantity)
	    }	   
	},
	/**
	 * '▽' 버튼 클릭, 수량감소
	 */
	outQuantityShortcut: function(cart_dtl_id)
	{
		this.allChkClear();
		var iQuantity = Number($('#'+cart_dtl_id).val()) - 1;
		
			this.chkQuantity(iQuantity,cart_dtl_id);
			
	},
	
	
	//수량이 1 이하인지 체크
	chkQuantity: function(iQuantity,cart_dtl_id) {
		if (iQuantity < 1) {
		            alert('수량은 1 이상이어야 합니다.');
		            return ;
		}else{
			if (isNaN(iQuantity) === false) {
					        $('#'+cart_dtl_id).val(iQuantity);
							this.quatityArrMod(cart_dtl_id,iQuantity)
			}
		}
	},		

	// 장바구니 총 상품금액 	
	paymentSet : function(arr,cart_dtl_id,iQuantity){
	 var totalPrice =0 ;
	 arr.forEach(function(item){		
		item.price = Number(item.price) * item.quantity;
		totalPrice+=Number(item.price);
	 })
	return totalPrice ;
	},
	
	//수량변경 시 장바구니 총 상품금액 	

	paymentSetMod : function(arr,cart_dtl_id,iQuantity){
	 var totalPrice =0 ;
	 
	 arr.forEach(function(item){	
		
		if(item.cart_dtl_id==cart_dtl_id) {
			arrary[item.cart_dtl_id]= iQuantity;
			item.price = Number(item.price) * iQuantity;
		}else{
			if(item.quantity == arrary[item.cart_dtl_id] ||arrary[item.cart_dtl_id] ==undefined ){
				item.price = Number(item.price) * item.quantity;
			}else item.price = Number(item.price) * arrary[item.cart_dtl_id] ;
			
		}
		
		totalPrice+=Number(item.price);
	 })
	 
	 //총상품금액
	     var totalProductPrice = totalPrice ;
	     var innerTotalProductPrice = document.getElementById('totalProductPrice')
	     innerTotalProductPrice.innerHTML = totalProductPrice +'원';
	  
	     //총 배송비
	     var  totalDelvPrice    = totalProductPrice>50000?0:3000 ;
	     var innerTotalDelvPrice = document.getElementById('totalDelvPrice')
	     innerTotalDelvPrice.innerHTML = totalDelvPrice +'원';
	     
	     //총 할인금액
	  var  totalDiscountPrice= totalProductPrice * 0.04;
	  var innerTotalDiscountPrice = document.getElementById('totalDiscountPrice')
	     innerTotalDiscountPrice.innerHTML = totalDiscountPrice +'원';
	  
	     //결제 예정금액
	  var  totalPaymentPrice = totalProductPrice +totalDelvPrice -totalDiscountPrice;
	  var innerTotalPaymentPrice = document.getElementById('totalPaymentPrice')
	     innerTotalPaymentPrice.innerHTML = totalPaymentPrice +'원';
	
	},
	
	
	//장바구니 아이템 삭제
	deleteBasketItem : function(cart_dtl_id ){
	  location.href = 'cartDelete.do?cart_dtl_id='+cart_dtl_id ;
	},
	
	//수량변경에 의한 배열 수정
	quatityArrMod : function(cart_dtl_id,iQuantity){
			
		$.ajax({
            type: "GET",
            url: "/cartListAjax.do",
			data: { },
            success: function (data) {
				cartList =data;
				Basket.paymentSetMod(data,cart_dtl_id,iQuantity);
             
            },
            error: function () {
              alert("서버와의 통신 중 오류가 발생했습니다.");
            }
          });
	},
	//체크리스트 정보
	isChecked : function(obj){
		
		if(obj.checked){
			chkList.push(obj.name);
		}else{
			chkList.splice(obj.name,1);
		}	
	},
	
	allChkClear(){
		$('.cart_check').prop("checked", false); 	
		
	},
	
	//전체상품 주문 
	allProductOrder : function (){
		if(cartList != null||cartList != undefined) {
			alert('변경 버튼을 클릭하여 변경 된 수량을 적용 하세요.');
		}else {
			alert('결제창으로 이동합니다.');
            location.href = "/cartOrderPage.do";
		}
	},
	
	//선택상품 주문 
		selProductOrder : function (){
		var chkCnt =	$("input:checkbox[class='cart_check']:checked").length;
			if(chkCnt===0){
				alert('선택된 항목이 없습니다.');
			}else{
				if(cartList != null||cartList != undefined) {
					alert('변경 버튼을 클릭하여 변경 된 수량을 적용 하세요.');
				}else {
					console.log(chkList);
					alert('결제창으로 이동합니다.');
					location.href = "/cartOrderPage.do?cart_dtl_list="+chkList;
				}
			}
		},
}
