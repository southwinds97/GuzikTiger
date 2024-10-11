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
      <meta property="og:image"
        content="https://contents.sixshop.com/uploadedFiles/56465/default/image_1710376929430.png">
      <title>MUZIK TIGER 무직타이거</title>
      <link rel="icon" href="images/common/favicon.png">
      <link rel="apple-touch-icon-precomposed" href="images/common/favicon.png">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
      <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
      <link rel="stylesheet" href="css/jquery-ui.min.css">
      <link rel="stylesheet" href="css/swiper-bundle.min.css">
      <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/productView.css?v=<echo time(); ?>">

      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/swiper-bundle.min.js"></script>
      <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
      <script src="js/productView.js?v=<?php echo time(); ?>"></script>
    </head>

    <body>
      <div id="skip_navi">
        <a href="#container"></a>
      </div>
      <div id="wrap">
        <!-- 헤더 -->
        <%@ include file="../header.jsp" %>
          <div id="container">
            <main id="contents">
              <div class="path">
                <span>현재위치</span>
                <ol>
                  <li><a href="/">홈</a></li>
                  <li class="current">
                    <a href="productList.do?category=mainCate">SHOP</a>
                  </li>
                </ol>
              </div>
              <c:forEach items="${productViewList}" var="row" varStatus="loop">
                <c:if test="${row.idx eq 1}">
                  <div class="product_detail">
                    <div class="imgArea">
                      <div class="clearfix">
                        <div class="listImg pull_left">
                          <div
                            class="inner swiper-container jsThumbNav swiper-container-initialized swiper-container-vertical"
                            style="cursor: grab;">
                            <ul class="list swiper-wrapper">
                              <li class="list__item swiper-slide xans-record- run swiper-slide-active current">
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지"
                                  data-slide-index="0">
                              </li>
                              <li class="list__item swiper-slide xans-record- run swiper-slide-active">
                                <img src="images/sl2.jpg" class="ThumbImage" alt="상품 이미지" data-slide-index="1">
                              </li>
                              <li class="list__item swiper-slide xans-record- run swiper-slide-active">
                                <img src="images/sl3.jpg" class="ThumbImage" alt="상품 이미지" data-slide-index="2">
                              </li>
                              <li class="list__item swiper-slide xans-record- run swiper-slide-active">
                                <img src="images/sl4.jpg" class="ThumbImage" alt="상품 이미지" data-slide-index="3">
                              </li>
                            </ul>
                            <span class="swiper_notification" aria-live="assertive" aria-atomic="true"></span>
                          </div>
                        </div>
                        <div class="prdImg pull-right">
                          <div class="thumbnail jsThumbnail displaynone">
                            <a href="#" alt="상품 이미지">
                              <img src="images/sl1.jpg" alt="무직타이거 부끄부끄 미니 인형 키링 6종" class="BigImage ">
                            </a>
                          </div>
                          <div
                            class="xans-element- xans-product xans-product-addimage thumbnail swiper-container jsPrdThumbSlide swiper-container-initialized swiper-container-horizontal"
                            style="cursor: grab;">
                            <ul class="thumbnail__list swiper-wrapper">
                              <li class="thumbnail__item swiper-slide xans-record- swiper-slide-active"
                                style="width: 680px;">
                                <img src="images/sl1.jpg" class="ThumbImage" alt="상품 이미지">
                              </li>
                              <li class="thumbnail__item swiper-slide xans-record- swiper-slide-active"
                                style="width: 680px;">
                                <img src="images/sl2.jpg" class="ThumbImage" alt="상품 이미지">
                              </li>
                              <li class="thumbnail__item swiper-slide xans-record- swiper-slide-active"
                                style="width: 680px;">
                                <img src="images/sl3.jpg" class="ThumbImage" alt="상품 이미지">
                              </li>
                              <li class="thumbnail__item swiper-slide xans-record- swiper-slide-active"
                                style="width: 680px;">
                                <img src="images/sl4.jpg" class="ThumbImage" alt="상품 이미지">
                              </li>
                            </ul>
                            <div class="thumb-slide-pager jsThumbSlidePager">
                              <div class="swiper-scrollbar-drag" style="width: 146.25px;"></div>
                            </div>
                            <div class="thumb-slide__nav thumb-slide__nav--prev jsThumbPrev swiper-button-disabled"
                              tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></div>
                            <div class="thumb-slide__nav thumb-slide__nav--next jsThumbNext" tabindex="0" role="button"
                              aria-label="Next slide" aria-disabled="false"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="infoArea">
                      <div class="iconArea">
                        <button type="button" class="info_btn">
                          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#391818"
                            viewBox="0 0 256 256">
                            <path d="M223,57a58.07,58.07,0,0,0-81.92-.1L128,69.05,114.91,56.86A58,
                  58,0,0,0,33,139l89.35,90.66a8,8,0,0,0,11.4,0L223,139a58,
                  58,0,0,0,0-82Zm-11.35,70.76L128,212.6,44.3,127.68a42,42,
                  0,0,1,59.4-59.4l.2.2,18.65,17.35a8,8,0,0,0,10.9,0L152.1,
                  68.48l.2-.2a42,42,0,1,1,59.36,59.44Z"></path>
                          </svg>
                        </button>
                        <button type="button" class="info_btn">
                          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#391818"
                            viewBox="0 0 256 256">
                            <path d="M176,160a39.89,39.89,0,0,0-28.62,12.09l-46.1-29.63a39.8,39.8,
                  0,0,0,0-28.92l46.1-29.63a40,40,0,1,0-8.66-13.45l-46.1,
                  29.63a40,40,0,1,0,0,55.82l46.1,29.63A40,40,0,1,0,176,
                  160Zm0-128a24,24,0,1,1-24,24A24,24,0,0,1,176,32ZM64,
                  152a24,24,0,1,1,24-24A24,24,0,0,1,64,152Zm112,72a24,
                  24,0,1,1,24-24A24,24,0,0,1,176,224Z"></path>
                          </svg>
                        </button>
                      </div>
                      <div class="layer">
                        <div class="layer_inner">
                          <div class="opt_content">
                            <div class="top_content">
                              <div class="layer_title">
                                <h1>${productViewList[0].product_name}</h1>
                                <span class="icon">
                                  <img src="/images/ico_new2.png" class="icon_img" alt="new">
                                </span>
                              </div>
                              <div class="layer_detail">
                                <table border="1">
                                  <caption>기본정보</caption>
                                  <tbody>
                                    <tr class="product_price">
                                      <td>${productViewList[0].price}원</td>
                                      <script>
                                        // 가격을 0,000원 형식으로 변환
                                        $(document).ready(function () {
                                          $('.product_price td').each(function () {
                                            let price = parseInt($(this).text().replace(/[^0-9]/g, ''));
                                            $(this).text(price.toLocaleString() + '원');
                                          });
                                        });
                                      </script>
                                    </tr>
                                    <tr class="layer_mileage">
                                      <th scope="row">
                                        <span>적립금</span>
                                      </th>
                                      <td>
                                        <span class="row_txt">5%</span>
                                      </td>
                                    </tr>
                                    <tr class="layer_delivery">
                                      <th scope="row">
                                        <span>배송비</span>
                                      </th>
                                      <td>
                                        <span class="row_txt">3,000원 (50,000원 이상 구매시 무료)</span>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="productOption">
                              <table border="1" class="option_table">
                                <caption>상품 옵션</caption>
                                <tbody class="option">
                                  <tr>
                                    <th scope="row">디자인</th>
                                    <td>
                                      <select name="option1" id="option1" class="option_select">
                                        <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                                        <c:forEach items="${productViewList}" var="dto" varStatus="loop">
                                          <option value="${loop.count}">0${loop.count}. ${dto.option_id}</option>
                                        </c:forEach>
                                      </select>
                                      <p class="value"></p>
                                    </td>
                                  </tr>
                                </tbody>
                                <!-- <tbody></tbody>
                    <tbody>
                      <tr class="displaynone">
                        <td colspan="2" class="selectButton">
                          <a href="#none" class="btnSubmit sizeS" onclick>옵션선택</a>
                        </td>
                      </tr>
                    </tbody> -->
                              </table>
                            </div>
                            <div id="totalProducts" class>
                              <table border="1">
                                <caption>상품 목록</caption>
                                <colgroup>
                                  <col style="width: auto;">
                                  <col style="width: 100px;">
                                  <col style="width: 35px;">
                                </colgroup>
                                <thead>
                                  <tr>
                                    <th scope="col">상품명</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">가격</th>
                                  </tr>
                                </thead>
                                <tbody class="option_products">
                                  <!-- <tr class="option_product">
                                    <td>
                                      <input type="hidden" class="option_box_id">
                                      <p class="product">
                                        {productViewList[0].product_name}
                                        <br>
                                        -
                                        <span>01. 적호 뚱랑이</span>
                                      </p>
                                    </td>
                                    <td>
                                      <span class="quantity" style="width: 65px;">
                                        <input type="text" id="option_box1_quantity" name="quantity_opt[]"
                                          class="quantity_opt eProductQuantityClass" value="1">
                                        <a href="#none" class="up eProductQuantityUpClass">
                                          <img src="images/btn_count_up.gif" id="option_box1_up" class="option_box_up"
                                            alt="수량증가">
                                        </a>
                                        <a href="#none" class="down eProductQuantityDownClass">
                                          <img src="images/btn_count_down.gif" id="option_box1_down"
                                            class="option_box_down" alt="수량감소">
                                        </a>
                                      </span>
                                      <a href="#none" class="delete">
                                        <img src="images/btn_delete.gif" id="option_box1_del" class="option_box_del"
                                          alt="삭제">
                                      </a>
                                    </td>
                                    <td class="right">
                                      <span id="option_box1_price">
                                        <input type="hidden" class="option_box_price" value="">
                                        <span class="ec-front-product-item-price">17,000원</span>
                                      </span>
                                      <span class="mileage">
                                        (
                                        <img src="images/ico_product_point.gif" alt="적립금">
                                        <span id="option_box1_mileage" class="mileage_price">850</span>
                                        )
                                      </span>
                                    </td>
                                  </tr> -->
                                </tbody>
                                <tbody class="add_products"></tbody>
                              </table>
                            </div>
                            <div id="freeShipGuide" class>
                              <div class="text1">
                                <strong class="insufficientPrice">50,000</strong>
                                원만 더 구매하면
                                <strong class="shippingCost">무료배송</strong>
                              </div>
                              <div class="text2" class="display: none;">
                                <strong>무료배송</strong>
                                <span>
                                  (
                                  <strong class="shippingCost">3000</strong>
                                  원을 절약했어요.)
                                </span>
                              </div>
                              <div class="levelMeter">
                                <div class="levelLine">
                                  <span id="levelLineActive" style="width: 34%;"></span>
                                </div>
                                <span class="minValue">0원</span>
                                <span class="maxValue">50,000원</span>
                              </div>
                            </div>
                          </div>
                          <div id="totalPrice" class="totalPrice">
                            <strong class="title">
                              TOTAL
                              <span class="qty displaynone">(QUANTITY)</span>
                            </strong>
                            <span class="total">
                              <strong>
                                <em>0원</em>
                              </strong>
                              (0개)
                            </span>
                          </div>
                          <p class="ec-base-help displaynone EC-price-warning">할인가가 적용된 최종 결제예정금액은 주문 시 확인할 수 있습니다.</p>
                          <div id class="productAction">
                            <div class="flex">
                              <a href="#none" class="btnSubmit gFull sizeL" onclick="product_submit()">
                                <span id="actionBuy">구매하기</span>
                              </a>
                              <span class="gActionButtonColumn">
                                <button tpye="button" class="btnNormal sizeL actionCart" onclick="product_submit()"
                                  id="actionCart">장바구니</button>
                              </span>
                            </div>
                            <div id="chatis_gp_button_area"
                              style="display: flex; justify-content: center; padding: 5px 0px 0px 0px;">
                              <button id="chatis_gp_button" onclick="chatisGPApp.clickGiveButton()" type="button" style="font-family:inherit; cursor: pointer; display: flex; align-items:center; justify-content: center; 
                  background-color: #ff9327; color: #FFFFFF; border: 1px solid #ff9327; text-align : center; 
                  font-size: 16px; width : 100%; height: 52px; border-radius: 0px;">
                                <svg style="width: 19.2px; height: 19.2px; margin-right: 2px;" stroke="#FFFFFF"
                                  fill="none" viewBox="0 0 24 24" stroke-width="1.4">
                                  <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M12 8v13m0-13V6a2 2 0 112 2h-2zm0 0V5.5A2.5 2.5 0 109.5 8H12zm-7 4h14M5 12a2 2 0 110-4h14a2 2 0 110 4M5 12v7a2 2 0 002 2h10a2 2 0 002-2v-7">
                                  </path>
                                </svg>
                                선물해보랑구!
                              </button>
                            </div>
                            <div class="flex soldout displaynone">
                              <button type="button"
                                class="btnSubmit btnSubmit--soldout gFull sizeL displaynone">품절</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="product_additional">
                      <div class="additional-inner">
                        <div class="product_relation">
                          <div class="relation relative">
                            <h2>함께 많이 구매한 상품</h2>
                            <div class="prd-nav-wrap flex flex--v-center">
                              <span class="prd-nav prd-nav--prev flex flex--v-center flex--h-center jsPrdPrev"
                                role="button" aria-label="Previous slide">
                                <svg xmlns="http://www.w3.org/2000/svg" width="6.208" height="11.001"
                                  viewBox="0 0 6.208 11.001">
                                  <path id="chevron-down" d="M7.646,14.646a.5.5,0,0,0,.708.708Z
                        M13,10l.354.354L13.707,10l-.353-.354ZM8.354,4.646a.5.5,0,0,0
                        -.708.708Zm0,10.708,5-5-.708-.708-5,5Zm5-5.708-5-5-.708.708,
                        5,5Z" transform="translate(13.707 15.501) rotate(180)">
                                  </path>
                                </svg>
                              </span>
                              <span class="prd-nav prd-nav--next flex flex--v-center flex--h-center jsPrdNext"
                                role="button" aria-label="Next slide">
                                <svg xmlns="http://www.w3.org/2000/svg" width="6.208" height="11.001"
                                  viewBox="0 0 6.208 11.001">
                                  <path id="chevron-down" d="M7.646,14.646a.5.5,0,0,0,.708.708Z
                        M13,10l.354.354L13.707,10l-.353-.354ZM8.354,4.646a.5.5,0,0,0
                        -.708.708Zm0,10.708,5-5-.708-.708-5,5Zm5-5.708-5-5-.708.708,
                        5,5Z" transform="translate(-7.499 -4.499)">
                                  </path>
                                </svg>
                              </span>
                            </div>
                            <div class="product_relationlist">
                              <div class="swiper-container" style="cursor: grab;">
                                <ul class="prdList grid-slide swiper-wrapper">
                                  <li
                                    class="prdList__item swiper-slide jsRelatedItem xans-record- swiper-slide-duplicate"
                                    data-swiper-slide-index="4" style="width: 202px; margin-right: 10px;">
                                    <div class="thumbnail">
                                      <a href="#" class="thumb">
                                        <img src="/images/ss1.jpg" alt="상품 이미지">
                                      </a>
                                    </div>
                                    <div class="description">
                                      <a href="#">
                                        <strong class="name">무직타이거 쫀득쫀득 모찌 인형 6종</strong>
                                      </a>
                                      <div class="price">
                                        <span class="salePrice displaynone">8,900원</span>
                                        <span class="prdPrice ">8,900원</span>
                                      </div>
                                    </div>
                                  </li>
                                  <li
                                    class="prdList__item swiper-slide jsRelatedItem xans-record- swiper-slide-duplicate"
                                    data-swiper-slide-index="4" style="width: 202px; margin-right: 10px;">
                                    <div class="thumbnail">
                                      <a href="#" class="thumb">
                                        <img src="/images/ss2.jpg" alt="상품 이미지">
                                      </a>
                                    </div>
                                    <div class="description">
                                      <a href="#">
                                        <strong class="name">무직타이거 말랑말랑 구찌 피규어 336종</strong>
                                      </a>
                                      <div class="price">
                                        <span class="salePrice displaynone">8,900원</span>
                                        <span class="prdPrice ">8,900원</span>
                                      </div>
                                    </div>
                                  </li>
                                  <li
                                    class="prdList__item swiper-slide jsRelatedItem xans-record- swiper-slide-duplicate"
                                    data-swiper-slide-index="4" style="width: 202px; margin-right: 10px;">
                                    <div class="thumbnail">
                                      <a href="#" class="thumb">
                                        <img src="/images/ss3.jpg" alt="상품 이미지">
                                      </a>
                                    </div>
                                    <div class="description">
                                      <a href="#">
                                        <strong class="name">무직타이거 아니 왜 안돼는데</strong>
                                      </a>
                                      <div class="price">
                                        <span class="salePrice displaynone">8,900원</span>
                                        <span class="prdPrice ">8,900원</span>
                                      </div>
                                    </div>
                                  </li>
                                  <li
                                    class="prdList__item swiper-slide jsRelatedItem xans-record- swiper-slide-duplicate"
                                    data-swiper-slide-index="4" style="width: 202px; margin-right: 10px;">
                                    <div class="thumbnail">
                                      <a href="#" class="thumb">
                                        <img src="/images/ss4.jpg" alt="상품 이미지">
                                      </a>
                                    </div>
                                    <div class="description">
                                      <a href="#">
                                        <strong class="name">무직타이거 아니 왜 안돼는데2</strong>
                                      </a>
                                      <div class="price">
                                        <span class="salePrice displaynone">8,900원</span>
                                        <span class="prdPrice ">8,900원</span>
                                      </div>
                                    </div>
                                  </li>
                                  <li
                                    class="prdList__item swiper-slide jsRelatedItem xans-record- swiper-slide-duplicate"
                                    data-swiper-slide-index="4" style="width: 202px; margin-right: 10px;">
                                    <div class="thumbnail">
                                      <a href="#" class="thumb">
                                        <img src="/images/sl3.jpg" alt="상품 이미지">
                                      </a>
                                    </div>
                                    <div class="description">
                                      <a href="#">
                                        <strong class="name">무직타이거 아니 왜 안돼는데3</strong>
                                      </a>
                                      <div class="price">
                                        <span class="salePrice displaynone">8,900원</span>
                                        <span class="prdPrice ">8,900원</span>
                                      </div>
                                    </div>
                                  </li>
                                  <li
                                    class="prdList__item swiper-slide jsRelatedItem xans-record- swiper-slide-duplicate"
                                    data-swiper-slide-index="4" style="width: 202px; margin-right: 10px;">
                                    <div class="thumbnail">
                                      <a href="#" class="thumb">
                                        <img src="/images/sl3.jpg" alt="상품 이미지">
                                      </a>
                                    </div>
                                    <div class="description">
                                      <a href="#">
                                        <strong class="name">무직타이거 아니 왜 안돼는데4</strong>
                                      </a>
                                      <div class="price">
                                        <span class="salePrice displaynone">8,900원</span>
                                        <span class="prdPrice ">8,900원</span>
                                      </div>
                                    </div>
                                  </li>
                                </ul>
                                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                              </div>
                            </div>
                          </div>
                          <div id="prdDetail" class="productDetail tab-content ">
                            <div class="eventArea">
                              <div id="CommonEvent2">
                                <div>
                                  <br>
                                </div>
                                <div class="image_wrap">
                                  <img src="/images/1.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <br>
                                  <p><br></p>
                                  <img src="/images/2.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <span>언제나 함께 하고 싶은 반려 인형을 찾고 있나요? 무직타이거 뚱랑숲 친구들이 옷도 입고 손도 잡을 수 있는 크기로 찾아왔어요.</span>
                                  <p><br></p>
                                  <img src="/images/3.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/4.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/5.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/6.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/7.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/8.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <p><br></p>
                                  <p><br></p>
                                  <img src="/images/8and9.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <span>두 손으로 쥐었을 때 행복해지도록 솜량을 조절했어요. 쫀득하고 말랑한 촉감은 사랑을 가득 담고 있답니다. 뚱랑이와 친구들의 뚜렷한 이목구비, 꼭
                                    잡아주고픈 앙증맞은 손, 귀여운 꼬리까지. 작지만 야무진 퀄리티를 경험해보세요.</span>
                                  <p><br></p>
                                  <img src="/images/9.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/10.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/11.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <p>
                                    <strong>[ 01. 적호 뚱랑이 ]</strong>
                                  </p>
                                  <img src="/images/12.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <p>
                                    <strong>[ 01. 백호 뚱랑이 ]</strong>
                                  </p>
                                  <img src="/images/13.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <p>
                                    <strong>[ 01. 호호 뚱랑이 ]</strong>
                                  </p>
                                  <img src="/images/12.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <p>
                                    <strong>[ 01. 흑호 뚱랑이 ]</strong>
                                  </p>
                                  <img src="/images/13.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <p><br></p>
                                  <p><br></p>
                                  <img src="/images/14.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <span>말랑말랑하게 준비된 뚱랑이와 친구들은 누군가에겐 든든한 반려인형, 누군가에겐 작은 친구 같은 애착인형이 되어줄 거예요.</span>
                                  <p><br></p>
                                  <img src="/images/14-1.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/14-2.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/14-3.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/14-4.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/14-5.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <img src="/images/14-6.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <p><br></p>
                                  <p><br></p>
                                  <img src="/images/15.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <span>모여있을 때 더 귀여운 뚱랑이와 친구들! 6마리를 모두 구매하면 5% 할인! (</span>
                                  <s>
                                    <span>
                                      102,000원
                                    </span>
                                  </s>
                                  <span>→
                                    <span>
                                      <strong>
                                        96,900원
                                      </strong>
                                      )
                                    </span>
                                  </span>
                                  <p><br></p>
                                  <img src="/images/14-8.png" result="success" name="1.png" size="1000px/559px"
                                    filesize="194,54 kB" error=>
                                  <p><br></p>
                                  <div class="txt_wrap">
                                    <p><br></p>
                                    <strong>| DETAIL |</strong>
                                    <p>
                                    <p><br></p>
                                    <span>
                                      <strong>SIZE</strong>
                                      &nbsp; 약 120 x 170 x 70 mm
                                    </span>
                                    </p>
                                    <p>
                                      <span>
                                        <strong>MATERIAL</strong>
                                        &nbsp; Polyester
                                      </span>
                                    </p>
                                    <p><br></p>
                                    <p>
                                      <span>
                                        <strong>Made in China</strong>
                                      </span>
                                    </p>
                                    <p>
                                      <strong>Designed by MUZIKTIGER in Korea</strong>
                                    </p>
                                    <p><br></p>
                                  </div>
                                  <div class="txt_wrap2">
                                    <p><br></p>
                                    <p>
                                      <strong>| 구매 전 필독사항 |</strong>
                                    </p>
                                    <p><br></p>
                                    <div class="txt">
                                      <p>
                                        <span>
                                          <strong>주의사항 1</strong>
                                        </span>
                                      </p>
                                      <p>
                                        <span>뾰족한 모서리나 날카로운 부분에 긁힐 경우 겉감의 원단이 뜯길 수 있으니 주의바랍니다.</span>
                                      </p>
                                      <p><br></p>
                                      <p>
                                        <span>
                                          <strong>주의사항 2</strong>
                                        </span>
                                      </p>
                                      <p>
                                        <span>중성세제를 사용하여 미온수에 손세탁해주시고, 염소계 표백제를 사용하지 마십시오. 세탁 후에는 짜지 말고, 두들기며 물기를 털어주시고
                                          통풍이 잘 되는 그늘진 곳에서 건조하십시오. </span>
                                      </p>
                                      <p><br></p>
                                      <p>
                                        <span>
                                          <strong>주의사항 3</strong>
                                        </span>
                                      </p>
                                      <p>
                                        <span>PC/모바일 기기의 환경에 따라 보이는 색상이 다를 수 있으니, 주문 전 Q&A게시판을 통해 충분한 상담 후 구매
                                          부탁드립니다.</span>
                                      </p>
                                      <p><br></p>
                                      <p>
                                        <span>
                                          <strong>주의사항 4</strong>
                                        </span>
                                      </p>
                                      <p>
                                        <span>화기, 직사광선 및 고온을 피해주십시오.</span>
                                      </p>
                                      <p><br></p>
                                      <p>
                                        <span>
                                          <strong>주의사항 5</strong>
                                        </span>
                                      </p>
                                      <p>
                                        <span>제품의 본래 용도 외에 사용하지 마십시오.</span>
                                      </p>
                                      <p><br></p>
                                    </div>
                                    <img src="/images/16.png" result="success" name="1.png" size="1000px/559px"
                                      filesize="194,54 kB" error=>
                                    <p><br></p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="purchase-info" class="tab-content">
                            <div class="ec-base-fold theme1 eToggle selected">
                              <div class="eToggle_title">
                                <h2>상품결제정보</h2>
                              </div>
                              <div class="eToggle_content">
                                <div class="info">
                                  고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
                                  정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp;
                                  <br>
                                  <br>
                                  무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;
                                  <br>
                                  주문시 입력한 입금자명과 실제 입금자의 성명이 반드시 일치하여야 하며, 24시간 이내에 입금되지
                                  않은 주문은 자동취소 됩니다.
                                  <br>
                                </div>
                              </div>
                            </div>
                            <div class="ec-base-fold theme1 eToggle selected">
                              <div class="eToggle_title">
                                <h2>배송정보</h2>
                              </div>
                              <div class="eToggle_content">
                                <ul class="info delivery">
                                  <li>
                                    <strong>배송 기간</strong>
                                    <br>
                                    &nbsp; -
                                    <span>폰케이스는 주문 제작 상품으로 결제 후 2~3일 이후 출고되며, 배송에 1~2일 소요됩니다. (영업일 기준, 공휴일 제외)</span>
                                    <br>
                                    <br>
                                    <strong>오늘 출발</strong>
                                    <br>
                                    &nbsp; -
                                    <span>오후 1시까지 주문 건에 대해 당일 출고 진행 중입니다. (단, 주문 제작 상품 제외)</span>
                                    <br>
                                    &nbsp; -
                                    <span>당일 출고 시간은 출고량, 택배사 등의 상황에 따라 변동될 수 있습니니다.</span>
                                    <br>
                                    <br>
                                    <strong>배송비</strong>
                                    <br>
                                    &nbsp; -
                                    <span>결제 금액 5만원 이상 시 무료 배송됩니다.</span>
                                    <br>
                                    &nbsp; -
                                    <span>제주, 도서 및 산간지역은 추가 배송료가 착불로 발생합니다.<br>
                                      &nbsp; -
                                      <span>폰케이스는 다른 제품과 함께 구매 시 별도 배송되며 배송비는 추가되지 않습니다.</span>
                                    </span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="ec-base-fold theme1 eToggle selected">
                              <div class="eToggle_title">
                                <h2>교환 및 반품정보</h2>
                              </div>
                              <div class="eToggle_content">
                                <div class="info">
                                  <strong>교환 및 반품이 가능한 경우</strong>
                                  <br>
                                  &nbsp; -&nbsp;상품의 하자, 배송 중 파손으로 인한 교환 및 반품은 상품 수령 후 24시간 이내에 QnA 게시판 혹은 톡상담으로 요청
                                  부탁드립니다.
                                  <br>
                                  &nbsp; - 반송 시에는 상품 수령일 기준, 주말과 공휴일 포함 7일 이내에 보내주셔야 합니다.
                                  <br>
                                  &nbsp; - - 단순 변심으로 인한 교환, 반품의 경우 상품 반송 비용은 고객님께서 부담하셔야 합니다. (색상, 사이즈 교환 등)
                                  <br>
                                  <br>
                                  <strong>교환 및 반품이 불가능한 경우</strong>
                                  <br>
                                  &nbsp; - 상품 상세페이지에 교환 및 반품 불가가 명시된 상품
                                  <br>
                                  &nbsp; - 상품 수령일로부터 7일 이상이 경과된 상품
                                  <br>
                                  &nbsp; - 고객님의 부주의로 인해 상품가치가 훼손된 경우 (상품 포장 훼손, 사용 흔적, 얼룩 등)
                                  <br>
                                  &nbsp; - 상품의 사용 및 제품 구성품을 파손하거나 분실한 경우
                                  <br>
                                  <span>&nbsp; ※ 자세한 내용은 QnA 게시판 혹은 톡상담을 이용해 주시기 바랍니다.</span>
                                  <br>
                                  &nbsp;
                                  <br>
                                  <strong>수거 과정 안내</strong>
                                  <br>
                                  &nbsp;- 수거 신청(무직타이거에서 진행) &gt; 물품 수거 &gt; 물류 센터 도착 &gt; 사무실 이동 &gt; 검수 &gt; 교환/환불 진행
                                  <br>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                </c:if>
              </c:forEach>
            </main>
          </div>
      </div>
    </body>

    </html>