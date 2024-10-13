<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!DOCTYPE html>
    <html lang="ko">

    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- <meta name="viewport" content="width=1280"> -->
  <meta name="format-detection" content="telephone=no">
  <meta name="description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
  <meta property="og:type" content="website">
  <meta property="og:url" content="http://yong9701.dothome.co.kr/rwdmyungranghotdog/index.html">
  <meta property="og:title" content="MUZIK TIGER  무직타이거">
  <meta property="og:description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
  <meta property="og:image" content="https://contents.sixshop.com/uploadedFiles/56465/default/image_1710376929430.png">
  <title>MUZIK TIGER  구직타이거</title>
  <link rel="icon" href="images/common/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="images/common/favicon.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
  <link rel="stylesheet" href="css/jquery-ui.min.css">
  <link rel="stylesheet" href="css/swiper-bundle.min.css">
  <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
  <link rel="stylesheet" href="css/paymentComplet.css?v=<echo time(); ?>">
  
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
    <div class="header">
      <div class="headerTop">
        <h1 class="logotop">
          <a href="#">MUZIKTIGER</a>
        </h1>
        <div class="headerMenu gLeft">
          <span class="btnBack">
            <a href="#none" onclick="history.back(); return false;">뒤로가기</a>
          </span> 
        </div>
        <div class="headerMenu gRight">
          <span class="btnBasket">
            <a href="cartList.do">
              장바구니
              <span class="count">
                <span class="Basket-count">0
                </span>
              </span>
            </a>
          </span>
          <a href="myPage.do" class="btnMy">
            마이쇼핑 </a>
        </div>
      </div>
      <div class="titleArea">
        <h1>주문완료</h1>
      </div>
    </div>
    <div class="inner">
      <div class="resultArea">
        <p class=message>
          <strong>고객님의 주문이 <br>정상적으로 완료되었습니다.</strong>
        </p>
        <div class="resultInfo">
          <div class="ec-base-table gCellNarrow">
            <table border="0">
              <caption>주문정보</caption>
              <colgroup>
                <col style="width: 94px;">
                <col style="width: auto;">
              </colgroup>
              <tbody>
                <tr>
                  <th scope="row">주문번호</th>
                  <td class="right">
                    <span class="txtEm">20241011-0000126</span>
                  </td>
                </tr>
                <tr>
                  <th scope="row">결제금액</th>
                  <td class="right">
                    <span class="txtEm">
                      10,000원
                      <span class="refer displaynone">
                        ()</span>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="pannelArea">
        <div class="title">
          <h2>결제수단</h2>
        </div>
        <div class="contents">
          <div class="segment">
            <div class="ec-base-table typeView">
              <table border="0">
                <caption>결제수단</caption>
                <colgroup>
                  <col style="width: 94px;">
                  <col style="width: auto;">
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row">결제수단</th>
                    <td>
                      <span>신용카드</span>
                      <div class="methodDetail">
                        <span></span>
                      </div>
                      <span class="methodButton">
                        <a href="#none" class="btnNormal mini displaynone">현금영수증 신청</a>
                        <a href="#none" class="btnNormal mini displaynone">세금계산서 신청</a>
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="pannelArea">
        <div class="deliverylist">
          <div class="deliveryInfo ">
            <div class="title">
              <h2>배송지</h2>
            </div>
          </div>
          <div class="contents">
            <div class="segment">
              <div class="ec-base-table typeView">
                <table border="0">
                  <caption>배송지</caption>
                  <colgroup>
                    <col style="width: 94px;">
                    <col style="width: auto;">
                  </colgroup>
                  <tbody>
                    <tr>
                      <th scope="row">받는사람</th>
                      <td>신창섭(cang@naver.com)</td>
                    </tr>
                    <tr>
                      <th scope="row">주소</th>
                      <td>서울 종로구 종로로로로로 299-10 키키</td>
                    </tr>
                    <tr>
                      <th scope="row">연락처</th>
                      <td>010-1234-5678</td>
                    </tr>
                    <tr>
                      <th scope="row">배송요청</th>
                      <td>
                        <span class="gBlank5">부재 시 문 앞에 놓아주세요.</span>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="pannelArea">
        <div class="title">
          <h2>주문상품</h2>
        </div>
        <div class="contents">
          <div class="orderArea">
            <div class="normal">
              <div class="normalresultlist">
                <div class="ec-base-prdInfo">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="/images/dim1.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName" title="상품명">
                        <a href="#" class="ec-product-name">고스트 타이거 키링</a>
                      </strong>
                      <ul class="info">
                        <li title="옵션">
                          <p class="option displaynone"></p>
                        </li>
                        <li>수량: 1개</li>
                        <li>
                          <span id>상품구매금액: 8,500원</span>
                          <span class="displaynone">()</span>
                        </li>
                        <li class="displaynone">
                          할인금액
                          <span class="txtEm">
                            -
                            <span id>0</span>
                            원
                          </span>
                          <span class="txtWarn displaynone">()
                          </span>
                        </li>
                        <li title="배송">
                          기본배송
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="totalPrice ec-base-fold eToggle">
                <div class="title">
                  <h3>[기본배송]</h3>
                </div>
                <div class="contents">
                  <div class="ec-base-table gCellNarrow">
                    <table border="0">
                      <caption>금액정보</caption>
                      <colgroup>
                        <col style="width: 122px;">
                        <col style="width: auto;">
                      </colgroup>
                      <tbody>
                        <tr>
                          <th scope="row">상품구매금액</th> 
                          <td class="right">
                            <span class="txtEm">
                              +8,500원
                              <span class="displaynone"> (0)</span>
                            </span>
                          </td>
                        </tr>
                        <tr class="displaynone">
                          <th scope="row">할인금액</th>
                          <td class="right">
                            <span class="txtEm">-0원</span>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">배송비</th>
                          <td class="right">
                            <span class="txtEm">+3,000원</span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="pannelArea">
        <div class="title">
          <h2>결제정보</h2>
        </div>
        <div class="contents">
          <div class="segment">
            <div class="ec-base-table gCellNarrow">
              <table border="0">
                <caption>결제정보 상세</caption>
                <colgroup>
                  <col style="width: 140px;">
                  <col style="width: auto;">
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row">주문상품</th>
                    <td class="right">8,500원</td>
                  </tr>
                  <tr class="ec-order-expandwrap displaynone">
                    <th scope="row">
                      <strong class="ec-order-expand">할인/부가결제</strong>
                    </th>
                    <td class="right">-0원</td>
                  </tr>
                  <tr>
                    <th scope="row">배송비</th>
                    <td class="right">+3,000원</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="totalPay gBlank10">
              <h3 class="heading">결제금액</h3>
              <strong class="txtStrong">
                11,500원
                <span class="refer displaynone">()</span>
              </strong>
            </div>
          </div>
        </div>
      </div>
      <div class="pannelArea ">
        <div class="title">
          <h2>적립 혜택</h2>
        </div>
        <div class="contents">
          <div class="segment">
            <div class="ec-base-table gCellNarrow">
              <table border="0">
                <caption>적립 혜택 상세</caption>
                <colgroup>
                  <col style="width: 160px;">
                  <col style="width: auto;">
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row">상품별 적립금</th>
                    <td class="right">+430원</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="totalPay">
            <h3 class="heading">적립 예정금액</h3>
            <strong class="txtStrong">430원</strong>
          </div>
        </div>
      </div>
      <div class="ec-base-button gColumn">
        <a href="#" class="btnEm">주문확인하기</a>
        <a href="/" class="btnSubmit">쇼핑계속하기</a>
      </div>
    </div>
  </div>


</body>
</html>











