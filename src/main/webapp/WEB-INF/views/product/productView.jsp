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
      <title>GUZIK TIGER 구직타이거</title>
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
              <div class="product_detail">
                <c:forEach items="${productViewList}" var="row" varStatus="loop">
                  <c:if test="${row.idx eq 1}">
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
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지" data-slide-index="1">
                              </li>
                              <li class="list__item swiper-slide xans-record- run swiper-slide-active">
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지" data-slide-index="2">
                              </li>
                              <li class="list__item swiper-slide xans-record- run swiper-slide-active">
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지" data-slide-index="3">
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
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지" data-slide-index="0">
                              </li>
                              <li class="thumbnail__item swiper-slide xans-record- swiper-slide-active"
                                style="width: 680px;">
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지" data-slide-index="1">
                              </li>
                              <li class="thumbnail__item swiper-slide xans-record- swiper-slide-active"
                                style="width: 680px;">
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지" data-slide-index="2">
                              </li>
                              <li class="thumbnail__item swiper-slide xans-record- swiper-slide-active"
                                style="width: 680px;">
                                <img src="../images/productList/${row.img_id }" class="ThumbImage" alt="상품 이미지" data-slide-index="3">
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
                    </c:if>
              </c:forEach>
                    <!-- 사이드 메뉴 -->
                    <div class="infoArea">
                      <div class="iconArea">
                        <button type="button" class="info_btn" id="wish_add_btn">
                          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#391818"
                            viewBox="0 0 256 256">
                            <path d="M223,57a58.07,58.07,0,0,0-81.92-.1L128,69.05,114.91,56.86A58,
                  58,0,0,0,33,139l89.35,90.66a8,8,0,0,0,11.4,0L223,139a58,
                  58,0,0,0,0-82Zm-11.35,70.76L128,212.6,44.3,127.68a42,42,
                  0,0,1,59.4-59.4l.2.2,18.65,17.35a8,8,0,0,0,10.9,0L152.1,
                  68.48l.2-.2a42,42,0,1,1,59.36,59.44Z"></path>
                          </svg>
                        </button>
                        <!-- 위시리스트 추가 ajax -->
                        <script>
                            $(document).ready(function () {
                                $("#wish_add_btn").click(function () {
                                    // a 기본 이벤트 막기
                                    event.preventDefault();
                                    var product_id = $(this).siblings("input[name='product_id']").val();
                                    $.ajax({
                                        url: "wishListAdd.do",
                                        type: "post",
                                        data: {
                                            product_id: product_id
                                        },
                                        success: function (data) {
                                            if (data.redirect) {
                                                alert(data.message);
                                                window.location.href = data.redirect;
                                            } else {
                                                alert(data.message);
                                            }
                                        }
                                    });
                                });
                            });
                        </script>
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
                                  <span id="levelLineActive" style="width: 0%;"></span>
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
                              <a href="#" class="btnSubmit gFull sizeL" onclick="payInsert()">
                                <span id="actionBuy">구매하기</span>
                              </a>
                              <span class="gActionButtonColumn">
                                <button tpye="button" class="btnNormal sizeL actionCart"
                                  id="actionCart" onclick="cartInsert()">장바구니</button>
                                <script>
  // URL에서 매개변수를 추출하는 함수 정의
  function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, "\\$&");
    const regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
    const results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return "";
    return decodeURIComponent(results[2].replace(/\+/g, " "));
  }

  let isRequestInProgress = false; // 요청 진행 중인지 확인하는 플래그

  function cartInsert() {
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

    console.log(productArray);

    isRequestInProgress = true; // 요청 시작 시 플래그 설정
    document.getElementById("actionCart").disabled = true; // 버튼 비활성화

    // ajax 요청(Json 처리 안함)
    $.ajax({
      url: "/cartInsert.do",
      type: "post",
      data: JSON.stringify(productArray),
      contentType: "application/json",
      success: function (data) {
        alert("장바구니에 담겼습니다.");
        isRequestInProgress = false; // 요청 완료 시 플래그 해제
        document.getElementById("actionCart").disabled = false; // 버튼 활성화
      },
      error: function (xhr, status, error) {
        alert("장바구니 담기 실패");
        isRequestInProgress = false; // 요청 실패 시 플래그 해제
        document.getElementById("actionCart").disabled = false; // 버튼 활성화
      },
    });
  }
</script>
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
                                      <c:forEach var="product" items="${productRelateList}">
                                          <li class="prdList__item swiper-slide jsRelatedItem xans-record-" style="width: 202px; margin-right: 10px;">
                                              <div class="thumbnail">
                                                  <a href="#" class="thumb">
                                                      <img src="/images/productList/${product.img_id}" alt="상품 이미지">
                                                  </a>
                                              </div>
                                              <div class="description">
                                                  <a href="#">
                                                      <strong class="name">${product.product_name}</strong>
                                                  </a>
                                                  <div class="price">
                                                      <span class="salePrice displaynone">${product.price}원</span>
                                                      <span class="prdPrice ">${product.price}원</span>
                                                  </div>
                                                  <script>
                                                    // 가격을 0,000원 형식으로 변환
                                                    $(document).ready(function () {
                                                      $('.prdPrice').each(function () {
                                                        let price = parseInt($(this).text().replace(/[^0-9]/g, ''));
                                                        $(this).text(price.toLocaleString() + '원');
                                                      });
                                                    });
                                                  </script>
                                              </div>
                                          </li>
                                      </c:forEach>
                                  </ul>
                                  <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                              </div>
                          </div>
                          </div>
                          <div>
                            <%@ include file="product_viewDetail.jsp" %>
                          </div>
                          <div class="product_review">
                            <script>
                            // product_review.jsp ajax로 호출
                            $(document).ready(function () {
                              $.ajax({
                                url: "product_review.do",
                                type: "get",
                                data: {},
                                success: function (data) {
                                  $(".product_review").html(data); // 응답 데이터를 통째로 가져옴
                                },
                                error: function () {
                                  alert("리뷰 페이지를 불러오는 데 실패했습니다.");
                                }
                              });
                            });
                          </script>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  
                
            </main>
          </div>
          <!-- 푸터 -->
          <%@ include file="../footer.jsp" %>
      </div>
    </body>

    </html>