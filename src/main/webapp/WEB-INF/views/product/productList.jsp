<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
      <link rel="stylesheet" href="css/jquery-ui.min.css">
      <link rel="stylesheet" href="css/swiper-bundle.min.css" />
      <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/productList.css?v=<?php echo time(); ?>">
      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/swiper-bundle.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>

    </head>

    <body>
      <div id="skip_navi">
        <a href="#container">본문바로가기</a>
      </div>
      <div id="wrap">
        <!-- 헤더 -->
        <%@ include file="../header.jsp" %>
          <main id="container">
            <div class="location">
              <a href="/">HOME</a>
              <c:if test="${param.category != 'Go'}">
                <a href="productList.do?category=mainCate">SHOP</a>
              </c:if>
              <c:if test="${param.category == 'Go'}">
                <a href="productList.do?category=Go">오늘출발🚛</a>
              </c:if>
              <!-- codelist테이블의 CateGORY가 mainCate의 CD_Name -->
              <c:if test="${param.category != 'mainCate'}">
                <c:forEach var="category" items="${subCategories}">
                  <a href="productList.do?category=${category.cd_name}">${category.cd_name}</a>
                </c:forEach>
              </c:if>
            </div>
            <div class="list_d">
              <!-- category=mainCate라는 파라미터를 받았을 때 -->
              <c:if test="${param.category == 'mainCate'}">
                <h2>SHOP</h2>
              </c:if>
              <!-- 그 외엔 다른 타입 메뉴이름으로 -->
              <c:if test="${param.category != 'mainCate' && param.category != 'Go'}">
                <h2>${param.category}</h2>
              </c:if>
              <c:if test="${param.category == 'Go'}">
                <img src="./images/오늘출발.png" alt="오늘출발" style="border: none; display: block; margin: 0 auto;">
              </c:if>
            </div>
            <ul class="type_menu">
              <c:if test="${param.category == 'mainCate'}">
                <c:forEach var="category" items="${categories}">
                  <li>
                    <a href="productList.do?category=${category.cd_name}">${category.cd_name}</a>
                  </li>
                </c:forEach>
              </c:if>
              <c:if test="${param.category != 'mainCate'}">
                <c:forEach var="upCodeCategory" items="${upCodeCategories}">
                  <li>
                    <a href="productList.do?category=${upCodeCategory.cd_name}">${upCodeCategory.cd_name}</a>
                  </li>
                </c:forEach>
              </c:if>
            </ul>
            <div class="list_package">
              <div class="list_count">
                <!-- 카테고리 파라미터가 BEST와 NEW가 아닐 때 -->
                <c:if test="${param.category != 'BEST' && param.category != 'NEW'}">
                  <strong class="count">${productCount}</strong>&nbsp;itmes
                </c:if>
                <!-- BEST 거나 NEW 일 때 -->
                <c:if test="${param.category == 'BEST' || param.category == 'NEW'}">
                  <strong class="count">30</strong>&nbsp;itmes
                </c:if>

              </div>
              <c:if test="${param.category != 'BEST' && param.category != 'NEW'}">
                <div class="function" id="function">
                  <select id="list_array" name="list_array">
                    <option value="1">신상품</option>
                    <option value="2">상품명</option>
                    <option value="3">낮은가격</option>
                    <option value="4">높은가격</option>
                    <option value="5">인기상품</option>
                  </select>
                </div>
              </c:if>
            </div>

            <!-- ajax로 productListConent.jsp 내용 가져오기 typemenu나 list_array를 누를 때마다 파라미터 전달로 내용 변환이 필요 -->
            <div id="productListContent"></div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script>
              var offset = 0;
              var limit = 20;
              var totalCount = 0;

              $(document).ready(function () {
                // 초기 페이지 로딩 시 productListContent를 가져오기 위한 ajax 호출
                loadProductListContent();

                // type_menu나 list_array를 변경할 때마다 productListContent를 업데이트하기 위한 이벤트 핸들러 등록
                $('.type_menu a').click(function () {
                  offset = 0;
                  loadProductListContent();
                });

                $('#list_array').change(function () {
                  $('#productListContent').empty();
                  offset = 0;
                  loadProductListContent();
                });

                // more 버튼 클릭 시 추가 제품 로드
                $('.btn_more').click(function () {
                  loadProductListContent();
                });
              });

              function loadProductListContent() {
                var typeMenuValue = $('.type_menu a.active').data('value');
                var listArrayValue = $('#list_array').val();
                var codeValue = '${code}'; // JSP에서 code 값을 JavaScript 변수로 설정
                var categoryValue = '${param.category}'; // JSP에서 category 값을 JavaScript 변수로 설정

                $.ajax({
                  url: '${pageContext.request.contextPath}/productListContent.do',
                  type: 'GET',
                  data: {
                    typeMenu: typeMenuValue,
                    list_array: listArrayValue, // AJAX 요청에 list_array 값을 포함
                    code: codeValue, // AJAX 요청에 code 값을 포함
                    category: categoryValue, // AJAX 요청에 category 값을 포함
                    offset: offset,
                    limit: limit
                  },
                  success: function (response) {
                    $('#productListContent').append(response);

                    // 서버에서 totalCount 값을 가져와서 설정
                    totalCount = parseInt($('#totalCount').val());
                    console.log(offset, totalCount);
                    offset += limit;

                    if (offset >= totalCount) {
                      $('.btn_more').hide();
                    } else {
                      $('.btn_more').show();
                    }
                  },
                  error: function (xhr, status, error) {
                    $('.btn_more').hide(); // 에러 발생 시 버튼 숨기기
                    console.log(error);
                  }
                });
              }
            </script>

            <div class="btr_wrap">
              <button type="button" class="btn_more">more&nbsp;&nbsp;&nbsp;+</button>
            </div>
          </main>
          <!-- 푸터 -->
          <%@ include file="../footer.jsp" %>
      </div>
    </body>

    </html>