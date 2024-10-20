//장바구니 체크박스 배열
let chkList = [];

// ajax조회 장바구니 리스트
let cartList;

// ajax조회 장바구니 chk 리스트
let ChkcartList;

//최초결제리스트
var paymentList = new Array();
//상품수량 넣는 임시 목록 배열
var arrary = [];

//수량 증가감소 체크
var quanChk;

//옵션별 재고
var stockNum=0 ;
const Basket = {
  /**
   * '△' 버튼 클릭, 수량증가
   */

  addQuantityShortcut: function (cart_dtl_id) {
    this.allChkClear();
	
	//재고 체크 증가 중지 로직
	var curNum = Number($("#" + cart_dtl_id).val())
	
		this.stockChk(cart_dtl_id);

	if(curNum >= stockNum ){
		alert('상품의 수량이 현재 재고 보다 많습니다.');
		return ;
	}
	
    var iQuantity = Number($("#" + cart_dtl_id).val()) + 1;
    this.chkQuantity(iQuantity, cart_dtl_id);
    if (isNaN(iQuantity) === false) {
      $("#" + cart_dtl_id).val(iQuantity);
      quanChk = 1;
      this.quatityArrMod(cart_dtl_id, iQuantity);
    }
  },
  /**
   * '▽' 버튼 클릭, 수량감소
   */
  outQuantityShortcut: function (cart_dtl_id) {
    this.allChkClear();
    var iQuantity = Number($("#" + cart_dtl_id).val()) - 1;

    this.chkQuantity(iQuantity, cart_dtl_id);
  },

  //수량이 1 이하인지 체크
  chkQuantity: function (iQuantity, cart_dtl_id) {
    if (iQuantity < 1) {
      alert("수량은 1 이상이어야 합니다.");
      return;
    } else {
      if (isNaN(iQuantity) === false) {
        $("#" + cart_dtl_id).val(iQuantity);
        quanChk = 1;
        this.quatityArrMod(cart_dtl_id, iQuantity);
      }
    }
  },

  // 장바구니 총 상품금액
  cartAmountSet: function (arr, cart_dtl_id, iQuantity) {
    var totalPrice = 0;
    var points = 0;
    arr.forEach(function (item) {
      item.price = Number(item.price) * item.quantity;
      totalPrice += Number(item.price);
      points = item.points;
      paymentList.push(item.cart_dtl_id);
    });
    /*--------------------------금액 셋팅---------------------------*/
    //총상품금액
    var totalProductPrice = totalPrice;
    var innerTotalProductPrice = document.getElementById("totalProductPrice");
    innerTotalProductPrice.innerHTML =
      totalProductPrice.toLocaleString() + "원";

    //총 배송비
    var totalDelvPrice = totalProductPrice > 50000 ? 0 : 3000;
    var innerTotalDelvPrice = document.getElementById("totalDelvPrice");
    innerTotalDelvPrice.innerHTML = totalDelvPrice.toLocaleString() + "원";

    //총 할인금액
    var totalDiscountPrice = totalProductPrice * 0.04;
    totalDiscountPrice = Math.floor(totalDiscountPrice / 10) * 10;
    var innerTotalDiscountPrice = document.getElementById("totalDiscountPrice");
    innerTotalDiscountPrice.innerHTML =
      totalDiscountPrice.toLocaleString() + "원";

    //결제 예정금액
    var totalPaymentPrice =
      totalProductPrice + totalDelvPrice - totalDiscountPrice;
    var innerTotalPaymentPrice = document.getElementById("totalPaymentPrice");
    innerTotalPaymentPrice.innerHTML =
      totalPaymentPrice.toLocaleString() + "원";

    /*	//보유 포인트 
	  var innerPonts = document.getElementById('points')
	    innerPonts.innerHTML = points +'원'; 	*/

    return totalPrice;
  },

  // 체크박스 선택 시  상품금액
  cartAmountSetChk: function (arr, cart_dtl_id, iQuantity) {
    var totalPrice = 0;
    var points = 0;
    arr.forEach(function (item) {
      item.price = Number(item.price) * item.quantity;
      totalPrice += Number(item.price);
      points = item.points;
    });
    /*--------------------------금액 셋팅---------------------------*/
    //총상품금액
    var totalProductPrice = totalPrice;
    var innerTotalProductPrice = document.getElementById("totalProductPrice");
    innerTotalProductPrice.innerHTML =
      totalProductPrice.toLocaleString() + "원";

    //총 배송비
    var totalDelvPrice = totalProductPrice > 50000 ? 0 : 3000;
    var innerTotalDelvPrice = document.getElementById("totalDelvPrice");
    innerTotalDelvPrice.innerHTML = totalDelvPrice.toLocaleString() + "원";

    //총 할인금액
    var totalDiscountPrice = totalProductPrice * 0.04;
    totalDiscountPrice = Math.floor(totalDiscountPrice / 10) * 10;
    var innerTotalDiscountPrice = document.getElementById("totalDiscountPrice");
    innerTotalDiscountPrice.innerHTML =
      totalDiscountPrice.toLocaleString() + "원";

    //결제 예정금액
    var totalPaymentPrice =
      totalProductPrice + totalDelvPrice - totalDiscountPrice;
    var innerTotalPaymentPrice = document.getElementById("totalPaymentPrice");
    innerTotalPaymentPrice.innerHTML =
      totalPaymentPrice.toLocaleString() + "원";

    /*	//보유 포인트 
		  var innerPonts = document.getElementById('points')
		    innerPonts.innerHTML = points +'원'; 	*/

    return totalPrice;
  },

  //수량변경 시 장바구니 총 상품금액

  cartAmountSetMod: function (arr, cart_dtl_id, iQuantity) {
    var totalPrice = 0;

    arr.forEach(function (item) {
      if (item.cart_dtl_id == cart_dtl_id) {
        arrary[item.cart_dtl_id] = iQuantity;
        item.price = Number(item.price) * iQuantity;
		
		var innerProductPrice = document.getElementById('p_'+item.cart_dtl_id);
		  innerProductPrice.innerHTML = item.price + "원";
		
      } else {
        if (
          item.quantity == arrary[item.cart_dtl_id] ||
          arrary[item.cart_dtl_id] == undefined
        ) {
          item.price = Number(item.price) * item.quantity;
        } else item.price = Number(item.price) * arrary[item.cart_dtl_id];
		
		var innerProductPrice = document.getElementById('p_'+item.cart_dtl_id);
			  innerProductPrice.innerHTML = item.price + "원";
		
      }

      totalPrice += Number(item.price);
    });

    //총상품금액
    var totalProductPrice = totalPrice;
    var innerTotalProductPrice = document.getElementById("totalProductPrice");
    innerTotalProductPrice.innerHTML =
      totalProductPrice.toLocaleString() + "원";

    //총 배송비
    var totalDelvPrice = totalProductPrice > 50000 ? 0 : 3000;
    var innerTotalDelvPrice = document.getElementById("totalDelvPrice");
    innerTotalDelvPrice.innerHTML = totalDelvPrice.toLocaleString() + "원";

    //총 할인금액
    var totalDiscountPrice = totalProductPrice * 0.04;
    // 1의 자리 버림
    totalDiscountPrice = Math.floor(totalDiscountPrice / 10) * 10;
    var innerTotalDiscountPrice = document.getElementById("totalDiscountPrice");
    innerTotalDiscountPrice.innerHTML =
      totalDiscountPrice.toLocaleString() + "원";

    //결제 예정금액
    var totalPaymentPrice =
      totalProductPrice + totalDelvPrice - totalDiscountPrice;
    var innerTotalPaymentPrice = document.getElementById("totalPaymentPrice");
    innerTotalPaymentPrice.innerHTML =
      totalPaymentPrice.toLocaleString() + "원";
  },

  //장바구니 아이템 1개 삭제
  deleteBasketItem: function (cart_dtl_id) {
    location.href = "cartDelete.do?cart_dtl_id=" + cart_dtl_id;
  },

  //장바구니 아이템 선택 삭제
  deleteBasketSel: function (cart_dtl_id) {
    var chkCnt = $("input:checkbox[class='cart_check']:checked").length;
    if (chkCnt === 0) {
      alert("선택된 항목이 없습니다.");
    } else {
      if (confirm("선택한 품목을 삭제하시겠습니까?")) {
        location.href = "cartDelete.do?cart_dtl_id_list=" + chkList;
      }
    }
  },

  //장바구니 수량변경에 의한 배열 수정
  quatityArrMod: function (cart_dtl_id, iQuantity) {
    $.ajax({
      type: "POST",
      url: "/cartListAjax.do",
      data: {},
      success: function (data) {
        cartList = data;
        Basket.cartAmountSetMod(data, cart_dtl_id, iQuantity);
      },
      error: function () {
        alert("서버와의 통신 중 오류가 발생했습니다.");
      },
    });
  },
  //체크리스트 정보
  isChecked: function (obj) {
    if (quanChk == 1) {
      alert("변경 버튼을 클릭하여 변경 된 수량을 적용 하세요.");
      return false;
    } else {
      if (obj.checked) {
        chkList.push(obj.name);
      } else {
        for (let i = 0; i < chkList.length; i++) {
          if (chkList[i] === obj.name) {
            chkList.splice(i, 1);
          }
        }
      }
      if (chkList.length > 0) {
        //체크박스에 관한 것만 계산(수량변경 안됨.변경서 체크해제)
        $.ajax({
          type: "POST",
          url: "/cartListAjaxChk.do",
          data: { chkList: chkList },
          traditional: true,
          success: function (data) {
            ChkcartList = data;
            Basket.cartAmountSetChk(ChkcartList);
          },
          error: function () {
            alert("서버와의 통신 중 오류가 발생했습니다.");
          },
        });
      }
    }
  },

  allChkClear() {
    $(".cart_check").prop("checked", false);
  },

  //전체상품 주문
  allProductOrder: function () {
    if (cartList != null || cartList != undefined) {
      alert("변경 버튼을 클릭하여 변경 된 수량을 적용 하세요.");
    } else {
      alert("결제창으로 이동합니다.");
      location.href = "/payment.do";
    }
  },

  //선택상품 주문
  selProductOrder: function () {
    var chkCnt = $("input:checkbox[class='cart_check']:checked").length;
    if (chkCnt === 0) {
      alert("선택된 항목이 없습니다.");
    } else {
      if (cartList != null || cartList != undefined) {
        alert("변경 버튼을 클릭하여 변경 된 수량을 적용 하세요.");
      } else {
        console.log(chkList);
        alert("결제창으로 이동합니다.");
        location.href = "/payment.do?cart_dtl_id_list=" + chkList;
      }
    }
  },
  
  //장바구니 저장 후 결제창 불러오기
  cartInsertPay : function() {
      if (isRequestInProgress) return; // 요청이 진행 중이면 함수 종료

      const productArray = [];
      document.querySelectorAll(".option_product").forEach((row) => {
        const productId = getParameterByName("product_id");
        const quantity = row.querySelector(".quantity_opt").value;
        const option_id = row.querySelector(".product span").textContent.split(". ")[1];
        const number = row.querySelector(".product span").textContent.split(". ")[0];
        const idx = parseInt(number, 10); // number를 idx로 변환

        productArray.push({
          product_id: productId,
          quantity: quantity,
          option_id: option_id,
          idx: idx,
        });
      });

	  if(productArray.length===0){
		alert('상품 옵션을 선택하세요');
		return ;
	  }
     // 장바구니에 결제창으로 불러올 리스트 만들기
	  var str ;
	  var cart_dtl_id_lit = new Array();
	  productArray.forEach(function(item){
	
	  str = 	item.product_id.concat('_',item.idx);
	  cart_dtl_id_lit.push(str);
	  })
      isRequestInProgress = true; // 요청 시작 시 플래그 설정
      document.getElementById("actionCart").disabled = true; // 버튼 비활성화

      // ajax 요청(Json 처리 안함)
      $.ajax({
        url: "/cartInsert.do",
        type: "post",
        data: JSON.stringify(productArray),
        contentType: "application/json",
        success: function (data) {
          isRequestInProgress = false; // 요청 완료 시 플래그 해제
		
        },
        error: function (xhr, status, error) {
          alert("결제 요청 실패");
          isRequestInProgress = false; // 요청 실패 시 플래그 해제
          document.getElementById("actionCart").disabled = false; // 버튼 활성화
        },
      });
	    location.href = "/payment.do?cart_dtl_id_list=" + cart_dtl_id_lit;
    },
  
  //단일상품 주문
  oneProductOrder: function (cart_dtl_id) {
    if (cartList != null || cartList != undefined) {
      alert("변경 버튼을 클릭하여 변경 된 수량을 적용 하세요.");
    } else {
      chkList.push(cart_dtl_id);
      console.log(chkList);
      alert("결제창으로 이동합니다.");
      location.href = "/payment.do?cart_dtl_id_list=" + chkList;
    }
  },

  // 결제 금액 조회 (결제창)
  paymemtSetAmont: function (orderArr, usePoint) {
    var totalPrice = 0;
	var tempPrice = 0;
    var point = 0;
    orderArr.forEach(function (item) {
      tempPrice = Number(item.price) * item.quantity;
      totalPrice += Number(tempPrice);
      point = item.point;

      //최초 결제 리스트 처리
      paymentList.push(item.cart_dtl_id);
      console.log("최초 결제 리스트", paymentList);
    });
    /*--------------------------금액 셋팅---------------------------*/
    //보유 포인트
    var innerPonts = document.getElementById("points");
    innerPonts.innerHTML = point.toLocaleString() + "원";

    //총상품금액(1의 자리 버림)
    var totalProductPrice = totalPrice;
    var innerTotalProductPrice = document.getElementById("totalProductPrice");
    innerTotalProductPrice.innerHTML =
      totalProductPrice.toLocaleString() + "원";

    // 배송비
    var delvAmout = totalProductPrice > 50000 ? 0 : 3000;
    var innerDelvAmout1 = document.getElementById("delvAmout1");
    innerDelvAmout1.innerHTML = delvAmout.toLocaleString() + "원";
    var innerDelvAmout2 = document.getElementById("delvAmout2");
    innerDelvAmout2.innerHTML = delvAmout.toLocaleString() + "원";

    //상품 할인금액
    var productDscount = totalProductPrice * 0.04;
    productDscount = Math.floor(productDscount / 10) * 10;
    var innerProductDscount1 = document.getElementById("productDscount1");
    innerProductDscount1.innerHTML = productDscount.toLocaleString() + "원";
    var innerProductDscount2 = document.getElementById("productDscount2");
    innerProductDscount2.innerHTML = productDscount.toLocaleString() + "원";

    //포인트 사용금액금액
    var applyPoint = usePoint == undefined ? 0 : Number(usePoint);
    var innerUsePoint = document.getElementById("usePoint");
    //    innerUsePoint.innerHTML = applyPoint +'원';

    //할인 합계금액
    var totalDiscount = productDscount;
    //1의 자리 버림
    totalDiscount = Math.floor(totalDiscount / 10) * 10;
    var innerTotalDiscount1 = document.getElementById("totalDiscount1");
    innerTotalDiscount1.innerHTML = totalDiscount.toLocaleString() + "원";
    var innerTotalDiscount2 = document.getElementById("totalDiscount2");
    innerTotalDiscount2.innerHTML = totalDiscount.toLocaleString() + "원";

    //최종결제금액
    var totalPaymentAmount = totalProductPrice + delvAmout - totalDiscount;
    var innerTotalPaymentAmount = document.getElementById("totalPaymentAmount");
    innerTotalPaymentAmount.innerHTML =
      totalPaymentAmount.toLocaleString() + "원";

    //상품적립금
    var productSavePoint = parseInt(totalProductPrice* 0.05);
    var innerProductSavePoint = document.getElementById("productSavePoint");
    innerProductSavePoint.innerHTML = productSavePoint.toLocaleString() + "원";

    //예상 총 적립금
    var expectSavePoint = productSavePoint;
    var innerExpectSavePoint = document.getElementById("expectSavePoint");
    innerExpectSavePoint.innerHTML = expectSavePoint.toLocaleString() + "원";

    //결제전송금액
    var paySubmit = totalPaymentAmount;
    var innerPaySubmit = document.getElementById("paySubmit");
    innerPaySubmit.innerHTML = totalPaymentAmount.toLocaleString() + "원";

    let paymentInfo = {
      totalProductPrice: totalProductPrice,
      delvAmout: delvAmout,
      productDscount: productDscount,
      applyPoint: applyPoint,
      expectSavePoint: expectSavePoint,
      totalPaymentAmount: totalPaymentAmount,
    };

    return paymentInfo;
  },

  //부가정보에 따른 금액 변경 로직
  finalSetAmount: function (orderArr, usePoint) {
    var totalPrice = 0;
    var point = 0;
    orderArr.forEach(function (item) {
      tempPrice = Number(item.price*item.quantity) ;
      totalPrice += Number(tempPrice);
      point = item.point;
    });
    /*--------------------------금액 셋팅---------------------------*/
    //보유 포인트
    var innerPonts = document.getElementById("points");
    innerPonts.innerHTML = point + "원";

    //총상품금액
    var totalProductPrice = totalPrice;
    var innerTotalProductPrice = document.getElementById("totalProductPrice");
    innerTotalProductPrice.innerHTML =
      totalProductPrice.toLocaleString() + "원";

    // 배송비
    var delvAmout = totalProductPrice > 50000 ? 0 : 3000;
    var innerDelvAmout1 = document.getElementById("delvAmout1");
    innerDelvAmout1.innerHTML = delvAmout.toLocaleString() + "원";
    var innerDelvAmout2 = document.getElementById("delvAmout2");
    innerDelvAmout2.innerHTML = delvAmout.toLocaleString() + "원";

    //상품 할인금액
    var productDscount = totalProductPrice * 0.04;
    productDscount = Math.floor(productDscount / 10) * 10;
    var innerProductDscount1 = document.getElementById("productDscount1");
    innerProductDscount1.innerHTML = productDscount.toLocaleString() + "원";
    var innerProductDscount2 = document.getElementById("productDscount2");
    innerProductDscount2.innerHTML = productDscount.toLocaleString() + "원";

    //포인트 사용금액금액
    var applyPoint = usePoint == undefined ? 0 : Number(usePoint);
    var innerUsePoint = document.getElementById("usedPoint");
    innerUsePoint.innerHTML = applyPoint.toLocaleString() + "원";

    //할인 합계금액
    var totalDiscount = Number(productDscount) + Number(applyPoint);
    totalDiscount = Math.floor(totalDiscount / 10) * 10;
    var innerTotalDiscount1 = document.getElementById("totalDiscount1");
    innerTotalDiscount1.innerHTML = totalDiscount.toLocaleString() + "원";
    var innerTotalDiscount2 = document.getElementById("totalDiscount2");
    innerTotalDiscount2.innerHTML = totalDiscount.toLocaleString() + "원";

    //최종결제금액
    var totalPaymentAmount =
      Number(totalProductPrice) + Number(delvAmout) - Number(totalDiscount);
    var innerTotalPaymentAmount = document.getElementById("totalPaymentAmount");
    innerTotalPaymentAmount.innerHTML =
      totalPaymentAmount.toLocaleString() + "원";

    //상품적립금
    var productSavePoint = parseInt(totalProductPrice * 0.05);
    var innerProductSavePoint = document.getElementById("productSavePoint");
    innerProductSavePoint.innerHTML = productSavePoint.toLocaleString() + "원";

    //예상 총 적립금
    var expectSavePoint = productSavePoint;
    var innerExpectSavePoint = document.getElementById("expectSavePoint");
    innerExpectSavePoint.innerHTML = expectSavePoint.toLocaleString() + "원";

    //결제전송금액
    var paySubmit = totalPaymentAmount;
    var innerPaySubmit = document.getElementById("paySubmit");
    innerPaySubmit.innerHTML = totalPaymentAmount.toLocaleString() + "원";

    let paymentInfo = {
      totalProductPrice: totalProductPrice,
      delvAmout: delvAmout,
      productDscount: productDscount,
      applyPoint: applyPoint,
      expectSavePoint: expectSavePoint,
      totalPaymentAmount: totalPaymentAmount,
    };

    return paymentInfo;
  },

  /*------결제 창에서 품목 삭제(장바구니 삭제 후 다시 불러오기)------*/
  productRemove: function (cart_dtl_id) {
    if (confirm("선택한 품목을 삭제하시겠습니까?")) {
      for (let i = 0; i < paymentList.length; i++) {
        if (paymentList[i] === cart_dtl_id) {
          paymentList.splice(i, 1);
        }
      }

      location.href =
        "paymentDelete.do?cart_dtl_id_del=" +
        cart_dtl_id +
        "&paymentList=" +
        paymentList;
    }
    ㅁ;
  },
  allChk: function () {
    $(".cart_check").prop("checked", true);

    paymentList.forEach(function (item) {
      chkList.push(item);
    });
    console.log(chkList);
  },
  moveWish: function (product_id) {
    $.ajax({
      url: "wishListAdd.do",
      type: "post",
      data: {
        product_id: product_id,
      },
      success: function (data) {
        if (data.redirect) {
          alert(data.message);
          window.location.href = data.redirect;
        } else {
          alert(data.message);
        }
      },
    });
  },
  orderMember: function (obj) {
    let member_id = obj[0].member_id;
    $.ajax({
      url: "/payMember.do",
      type: "GET",
      data: member_id,
      success: function (data) {
        Basket.memberSetup(data);
      },
      error: function () {
        alert("ajax 통신실패");
      },
    });
  },
  memberSetup: function (data) {
    $("#orderName").val(data.name);

    $("#postcode").val(data.postcode);
    $("#address").val(data.addr);
    $("#detailAddress").val(data.detailaddr);

    $("#tel4").val(data.tel);
    let telArr = data.tel.split("-");
    $("#tel2").val(telArr[1]);
    $("#tel3").val(telArr[2]);

    $("#emailArr").val(data.email);
    let emailArr = data.email.split("@");
    $("#email").val(emailArr[0]);

    //옵션 찾기 ..보류
    let emailOptionArr = $(".choose_mail")
      .find("option")
      .map(function () {
        return $(this).val();
      })
      .get();

    console.log("여기까지");
  },

  paymentMethod: function () {},
  payProcess: function (intlOrder, paymentInfo) {
    var orderName = $("#orderName").val();
    var address = $("#address").val();
    var detailAddress = $("#detailAddress").val();
    var addr = address + " " + detailAddress;
    var tel = $("#tel4").val();
    var email = $("#emailArr").val();
    let orderInfo = {
      orderName: orderName,
      addr: addr,
      tel: tel,
      email: email,
      tel: tel,
    };

    $.ajax({
      url: "/payProcess.do",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify({
        intlOrder: intlOrder,
        paymentInfo: paymentInfo,
        orderInfo: orderInfo,
      }),
      success: function (data) {
        if (data.success) {
          alert(data.message);
          window.location.href = "/myPage.do";
        } else {
          alert("결제에 실패했습니다: " + data.message);
        }
      },
      error: function () {
        alert("ajax 통신실패");
      },
    });
  },
  
  stockChk : function (cart_dtl_id){
	  $.ajax({
		      url: "/stockChk.do",
			  async: false,
		      type: "GET",
		      data: {cart_dtl_id:cart_dtl_id},
		      success: function (data) {
				stockNum = data;
		      },
		      error: function () {
		        alert("ajax 통신실패");
		      },
	    });
  },
		  
};
