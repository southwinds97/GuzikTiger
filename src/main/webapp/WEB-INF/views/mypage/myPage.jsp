<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
      <link rel="stylesheet" href="css/swiper-bundle.min.css">
      <link rel="stylesheet" href="css/common.css?v=<%= System.currentTimeMillis() %>">
      <link rel="stylesheet" href="css/main.css?v=<%= System.currentTimeMillis() %>">
      <link rel="stylesheet" href="css/sub.css?v=<%= System.currentTimeMillis() %>">
      <link rel="stylesheet" href="css/myPage.css?v=<%= System.currentTimeMillis() %>">
      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/swiper-bundle.min.js"></script>
      <script src="js/ui-common.js?v=<%= System.currentTimeMillis() %>"></script>
    </head>

    <body>
      <div id="skip_navi">
        <a href="#container">Skip to content</a>
      </div>

      <%@ include file="../header.jsp" %>
        <div id="deleteMemberModal" class="modal">
          <div class="modal-content">
            <span class="close">&times;</span>
            <div id="modal-body-member"></div>
          </div>
        </div>

        <div id="wrap">
          <div id="container">
            <div class="location">
              <span>현재위치</span>
              <ol>
                <li><a href="/">홈</a></li>
                <li title="현재위치" class="on">마이 쇼핑</li>
              </ol>
            </div>
            <main id="contents">
              <div class="mypage_main">
                <ul class="mypage_top">
                  <li class="Savings">
                    <img src="/images/common/money.png" alt="적립금">
                    <h2>${MDTO.points}원</h2>
                    <p>총적립금</p>
                  </li>
                  <li class="order">
                    <a href="#">
                      <img src="/images/order.svg" alt="오더">
                      <div class="order">
                        <span class="price" id="total-price"></span><span class="ph">(</span><span
                          class="count">${totalRecord}회</span><span class="ph2">)</span>
                        <span class="title">총주문</span>
                      </div>
                    </a>
                  </li>
                </ul>
                <div class="titlearea">
                  <h3>나의 주문처리 현황</h3>&nbsp;
                  <span class="desc">(최근 <span class="txtEm">3개월</span> 기준)</span>
                </div>
                <div class="Orderstatus">
                  <ul>
                    <li>
                      <a href="#" alt="입금전">
                        <span class="od_count">0</span>
                        <span class="label">입금전</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" alt="배송준비중">
                        <span class="od_count">0</span>
                        <span class="label">배송준비중</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" alt="배송중">
                        <span class="od_count">0</span>
                        <span class="label">배송중</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" alt="배송완료">
                        <span class="od_count">0</span>
                        <span class="label">배송완료</span>
                      </a>
                    </li>
                  </ul>
                </div>
                <div class="titlearea2">
                  <h3>주문내역 조회</h3>
                </div>
                <div class="order_listwrap">
                  <h3 class="blind">주문내역</h3>
                  <c:forEach var="order" items="${orderList}">
                    <div class="odder_list">
                      <div class="odder_date">
                        <span class="date" title="주문일시">
                          <fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </span>
                        <!-- 날짜형식 변환 -->
                        <span class="number" title="주문번호">
                          <a href="#" alt="주문번호">(${order.order_id})</a>
                        </span>
                      </div>
                      <div class="odder_info">
                        <div class="odder_img">
                          <a href="#">
                            <img src="/images/productList/${order.img_id}" alt="상품명">
                          </a>
                        </div>
                        <div class="odder_detail">
                          <a href="#">
                            <strong class="odder_name">${order.product_name} 외 1종</strong>
                          </a>
                          <span class="odder_price">
                            <strong class="txtEm">
                              ${order.order_amount}
                            </strong>원
                            <!-- <span class="odder_count">(${order.quantity}개)</span> -->
                          </span>
                        </div>
                      </div>
                    </div>
                    <div class="odder_cancel">
                      <div class="cancel_left">
                        <span class="cancel">취소신청</span>
                        <span class="store">
                          <a href="#" class="btnText">상세정보</a>
                        </span>
                      </div>
                    </div>
                    <div class="odder_right">
                      <a href="#none" class="btnnormal" id="cancelButton" onclick="alert('취소를 철회하시겠습니까?')">취소철회</a>
                      <span class="displaynone">
                        <a href="#none" class="btnnormal" id="statusButton" onclick="alert(배송조회)">배송조회</a>
                        <a href="#none" class="btnnormal" id="exchangeButton" onclick="alert('교환을 철회하시겠습니까?')">교환철회</a>
                        <a href="#none" class="btnnormal" id="returnButton" onclick="alert('반품을 철회하시겠습니까?')">반품철회</a>
                      </span>
                    </div>
                    <a href="order_detailView.do?order_id=${order.order_id}" class="btnDetail">상세보기
                      <i aria-hidden="true" class="rArrow"></i>
                    </a>
                  </c:forEach>
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
                    <a href="recentView.do">최근 본 상품</a>
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
        </div>

        <%@ include file="../footer.jsp" %>

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



              // 9,999원 형식으로 변환
              $('.odder_price strong').each(function () {
                let price = parseInt($(this).text().replace(/,/g, ''));
                $(this).text(price.toLocaleString());
              });

              $('.Savings h2').each(function () {
                let point = parseInt($(this).text().replace(/,/g, ''));
                $(this).text(point.toLocaleString());
              });

              // 총 가격 계산 함수
              function calculateTotalPrice() {
                let totalPrice = 0;
                // $order_amount 값을 가져와서 총 가격 계산
                $('.odder_price strong').each(function () {
                  let price = parseInt($(this).text().replace(/,/g, ''));
                  totalPrice += price;
                });
                $('#total-price').text(totalPrice.toLocaleString() + '원');
              }

              // 페이지 로드 시 총 가격 계산
              calculateTotalPrice();

              // 배송 상태별 카운트 증가
              let countReady = parseInt($('.od_count').eq(1).text());
              let countShipping = parseInt($('.od_count').eq(2).text());
              let countDelivered = parseInt($('.od_count').eq(3).text());

              <c:forEach var="order" items="${orderList}">
                <c:choose>
                  <c:when test="${order.deliv_prog == '배송준비중'}">
                    countReady++;
                  </c:when>
                  <c:when test="${order.deliv_prog == '배송중'}">
                    countShipping++;
                  </c:when>
                  <c:when test="${order.deliv_prog == '배송완료'}">
                    countDelivered++;
                  </c:when>
                </c:choose>
              </c:forEach>

              $('.od_count').eq(1).text(countReady);
              $('.od_count').eq(2).text(countShipping);
              $('.od_count').eq(3).text(countDelivered);
            });
          </script>
    </body>

    </html>