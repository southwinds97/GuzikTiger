<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>">
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
	  <main id="container" class="qna_page sub_container">
	        <div class="inner">
	          <div class="path">
	            <a href="index.html">Home</a> / <span>Q&A</span>
	          </div>
	          <h2>Q&A</h2>
	          <div class="qna_cate">
	            <form>
	              <fieldset>
	                <legend>게시물 분류</legend>
	                <div class="qna_category">
	                  <div class="select_wrap">
	                    <select>
	                      <option>전체</option>
	                      <option>상품문의</option>
	                      <option>주문/결제</option>
	                      <option>배송문의</option>
	                      <option>교환/반품</option>
	                      <option>기타문의</option>
	                    </select>
	                  </div>
	                  <div class="select_wrap">
	                    <select>
	                      <option>전체글보기</option>
	                      <option>답변전 글보기</option>
	                      <option>답변완료 글보기</option>
	                    </select>
	                  </div>
	                </div>
	                
	              </fieldset>
	            </form>
	          </div>
	          <div class="qna_list">
	            <table>
	              <caption>qna 테이블: 번호, 상품정보. 제목, 카테고리, 작성자, 등록일</caption>
	                <thead>
	                  <tr>
	                    <th class="col1">번호</th>
	                    <th class="col2">상품정보</th>
	                    <th class="col3">제목</th>
	                    <th class="col4">카테고리</th>
	                    <th class="col5">작성자</th>
	                    <th class="col6">작성일</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <tr>
	                    <td>9999</td>
	                    <td class="td_img"><a href="#"><img src="images/BEST1.jpg" alt="상품정보1"></a></td>
	                    <td class="td_tit">
	                      무직타이거 뚱랑이 야구공 키링<br>
	                      <a href="qnaview.html">문의드려요 :)</a></td>
	                    <td>상품문의</td>
	                    <td>신제헌</td>
	                    <td>2024-09-24</td>
	                  </tr>
	                </tbody>
	            </table>
	            <div class="qna_search_wrap">
	              <form>
	                <fieldset>
	                  <legend>게시물 검색</legend>
	                  <div class="qna_search">
	                    <div class="select_wrap">
	                      <select>
	                        <option>일주일</option>
	                        <option>한달</option>
	                        <option>세달</option>
	                        <option>전체</option>
	                      </select>
	                    </div>
	                    <div class="select_wrap select2">
	                      <select>
	                        <option>제목</option>
	                        <option>내용</option>
	                        <option>글쓴이</option>
	                        <option>아이디</option>
	                        <option>별명</option>
	                        <option>상품정보</option>
	                      </select>
	                    </div>
	                    <div class="search_btn_wrap">
	                      <input class="search" type="text">
	                      <button class="search_btn">찾기</button>
	                    </div>
	                  </div>
	                </fieldset>
	              </form>
	           </div>
	           <a class="qna_write_btn" href="qnawrite.html">글쓰기</a>
	            <div class="board_pagination">
	              <a class="page_btn prev" href="#"><span class="blind">이전 페이지</span></a>
	              <span class="num active">1</span>
	              <a class="num" href="#">2</a>
	              <a class="num" href="#">3</a>
	              <a class="num" href="#">4</a>
	              <a class="num" href="#">5</a>
	              <a class="page_btn next" href="#"><span class="blind">다음 페이지</span></a>
	            </div>
	          </div>
	        </div>
	      </main>
        <!-- 푸터 -->
        <%@ include file="footer.jsp" %>
    </div>
  </body>

  </html>