<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
              <a href="/">HOME</a>
              <a href="productList.do?category=mainCate">SHOP</a>
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
              <c:if test="${param.category != 'mainCate'}">
                <h2>${param.category}</h2>
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
                <strong class="count">${productCount}</strong>&nbsp;itmes
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
                var codeValue = '${code}'; // JSP에서 code 값을 JavaScript 변수로 설정

                $.ajax({
                  url: 'productListContent.do',
                  type: 'GET',
                  data: {
                    typeMenu: typeMenuValue,
                    listArray: listArrayValue,
                    code: codeValue // AJAX 요청에 code 값을 포함
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