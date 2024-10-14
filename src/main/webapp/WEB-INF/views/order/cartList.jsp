<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta name="format-detection" content="telephone=no">
      <meta name="description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
      <meta property="og:type" content="website">
      <meta property="og:title" content="구직타이거">
      <meta property="og:description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
      <meta property="og:image"
        content="https://contents.sixshop.com/uploadedFiles/56465/default/image_1710376929430.png">
      <link rel="icon" href="images/common/favicon.png">
      <link rel="apple-touch-icon-precomposed" href="images/common/favicon.png">
      <title>GUZIK TIGER 구직타이거</title>
      <!-- 라이브러리 -->
      <link rel="stylesheet" href="css/jquery-ui.min.css">
      <link rel="stylesheet" href="css/swiper-bundle.min.css">
      <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/cart.css?v=<echo time(); ?>">

      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/swiper-bundle.min.js"></script>
      <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
      <script src="js/main.js"></script>
    </head>

    <body>

      <script>
        $(document).ready(function () {
          function fnIntl() {
            //장바구니 리스트 스크립트에서 변환 , 
            let arr = new Array();
            <c:forEach items="${cartList}" var="item">
              arr.push({product_id : "${item.product_id}"
              , cart_dtl_id : "${item.cart_dtl_id}"
              , option_id : "${item.option_id}"
              , product_name : "${item.product_name}"
              ,price : "${item.price}"
              ,idx : "${item.idx}"
              ,quantity : "${item.quantity}"
              ,option_List :"${item.option_list}"});
            </c:forEach>
            console.log('###장바구니리스트##', arr);
            return arr;
          }

          //주문금액 정보
          let arr = fnIntl();
          var totalPrice = Basket.cartAmountSet(arr);

          //옵션 및 옵션가격 조회
          $(function () {

            $(".optionNum").change(function () {
              var idx = (this.value);
              var product_id = $(this).parent().attr('id');
              let option_price = arr.filter((e) => {
                return idx === e.idx && product_id === e.product_id
              });

              var out = document.getElementById(product_id + "p");
              out.innerHTML = option_price[0].price + '원';
              //$('#priceTest').text(option_price[0].price);
            });
          });


        });

        //장바구 아이템 구매수량 수정
        function fnQuantityMod(obj) {
          var quantity = $('#' + obj.name).val();
          var cart_dtl_id = obj.name;
          location.href = 'cartUpdate.do?quantity=' + quantity + '&cart_dtl_id=' + cart_dtl_id;
        }


      </script>
      <div id="skip_navi">
        <a href="#container"></a>
      </div>
      <div id="wrap">

        <!-- 헤더 -->
        <%@ include file="../header.jsp" %>
          <div id="container">
            <div class="location">
              <span>현재위치</span>
              <ol>
                <li><a href="/">홈</a></li>
                <li title="현재위치" class="on">
                  <strong>장바구니</strong>
                </li>
              </ol>
            </div>
            <main id="contents">
              <div class="top_titlearea">
                <h2>장바구니</h2>
              </div>
              <div class="step">
                <ol class="step_txt">
                  <li class="selected">1. 장바구니</li>
                  <li>2. 주문서작성</li>
                  <li>3. 주문완료</li>
                </ol>
              </div>
              <div class="cart_area">
                <div class="cart_porduct">
                  <div class="selected_product ec-base-fold theme1 eToggle selected">
                    <div class="title">
                      <h3>장바구니 상품</h3>
                    </div>
                    <div class="contents">
                      <div class="sub_title">
                        <h4>일반상품 (3)</h4>
                      </div>
                      <div class="cart_wrap">
                        <div class="cart_list">
                          <% request.setAttribute("arr", "${arr}" ); %>
                            <!--  -------------------------아이템 시작--------------------------------------------------------- -->

                            <c:forEach items="${cartList}" var="row" varStatus="loop">
                              <div class="cart_item">
                                <div class="cart_box">
                                  <input type="checkbox" name="${row.cart_dtl_id}" class="cart_check" onclick='return Basket.isChecked(this); '> &nbsp;
                                  <div class="thumbnail">
                                    <a href="#">
                                      <img src="../images/productList/${row.img_id}" alt="상품명">
                                    </a>
                                  </div>
                                  <div class="description">
                                    <strong class="prdName" title="상품명" id="prod_id">
                                      <a href="#">${row.product_name}</a>
                                    </strong>
                                    <ul class="price">
                                      <li class="id">
                                        <strong class="price_value" id= "${'p_' }${row.cart_dtl_id}">${row.price}</strong>
                                        <span class="displaynone">
                                          <span></span>
                                        </span>
                                      </li>
                                      <script>
                                        // 가격을 0,000원 형식으로 변환하고 적립금을 계산
                                        $(document).ready(function () {
                                          $('.price_value').each(function () {
                                            let price = parseInt($(this).text().replace(/[^0-9]/g, ''));
                                            $(this).text(price.toLocaleString() + '원');

                                            // 적립금 계산
                                            let mileagePoint = Math.floor(price * 0.05);
                                            $(this).closest('.cart_box').find('.mileage_point').text(mileagePoint.toLocaleString() + '원');
                                          });
                                        });
                                      </script>
                                    </ul>
                                    <ul class="info">
                                      <li>배송 :
                                        <span class="displaynone">
                                          0
                                          <span class="refer displaynone"></span>
                                        </span>
                                        [무료] / 기본배송
                                      </li>
                                      <li class="displaynone">
                                        배송주기
                                        <span class="txtEm"></span>
                                      </li>
                                      <li title="적립금" id="prod_mileage" class="mileage">
                                        <input id="" name="prod_mileage_all" value="" type="hidden">
                                        <img src="/images/ico_product_point.gif">
                                        <span class="mileage_point"></span>
                                      </li>
                                    </ul>
                                    <ul class="optionGroup">
                                      <li class="xans-record-">
                                        <div class="name">
                                          <span class="product displaynone">${row.product_name}</span>
                                          <c:if test="${row.option_yn=='Y'}">
                                            <span class="optionStr">[옵션: 0${row.idx}. ${row.option_id}]</span>
                                          </c:if>
                                          <span class="displaynone">(2개)</span>
                                          <span class>
                                            <a href="#none" onclick="Basket.showOptionChangeLayer('option_modify_layer_0', $(this))" class="btnText displaynone">변경</a>
                                          </span>
                                        </div>
                                      </li>
                                    </ul>
                                  </div>
                                  <div class="quantity">
                                    <span class="label displaynone">수량</span>
                                    <div>
                                      <span class="qty">
                                        <input id="${row.cart_dtl_id}" size="2" value="${row.quantity}" type="text">
                                        <a href="javascript:;" class="btn_plus" onclick="Basket.addQuantityShortcut('${row.cart_dtl_id}');">수량증가</a>
                                        <a href="javascript:;" class="btn_minus" onclick="Basket.outQuantityShortcut('${row.cart_dtl_id}');">수량감소</a>
                                      </span>
                                      <button type="button" name="${row.cart_dtl_id}" class="btnNormal btn_edit" onclick="fnQuantityMod(this)">변경</button>
                                    </div>
                                    <div class="displaynone">2</div>
                                  </div>
                                  <div class="sumPrice displaynone">
                                    <span class="label">주문금액</span>
                                    <strong>0</strong>
                                    원
                                    <span class="displaynone"></span>
                                  </div>
                                  <div class="buttonGroup">
                                    <a href="#none" onclick="Basket.moveWish('${row.product_id}');" class="btnNormal sizeM">관심상품</a>
                                    <a href="#none" onclick="Basket.oneProductOrder('${row.cart_dtl_id}');" class="btnSubmit sizeM">주문하기</a>
                                  </div>
                                </div>
                                <a href="#none" onclick="Basket.deleteBasketItem('${row.cart_dtl_id}');" class="btn_delete">삭제</a>
                              </div>
                            </c:forEach>
                            <!--  -------------------------아이템 끝--------------------------------------------------------- -->


                            <div class="summary">
                              <div class="title">
                                <h5>[기본배송]</h5>
                              </div>
                            </div>
                        </div>
                      </div>
                      <div class="xans-element- xans-order xans-order-selectorder ec-base-button typeMulti">
                        <div class="gLeft">
                          <a href="#none" class="btnNormal sizeS" id="select_all" onclick="Basket.allChk()">전체 선택</a>
                          <a href="#none" onclick="Basket.deleteBasketSel()" class="btnNormal sizeS">선택 삭제</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="cart_total" style="top: 0;">
                  <div class="sticky">
                    <div class="totalSummary">
                      <div class="totalSummary_item">
                        <div class="heading">
                          <h4 class="title">총 상품금액</h4>
                          <div class="data">
                            <strong>
                              <span class="totalPrice" id="totalProductPrice">170,500</span>
                            </strong>

                          </div>
                        </div>
                      </div>
                      <div class="shipping totalSummary_item">
                        <div class="heading">
                          <h4 class="title">총 배송비</h4>
                          <div class="data">
                            <strong class="total_delv_price_front">
                              <span class="total_delv_price_front" id="totalDelvPrice">0</span>
                            </strong>

                          </div>
                        </div>
                      </div>
                      <div class="discount totalSummary_item">
                        <div class="heading">
                          <h4 class="title">총 할인금액</h4>
                          <div class="data">
                            <strong id="totalDiscountPrice">3,650</strong>

                            <span class="refer displaynone">
                              <span id="otal_product_discount_price_back"></span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="total">
                        <h3 class="title">결제예정금액</h3>
                        <div class="paymentPrice">
                          <strong id="totalPaymentPrice">170,500</strong>
                        </div>
                      </div>
                    </div>
                    <div class="orderFixItem">
                      <div class="ec-base-button">
                        <a href="#" onclick="Basket.allProductOrder(); return false;"
                          class="btnSubmit gFull sizeL">전체상품주문하기</a>
                        <a href="#" onclick="Basket.selProductOrder(); return false;"
                          class="btnNormal gFull sizeL">선택상품주문하기</a>
                      </div>
                    </div>
                    <div class="gInnerMargin">
                      <ul class="ec-base-help">
                        <li class>할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</li>
                        <li class="displaynone">주문서 작성 시 배송비를 확인할 수 있습니다.</li>
                      </ul>
                    </div>
                  </div>
                </div>
            </main>
            <div class="ec-base-help">
              <h3>이용안내</h3>
              <div class="inner">
                <h4>장바구니 이용안내</h4>
                <ul>
                  <li class=" ">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
                  <li class=" ">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
                  <li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
                  <li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
                </ul>
                <h4>무이자할부 이용안내</h4>
                <ul>
                  <li>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
                  <li>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
                  <li>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
                  <li class=" ">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.
                    <br>
                    실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
                  </li>
                </ul>
              </div>
            </div>
          </div>
      </div>
      <!-- 푸터 -->
      <%@ include file="../footer.jsp" %>
    </body>

    </html>