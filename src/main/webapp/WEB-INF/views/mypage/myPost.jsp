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
    <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/swiper-bundle.min.css">
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/mypost.css?v=<echo time(); ?>">
    <!-- <link rel="stylesheet" href="css/recentView.css?v=<?php echo time(); ?>">  -->

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/swiper-bundle.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
  </head>

  <body>
    <div id="skip_navi">
      <a href="#container"></a>
    </div>
    <!-- 헤더 -->
    <%@ include file="../header.jsp" %>
      <div id="wrap">
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
            <span>현재위치</span>
            <ol>
              <li><a href="/">홈</a></li>
              <li><a href="myPage.do">마이쇼핑</a></li>
              <li title="현재위치" class="on">게시물 관리</li>
            </ol>
          </div>
          <main id="contents">
            <div class="mypage_main">
              <div class="top_titlearea">
                <h2>게시물 관리</h2>
              </div>
              <div class="mypostboard">
                <div class="boardhead">
                  <div>
                    <select class="board_sort">
                      <option value="1">작성일자별</option>
                      <option value="2" selected="selected">분류별</option>
                    </select>
                  </div>
                </div>
                <div class="board_list">
                  <table border="1">
                    <caption>게시물 관리 목록</caption>
                    <colgroup class="listhead">
                      <col style="width: 70px;">
                      <col style="width: auto;">
                      <col style="width: 135px;">
                      <col style="width: 84px;">
                      <col style="width: 100px;">
                      <col style="width: 55px;">
                    </colgroup>
                    <thead>
                      <tr>
                        <th scoper="col">번호</th>
                        <th scoper="col">제목</th>
                        <th scoper="col">분류</th>
                        <th scoper="col">작성자</th>
                        <th scoper="col">작성일</th>
                      </tr>
                    </thead>
                    <tbody class="center">
						<c:choose>
							<c:when test="${empty nameQnaList}">
								<tr>
									<td colspan="5" aling="center">
										작성한 게시물이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${nameQnaList}" var="row" varStatus="loop">
									<tr class="listItem xans-record" data-name="${row.name}">
										<td class="num">
				                          <span class="RW">${row.idx}</span>
				                        </td>
				                        <td class="title">
				                          <a href="qnaView.do?idx=${row.idx}">${row.title}</a>
				                        </td>
				                        <td>
				                          <a href="qnaList.do" class="txtEm">Q&A</a>
				                        </td>
				                        <td>${row.name}</td>
				                        <td>${row.postdate}</td>
					                  </tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--페이지 -->
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
              <!-- 왼쪽메뉴 -->
              <div class="myinfo_Main">
                <h2>My Account</h2>
                <div class="subTitle">
                  <h3>쇼핑 정보</h3>
                </div>
                <ul class="menu">
                  <li>
                    <a href="myPage.do">주문내역 조회</a>
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
                    <a href="deleteMember.do">회원탈퇴</a>
                  </li>
              </div>
          </main>


        </div>
      </div>
      <!-- 푸터 -->
      <%@ include file="../footer.jsp" %>
  </body>

  </html>