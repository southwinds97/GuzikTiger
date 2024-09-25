<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/productList.css?v=<?php echo time(); ?>">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
  </head>

  <body>
    <div id="skip_navi">
      <a href="#container">본문바로가기</a>
    </div>
    <div id="wrap">
      <!-- 헤더 -->
      <%@ include file="header.jsp" %>
        <main id="container">
          <div class="location">
            <a href="index.html">HOME</a>
            <a href="list.html">SHOP</a>
            <!-- codelist테이블의 CateGORY가 mainCate의 CD_Name -->
            <a href="#">키링</a>
            <!-- codelist테이블의 CateGORY가 subCate의 CD_Name -->
            <a href="#">인형 키링</a>
          </div>
          <div class="list_d">
            <h2>SHOP</h2>
          </div>
          <ul class="type_menu">
            <li><a href="#">토이/인형</a></li>
            <li><a href="#">키링</a></li>
            <li><a href="#">노트북/태블릿 파우치</a></li>
            <li><a href="#">패브릭/생활</a></li>
            <li><a href="#">키친</a></li>
            <li><a href="#">패션잡화</a></li>
            <li><a href="#">여행/캠핑</a></li>
            <li><a href="#">문구류</a></li>
            <li><a href="#">스티커/마스킹테이프</a></li>
            <li><a href="#">엽서/카드/포스터</a></li>
            <li><a href="#">폰케이스/모양톡/스트랩</a></li>
            <li><a href="#">에어팟/버즈 케이스</a></li>
            <li><a href="#">선물세트 추천</a></li>
          </ul>
          <div class="list_package">
            <div class="list_count">
              <strong class="count">593</strong>&nbsp;itmes
            </div>
            <div class="function" id="function">
              <select id="list_array">
                <option value="1">신상품</option>
                <option value="2">상품명</option>
                <option value="3">낮은가격</option>
                <option value="4">높은가격</option>
                <option value="4">인기상품</option>
              </select>
            </div>
          </div>
          <!-- ajax로 productListConent.jsp 내용 가져오기 typemenu나 list_array를 누를 때마다 파라미터 전달로 내용 변환이 필요 -->
          <div id="productListContent"></div>

          <script>
            $(document).ready(function () {
              // 초기 페이지 로딩 시 productListContent를 가져오기 위한 ajax 호출
              loadProductListContent();

              // type_menu나 list_array를 변경할 때마다 productListContent를 업데이트하기 위한 이벤트 핸들러 등록
              $('.type_menu, #list_array').change(function () {
                loadProductListContent();
              });
            });

            function loadProductListContent() {
              var typeMenuValue = $('.type_menu').val();
              var listArrayValue = $('#list_array').val();

              $.ajax({
                url: 'productListContent.jsp',
                type: 'GET',
                data: {
                  typeMenu: typeMenuValue,
                  listArray: listArrayValue
                },
                success: function (response) {
                  $('#productListContent').html(response);
                },
                error: function (xhr, status, error) {
                  console.log(error);
                }
              });
            }
          </script>

        </main>
        <!-- 푸터 -->
        <%@ include file="footer.jsp" %>
    </div>
  </body>

  </html>