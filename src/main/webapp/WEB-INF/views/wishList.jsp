<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta name="format-detection" content="telephone=no">
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
      <link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/wishlist.css?v=<?php echo time(); ?>">
      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/swiper-bundle.min.js"></script>
      <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
    </head>

    <body>
      <div id="skip_navi">
        <a href="#container">Skip to content</a>
      </div>
      <div id="wrap">
        <%@ include file="header.jsp" %>
          <div id="deleteMemberModal" class="modal">
            <div class="modal-content">
              <span class="close">&times;</span>
              <div id="modal-body-member"></div>
            </div>
          </div>

          <script>
            $(document).ready(function () {
              var modal = $('#deleteMemberModal');
              var modalContent = $('#modal-body-member');

              $('#deleteMember').click(function (event) {
                event.preventDefault();
                $.ajax({
                  url: '/deleteMember.do',
                  type: 'GET',
                  success: function (data) {
                    console.log("AJAX 요청 성공:", data); // 디버깅용 콘솔 로그
                    modalContent.html(data);
                    modal.show();
                  },
                  error: function (xhr, status, error) {
                    console.error("AJAX 요청 실패:", status, error); // 디버깅용 콘솔 로그
                    alert('회원탈퇴 페이지를 불러오는 데 실패했습니다.');
                  }
                });
              });

              $('.close').click(function () {
                modal.hide();
              });

              $(window).click(function (event) {
                if ($(event.target).is(modal)) {
                  modal.hide();
                }
              });
            });
          </script>
          <div id="container">
            <div class="location">
              <a href="index.html">Home</a>
              <a href="mypage.html">마이 쇼핑</a>
              <a>나의 위시리스트</a>
            </div>
            <main id="contents">
              <div class="mypage_main">
                <h2>나의 위시리스트</h2>
                <div class="mylist">
                  <c:forEach var="item" items="${wishListData}">
                    <ul class="mypage_top">
                      <li>
                        <input type="checkbox" class="wish_idx" />
                      </li>
                      <li class="thumbnail">
                        <a href="">
                          <img src="./images/productList/${item.IMGID}" class="tiger">
                        </a>
                      </li>
                      <div class="description">
                        <a href="" class="proname">${item.PRODUCTNAME}</a>
                        <ul class="price">
                          <li>${item.PRICE}원</li>
                        </ul>
                        <a href="#none" class="btndelete">삭제</a>
                      </div>
                      <div class="btngroup">
                        <div class="btn_right">
                          <button type="button" onclick="" class="btnnormal">장바구니</button>
                          <button type="button" onclick="" class="btnorder">주문하기</button>
                        </div>
                      </div>
                    </ul>
                  </c:forEach>
                </div>
                <div class="btngroup2">
                  <div class="base_btn">
                    <button type="button" onclick="" class="btnall">전체삭제</button>
                    <button type="button" onclick="" class="btnchoose">선택삭제</button>
                  </div>
                </div>
                <div class="btngroup3">
                  <div class="bottom_btn">
                    <button type="button" onclick="" class="btnallorder">전체상품주문</button>
                  </div>
                </div>
              </div>
              <div class="paginate">
                <a href="#" class="first">첫 페이지</a>
                <a href="#">이전페이지</a>
                <ol>
                  <li class="xans-record">
                    <a href="#" class="this">1</a>
                  </li>
                </ol>
                <a href="#">다음페이지</a>
                <a href="#" class="last">마지막페이지</a>
              </div>
              <div class="myinfo_Main">
                <h2>My Account</h2>
                <div class="subTitle">
                  <h3>쇼핑 정보</h3>
                </div>
                <ul class="menu">
                  <li>
                    <a href="#">주문내역 조회</a>
                  </li>
                </ul>
                <div class="subTitle">
                  <h3>활동 정보</h3>
                </div>
                <ul class="menu">
                  <li>
                    <a href="pay.do">최근 본 상품</a>
                  </li>
                  <li>
                    <a href="wishList.do">나의 위시리스트</a>
                  </li>
                  <li>
                    <a href="myPost.do">나의 게시글</a>
                  </li>
                </ul>
                <div class="subTitle">
                  <h3>나의 정보</h3>
                </div>
                <ul class="menu">
                  <li>
                    <a href="registEdit.do">회원정보 수정</a>
                  </li>
                  <li>
                    <a href="#" id="deleteMember">회원탈퇴</a>
                  </li>
                </ul>
              </div>
            </main>
          </div>
          <%@ include file="footer.jsp" %>
      </div>
    </body>

    </html>