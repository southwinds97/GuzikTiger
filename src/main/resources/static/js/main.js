//장바구니 체크박스 배열
let chkList = [];

// ajax조회 장바구니 리스트
let cartList ;
//최초결제리스트
let paymentList = [];
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
	cartAmountSet : function(arr,cart_dtl_id,iQuantity){
	 var totalPrice =0 ;
	 var points = 0;
	 arr.forEach(function(item){		
		item.price = Number(item.price) * item.quantity;
		totalPrice+=Number(item.price);
		points = item.points;
		paymentList.push(item.cart_dtl_id);
	 })
       /*--------------------------금액 셋팅---------------------------*/
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
		
	/*	//보유 포인트 
	  var innerPonts = document.getElementById('points')
	    innerPonts.innerHTML = points +'원'; 	*/
	  
	return totalPrice ;
	},
	
	// 체크박스 선택 시  상품금액 	
		cartAmountSetChk : function(arr,cart_dtl_id,iQuantity){
		 var totalPrice =0 ;
		 var points = 0;
		 arr.forEach(function(item){		
			item.price = Number(item.price) * item.quantity;
			totalPrice+=Number(item.price);
			points = item.points;
		 })
	       /*--------------------------금액 셋팅---------------------------*/
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
			
		/*	//보유 포인트 
		  var innerPonts = document.getElementById('points')
		    innerPonts.innerHTML = points +'원'; 	*/
		  
		return totalPrice ;
		},
	
	//수량변경 시 장바구니 총 상품금액 	

	cartAmountSetMod : function(arr,cart_dtl_id,iQuantity){
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
	
	
	//장바구니 아이템 1개 삭제
	deleteBasketItem : function(cart_dtl_id ){
	  location.href = 'cartDelete.do?cart_dtl_id='+cart_dtl_id ;
	},
	
	//장바구니 아이템 선택 삭제
	deleteBasketSel : function(cart_dtl_id ){
		var chkCnt =	$("input:checkbox[class='cart_check']:checked").length;
		if(chkCnt===0){
			alert('선택된 항목이 없습니다.');
		}else{
			if(confirm("선택한 품목을 삭제하시겠습니까?")){
				location.href = 'cartDelete.do?cart_dtl_id_list='+chkList ;	
			}
		}
	 },
		
	
	//장바구니 수량변경에 의한 배열 수정
	quatityArrMod : function(cart_dtl_id,iQuantity){
			
		$.ajax({
            type: "POST",
            url: "/cartListAjax.do",
			data: { },
            success: function (data) {
				cartList =data;
				Basket.cartAmountSetMod(data,cart_dtl_id,iQuantity);
             
            },
            error: function () {
              alert("서버와의 통신 중 오류가 발생했습니다.");
            }
          });
	},
	//체크리스트 정보
	isChecked : function(obj){
		if(cartList != null||cartList != undefined) {
					alert('변경 버튼을 클릭하여 변경 된 수량을 적용 하세요.');
				}else {
					if(obj.checked){
								chkList.push(obj.name);
						}else{
							chkList.splice(obj.name,1);
						}	
						if(chkList.length > 0){
							
							//체크박스에 관한 것만 계산(수량변경 안됨.변경서 체크해제)
							$.ajax({
								type: "POST",
							    url: "/cartListAjaxChk.do",
								data: {"chkList":chkList},
								traditional : true,
							    success: function (data) {
								cartList =data;
								Basket.cartAmountSetChk(cartList);
							    },
					            error: function () {
					             alert("서버와의 통신 중 오류가 발생했습니다.");
					            }
					         });
						}
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
            location.href = "/payment.do";
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
				location.href = "/payment.do?cart_dtl_list="+chkList;
			}
		}
	},
		
	// 결제 금액 조회 (결제창)	
	paymemtSetAmont : function(orderArr, usePoint){
		 var totalPrice =0 ;
		 var point = 0;
		 orderArr.forEach(function(item){		
			item.price = Number(item.price) * item.quantity;
			totalPrice+=Number(item.price);
			point = item.point;
			
			//최초 결제 리스트 처리
			paymentList.push(item.cart_dtl_id);
			console.log("최초 결제 리스트",paymentList );
		 })
	       /*--------------------------금액 셋팅---------------------------*/
		   //보유 포인트 
		  var innerPonts = document.getElementById('points')
		   innerPonts.innerHTML = point +'원'; 	
		 
		  //총상품금액
		  var totalProductPrice = totalPrice ;
		  var innerTotalProductPrice = document.getElementById('totalProductPrice')
		  innerTotalProductPrice.innerHTML = totalProductPrice +'원';
		  
		  // 배송비
		  var delvAmout    = totalProductPrice>50000?0:3000 ;
		  var innerDelvAmout1 = document.getElementById('delvAmout1')
		      innerDelvAmout1.innerHTML = delvAmout +'원';
		  var innerDelvAmout2 = document.getElementById('delvAmout2')
			  innerDelvAmout2.innerHTML = delvAmout +'원';
		    
		    //상품 할인금액
		  var  productDscount= totalProductPrice * 0.04;
		  var innerProductDscount1 = document.getElementById('productDscount1')
		      innerProductDscount1.innerHTML = productDscount +'원';
		  var innerProductDscount2 = document.getElementById('productDscount2')
		      innerProductDscount2.innerHTML = productDscount +'원';
			
			//포인트 사용금액금액
		  var applyPoint = usePoint==undefined? 0: usePoint ;
		  var innerUsePoint = document.getElementById('usePoint')
		  //    innerUsePoint.innerHTML = applyPoint +'원';
		   
		   //할인 합계금액
		  var totalDiscount= productDscount  ;
		  var innerTotalDiscount1 = document.getElementById('totalDiscount1')
		      innerTotalDiscount1.innerHTML = totalDiscount +'원'; 
		  var innerTotalDiscount2 = document.getElementById('totalDiscount2')
		      innerTotalDiscount2.innerHTML = totalDiscount +'원';   
		  
		    //최종결제금액
		  var totalPaymentAmount = totalProductPrice +delvAmout -totalDiscount;
		  var innerTotalPaymentAmount = document.getElementById('totalPaymentAmount')
		      innerTotalPaymentAmount.innerHTML = totalPaymentAmount +'원';
		  return totalPrice ;
	},
	
	//부가정보에 따른 금액 변경 로직
	finalSetAmount : function (orderArr,usePoint){
		 var totalPrice =0 ;
		 var point = 0;
		 orderArr.forEach(function(item){		
			item.price = Number(item.price) * item.quantity;
			totalPrice+=Number(item.price);
			point = item.point;
		 })
		 /*--------------------------금액 셋팅---------------------------*/
		  //보유 포인트 
		  var innerPonts = document.getElementById('points')
		   innerPonts.innerHTML = point +'원'; 	
		 
		  //총상품금액
		  var totalProductPrice = totalPrice ;
		  var innerTotalProductPrice = document.getElementById('totalProductPrice')
		  innerTotalProductPrice.innerHTML = totalProductPrice +'원';
		  
		  // 배송비
		  var delvAmout    = totalProductPrice>50000?0:3000 ;
		  var innerDelvAmout1 = document.getElementById('delvAmout1')
		      innerDelvAmout1.innerHTML = delvAmout +'원';
		  var innerDelvAmout2 = document.getElementById('delvAmout2')
				innerDelvAmout2.innerHTML = delvAmout +'원';
		    
			//상품 할인금액
		  var productDscount= totalProductPrice * 0.04;
		  var innerProductDscount1 = document.getElementById('productDscount1')
		      innerProductDscount1.innerHTML = productDscount +'원';
		  var innerProductDscount2 = document.getElementById('productDscount2')
		      innerProductDscount2.innerHTML = productDscount +'원';
			
			//포인트 사용금액금액
		  var applyPoint = usePoint==undefined? 0: usePoint ;
		  var innerUsePoint = document.getElementById('usedPoint')
		      innerUsePoint.innerHTML = applyPoint +'원';
		   
		   //할인 합계금액
		  var totalDiscount= Number(productDscount) + Number(applyPoint);
		  var innerTotalDiscount1 = document.getElementById('totalDiscount1')
		      innerTotalDiscount1.innerHTML = totalDiscount +'원'; 
		  var innerTotalDiscount2 = document.getElementById('totalDiscount2')
		      innerTotalDiscount2.innerHTML = totalDiscount +'원';   
		  
		    //최종결제금액
		  var totalPaymentAmount = Number(totalProductPrice) +Number(delvAmout) -Number(totalDiscount);
		  var innerTotalPaymentAmount = document.getElementById('totalPaymentAmount')
		      innerTotalPaymentAmount.innerHTML = totalPaymentAmount +'원';
		  return totalPrice ;
	},
	
	/*------결제 창에서 품목 삭제(장바구니 삭제 후 다시 불러오기)------*/
	productRemove : function(cart_dtl_id){
		
		if(confirm("선택한 품목을 삭제하시겠습니까?")){
			
			for(let i = 0; i < paymentList.length; i++) {
			    if (paymentList[i] === cart_dtl_id) {
			        paymentList.splice(i, 1);
			    }
			}
			
			location.href = 'paymentDelete.do?cart_dtl_id_del='+cart_dtl_id+'&paymentList='+paymentList ;
		}
	},
	allChk : function (){
		$('.cart_check').prop("checked", true); 	
		
		paymentList.forEach(function (item){
			chkList.push(item);
		})
		console.log(chkList);
	}
}
