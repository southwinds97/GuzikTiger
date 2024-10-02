<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
</head>
<body>
  <div id="skip_navi">
    <a href="#container"></a>
  </div>
  <div id="wrap">
  
    <!-- 헤더 -->
    <%@ include file="header.jsp" %>
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
                    <div class="cart_item">
                      <div class="cart_box">
                        <input type="checkbox" id="cart_check1" class="cart_check"> &nbsp;
                        <div class="thumbnail">
                          <a href="#">
                            <img src="images/keyring.jpg" alt="상품명">
                          </a>
                        </div>
                        <div class="description">
                          <strong class="prdName" title="상품명" id="prod_id">
                            <a href="#">잇츠 오케이 노트북 아이패드 파우치</a>
                          </strong>
                          <ul class="price">
                            <li class="id">
                              <strong>43,000</strong>원 
                              <span class="displaynone">
                                <span></span>
                              </span>
                            </li>
                            <!-- <li>
                              <span class="txtSecondary">
                                43,000원 
                                <span class="displaynone"></span>
                              </span>
                            </li>
                            <li class="id">
                              <span class="txtSecondary">-0</span>
                              원
                              <span class="displaynone">
                                <span></span>
                              </span>
                            </li> -->
                          </ul>
                          <ul class="info">
                            <li>배송 : 
                              <span class="displaynone">
                                0원
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
                              2,150원
                            </li>
                          </ul>
                          <ul class="optionGroup">
                            <li class="xans-record-">
                              <div class="name">
                                <span class="product displaynone">잇츠 오케이 노트북 아이패드 파우치</span>
                                <span class="optionStr">[옵션: 02. 12~14inch(+7,000)]</span>
                                <span class="displaynone">(2개)</span>
                                <span class>
                                  <a href="#none" onclick="Basket.showOptionChangeLayer('option_modify_layer_0', $(this))" 
                                  class="btnText displaynone">변경</a>
                                </span>
                              </div>
                            </li>
                          </ul>
                        </div>
                        <div class="quantity">
                          <span class="label displaynone">수량</span>
                            <div>
                              <span class="qty">
                                <input id="quantity" name="quantity" size="2" value="1" type="text">
                                <a href="javascript:;" class="btn_plus" onclick="Basket.addQuantityShortcut('quantity_id_0', 0);">수량증가</a>
                                <a href="javascript:;" class="btn_minus" onclick="Basket.outQuantityShortcut('quantity_id_0', 0);">수량감소</a>
                              </span>
                              <a href="javascript:;" class="btnNormal btn_edit" onclick="Basket.modifyQuantity()">변경</a>
                            </div>
                          <div class="displaynone">2</div>
                        </div>
                        <div class="sumPrice displaynone">
                          <span class="label">주문금액</span>
                          <strong>86,000</strong>
                          원
                          <span class="displaynone"></span>
                        </div>               
                        <div class="buttonGroup">
                          <a href="#none" onclick="BasketNew.moveWish(0);" class="btnNormal sizeM">관심상품</a>
                          <a href="#none" onclick="Basket.orderBasketItem(0);" class="btnSubmit sizeM">주문하기</a>
                        </div>
                      </div>
                      <a href="#none" onclick="Basket.deleteBasketItem(0);" class="btn_delete">삭제</a>
                    </div>
                    <div class="cart_item">
                      <div class="cart_box">
                        <input type="checkbox" id="cart_check1" class="cart_check"> &nbsp;
                        <div class="thumbnail">
                          <a href="#">
                            <img src="images/image4.jpg" alt="상품명">
                          </a>
                        </div>
                        <div class="description">
                          <strong class="prdName" title="상품명" id="prod_id">
                            <a href="#">잇츠 오케이 노트북 아이패드 파우치</a>
                          </strong>
                          <ul class="price">
                            <li class="id">
                              <strong>43,000</strong>원 
                              <span class="displaynone">
                                <span></span>
                              </span>
                            </li>
                            <!-- <li>
                              <span class="txtSecondary">
                                43,000원 
                                <span class="displaynone"></span>
                              </span>
                            </li>
                            <li class="id">
                              <span class="txtSecondary">-0</span>
                              원
                              <span class="displaynone">
                                <span></span>
                              </span>
                            </li> -->
                          </ul>
                          <ul class="info">
                            <li>배송 : 
                              <span class="displaynone">
                                0원
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
                              2,150원
                            </li>
                          </ul>
                          <ul class="optionGroup">
                            <li class="xans-record-">
                              <div class="name">
                                <span class="product displaynone">잇츠 오케이 노트북 아이패드 파우치</span>
                                <span class="optionStr">[옵션: 02. 12~14inch(+7,000)]</span>
                                <span class="displaynone">(2개)</span>
                                <span class>
                                  <a href="#none" onclick="Basket.showOptionChangeLayer('option_modify_layer_0', $(this))" 
                                  class="btnText displaynone">변경</a>
                                </span>
                              </div>
                            </li>
                          </ul>
                        </div>
                        <div class="quantity">
                          <span class="label displaynone">수량</span>
                            <div>
                              <span class="qty">
                                <input id="quantity" name="quantity" size="2" value="1" type="text">
                                <a href="javascript:;" class="btn_plus" onclick="Basket.addQuantityShortcut('quantity_id_0', 0);">수량증가</a>
                                <a href="javascript:;" class="btn_minus" onclick="Basket.outQuantityShortcut('quantity_id_0', 0);">수량감소</a>
                              </span>
                              <a href="javascript:;" class="btnNormal btnNormal btn_edit" onclick="Basket.modifyQuantity()">변경</a>
                            </div>
                          <div class="displaynone">2</div>
                        </div>
                        <div class="sumPrice displaynone">
                          <span class="label">주문금액</span>
                          <strong>86,000</strong>
                          원
                          <span class="displaynone"></span>
                        </div>               
                        <div class="buttonGroup">
                          <a href="#none" onclick="BasketNew.moveWish(0);" class="btnNormal sizeM">관심상품</a>
                          <a href="#none" onclick="Basket.orderBasketItem(0);" class="btnSubmit sizeM">주문하기</a>
                        </div>
                      </div>
                      <a href="#none" onclick="Basket.deleteBasketItem(0);" class="btn_delete">삭제</a>
                    </div>
                    <div class="cart_item">
                      <div class="cart_box">
                        <input type="checkbox" id="cart_check1" class="cart_check"> &nbsp;
                        <div class="thumbnail">
                          <a href="#">
                            <img src="images/keyring.jpg" alt="상품명">
                          </a>
                        </div>
                        <div class="description">
                          <strong class="prdName" title="상품명" id="prod_id">
                            <a href="#">잇츠 오케이 노트북 아이패드 파우치</a>
                          </strong>
                          <ul class="price">
                            <li class="id">
                              <strong>43,000</strong>원 
                              <span class="displaynone">
                                <span></span>
                              </span>
                            </li>
                            <!-- <li>
                              <span class="txtSecondary">
                                43,000원 
                                <span class="displaynone"></span>
                              </span>
                            </li>
                            <li class="id">
                              <span class="txtSecondary">-0</span>
                              원
                              <span class="displaynone">
                                <span></span>
                              </span>
                            </li> -->
                          </ul>
                          <ul class="info">
                            <li>배송 : 
                              <span class="displaynone">
                                0원
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
                              2,150원
                            </li>
                          </ul>
                          <ul class="optionGroup">
                            <li class="xans-record-">
                              <div class="name">
                                <span class="product displaynone">잇츠 오케이 노트북 아이패드 파우치</span>
                                <span class="optionStr">[옵션: 02. 12~14inch(+7,000)]</span>
                                <span class="displaynone">(2개)</span>
                                <span class>
                                  <a href="#none" onclick="Basket.showOptionChangeLayer('option_modify_layer_0', $(this))" 
                                  class="btnText displaynone">변경</a>
                                </span>
                              </div>
                            </li>
                          </ul>
                        </div>
                        <div class="quantity">
                          <span class="label displaynone">수량</span>
                            <div>
                              <span class="qty">
                                <input id="quantity_id_0" name="quantity" size="2" value="1" type="text">
                                <a href="javascript:;" class="btn_plus" onclick="Basket.addQuantityShortcut('quantity_id_0', 0);">수량증가</a>
                                <a href="javascript:;" class="btn_minus" onclick="Basket.outQuantityShortcut('quantity_id_0', 0);">수량감소</a>
                              </span>
                              <a href="javascript:;" class="btnNormal btn_edit" onclick="Basket.modifyQuantity()">변경</a>
                            </div>
                          <div class="displaynone">2</div>
                        </div>
                        <div class="sumPrice displaynone">
                          <span class="label">주문금액</span>
                          <strong>86,000</strong>
                          원
                          <span class="displaynone"></span>
                        </div>               
                        <div class="buttonGroup">
                          <a href="#none" onclick="BasketNew.moveWish(0);" class="btnNormal sizeM">관심상품</a>
                          <a href="#none" onclick="Basket.orderBasketItem(0);" class="btnSubmit sizeM">주문하기</a>
                        </div>
                      </div>
                      <a href="#none" onclick="Basket.deleteBasketItem(0);" class="btn_delete">삭제</a>
                    </div>
                    <div class="summary">
                      <div class="title">
                        <h5>[기본배송]</h5>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="xans-element- xans-order xans-order-selectorder ec-base-button typeMulti">
                  <div class="gLeft">
                    <a href="#none" class="btnNormal sizeS" id="select_all">전체 선택</a>
                    <a href="#none" onclick="Basket.deleteBasket()" class="btnNormal sizeS">선택 삭제</a>
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
                        <span class="totalPrice">170,500</span>
                      </strong>
                      원
                    </div>
                  </div>
                </div>
                <div class="shipping totalSummary_item">
                  <div class="heading">
                    <h4 class="title">총 배송비</h4>
                    <div class="data">
                      <strong class="total_delv_price_front">
                        <span class="total_delv_price_front">0</span>
                      </strong>
                      원
                    </div>
                  </div>
                </div>
                <div class="discount totalSummary_item">
                  <div class="heading">
                    <h4 class="title">총 할인금액</h4>
                    <div class="data">
                      <strong id="total_discount_price_front">3,650</strong>
                      원
                      <span class="refer displaynone">
                        <span id="otal_product_discount_price_back"></span>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="total">
                  <h3 class="title">결제예정금액</h3>
                  <div class="paymentPrice">
                    <strong id="total_order_price_front">170,500</strong>원
                  </div>
                </div>
              </div>
              <div class="orderFixItem">
                <div class="ec-base-button">
                  <a href="#none" onclick="" class="btnSubmit gFull sizeL">전체상품주문하기</a>
                  <a href="#none" onclick="" class="btnNormal gFull sizeL">선택상품주문하기</a>
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
         <%@ include file="footer.jsp" %>
</body>
</html>