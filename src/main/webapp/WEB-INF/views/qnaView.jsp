<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
			  <c:choose>
				<c:when test="${not empty qnaDTO.product}">
		          <div class="product_sel">
		            <img src="images/noimg.gif" onerror="this.src='url';">
		            <div class="product_info">
		              <div class="txt_wrap">
		                <a href="#">${qnaDTO.product}</a>
		                <span>7,000원</span>
		              </div>
		            </div>
		          </div>
				</c:when>
			</c:choose>
	          <div class="qna_view_wrap">
	            <div class="tit_wrap">
	              <h3>${qnaDTO.title}</h3>
	              <p>${qnaDTO.name} <span>${qnaDTO.postdate}</span></p>
	            </div>
	            <div class="content_wrap">
	              ${qnaDTO.content}
	            </div>
	            <div class="btn_wrap">
	              <div class="view_btn_wrap">
	              <a href="qnaList.do">삭제</a>
	              <a href="qnaEdit.do?idx=${qnaDTO.idx}">수정</a>
	              </div>
	              <a href="qnaList.do">목록</a>
	            </div>
	          </div>
	          <div class="comment_wrap">
	            <h3>댓글달기</h3>
	            <div class="comment_box">
	              <textarea></textarea>
	              <div class="comment_user">
	                <div class="com_user_info">
	                  <div class="name_wrap info_wrap">
	                    <p>이름</p>
	                    <input type="text">
	                  </div>
	                  <div class="pass_wrap info_wrap">
	                    <p>비밀번호</p>
	                    <input type="password">
	                  </div>
	                </div>
	                <div class="pass_com">
	                  <input type="checkbox">
	                  <label for="checkbox">비밀댓글</label>
	                  (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
	                  <button class="com_btn">등록</button>
	                </div>
	              </div>
	            </div>
	            <div class="com_list">
	              <div class="comment">
	                <span class="com_user">신제헌</span><span>2024-09-25 11:02:33</span>
	                <div class="com_content">
	                  <p>메롱</p>
	                </div>
	                <div class="com_edit">
	                  <button>수정</button>
	                  <button>삭제</button>
	                </div>
	              </div>
	              <div class="comment">
	                <span class="com_user">신제헌</span><span>2024-09-25 11:01:20</span>
	                <div class="com_content">
	                  <p>바보</p>
	                </div>
	                <div class="com_edit">
	                  <button>수정</button>
	                  <button>삭제</button>
	                </div>
	              </div>
	              <div class="comment">
	                <span class="com_user">신제헌</span><span>2024-09-25 11:01:20</span>
	                <div class="com_content">
	                  <img src="/images/lock.gif" alt="비밀글"><p>비밀댓글 입니다.</p>
	                </div>
	                <div class="secret_com">
	                  <input type="password">
	                  <button>확인</button>
	                  <button>취소</button>
	                </div>
	                <div class="com_edit">
	                  <button>수정</button>
	                  <button>삭제</button>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="pagination_view">
	            <div class="prev_btn">
	              <span>이전</span>
	              <a href="#">문의드려요 :)</a>
	            </div>
	            <div class="next_btn">
	              <span>다음</span>
	              <a href="#">문의드려요 :)</a>
	            </div>
	          </div>
	          <div class="etc_view">
	            <h3>관련 글 보기</h3>
	            <div class="qna_list">
	              <table>
	                <caption>관련 글 테이블: 번호, 상품명. 제목, 작성자, 등록일</caption>
	                  <thead>
	                    <tr>
	                      <th class="col1">번호</th>
	                      <th class="col2">상품명</th>
	                      <th class="col3">제목</th>
	                      <th class="col4">작성자</th>
	                      <th class="col5">작성일</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	                    <tr>
	                      <td>9999</td>
	                      <td>무직타이거 납작 인형 키링 4종</td>
	                      <td class="td_tit">
	                        <a href="qnaview.html">문의드려요 :)</a></td>
	                      <td>신제헌</td>
	                      <td>2024-09-24 20:17:44</td>
	                    </tr>
	                  </tbody>
	              </table>
	            </div>
	          </div>
	        </div>
	      </main>
        <!-- 푸터 -->
        <%@ include file="footer.jsp" %>
    </div>
  </body>

  </html>