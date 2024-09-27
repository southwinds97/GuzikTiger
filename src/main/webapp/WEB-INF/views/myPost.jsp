<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>MUZIK TIGER  무직타이거</title>
  <link rel="icon" href="images/common/favicon.png">
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
  <div id="wrap">
    <!-- 헤더 -->
  	<%@ include file="header.jsp" %>
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
                  <th scoper="col">조회</th>
                </tr>
              </thead>
              <tbody class="center">
                <tr class="xans-record">
                  <td class="num">
                    <span class="RW">2</span>
                  </td>
                  <td class="title">
                    &nbsp;&nbsp;&nbsp;
                    <img src="/images/ico_re.gif" alt="답변" class="rwd-img">
                    <a href="#">문의 안드려요:(</a>
                    <span class="comment"></span>
                    <img src="/images/ico_new.gif" alt="NEW" class="rwd-img">
                  </td>
                  <td>
                    <a href="qnaList.do" class="txtEm">Q&A</a>
                  </td>
                  <td>MUZIKTIGER</td>
                  <td>2024-09-27</td>
                  <td>
                    <span class="RW">1</span>
                  </td>
                </tr>
                <tr class="xans-record"></tr>
                  <td class="num">
                    <span class="RW">1</span>
                  </td>
                  <td class="title">
                    <a href="#">문의드려요:)</a> 
                    <span class="comment"></span>
                    <img src="/images/ico_new.gif" alt="NEW" class="rwd-img">
                  </td>
                  <td>
                    <a href="qnaList.do" class="txtEm">Q&A</a>
                  </td>
                  <td>키*****</td>
                  <td>2024-09-27</td>
                  <td>
                    <span class="RW">3</span>
                  </td>
                </tr>
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
              <a href="wishlist.do">나의 위시리스트</a>
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
              <a href="#">회원정보 수정</a>
            </li>
            <li>
              <a href="#">회원탈퇴</a>
            </li>
        </div>
      </main>
    </div>
    <!-- 푸터 -->
    <%@ include file="footer.jsp" %>
  </div>
</body>
</html>