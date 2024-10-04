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
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
  </head>
  <script>
  function deletePost(idx) {
  	var confirmed = confirm("정말로 삭제하시겠습니까?");
  	if(confirmed) {
  		var form = document.writeFrm;
  		form.method = "post";
  		form.action = "delete.do";
  		form.submit();
  	}
  }
  
  window.onload = function() {
         var userName = '<%= session.getAttribute("name") != null ? session.getAttribute("name") : "" %>';
         var postAuthorName = '${qnaDTO.name}'; // 작성자의 아이디를 가져옵니다.

         if (userName && userName === postAuthorName) {
             document.getElementById('viewBtnWrap').style.display = 'block'; // div 보이기
         }
		document.getElementById('userIdInput').value = userName;
     };

  </script>
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
				<form name="writeFrm">
					<input type="hidden" name="idx" value="${qnaDTO.idx}">
				</form>
	            <div class="tit_wrap">
	              <h3>${qnaDTO.title}</h3>
	              <p>${qnaDTO.name} <span>${qnaDTO.postdate}</span></p>
	            </div>
	            <div class="content_wrap">
	              ${qnaDTO.content}
	            </div>
	            <div class="btn_wrap">
	              <div id="viewBtnWrap" class="view_btn_wrap" style="display:none;">
	              <button type="button" onclick="deletePost(${param.idx});">삭제</button>
	              <button type="button" onclick="location.href='qnaEdit.do?idx=${param.idx}';">수정</button>
	              </div>
	              <button type="button" onclick="location.href='qnaList.do';" style="margin:0 0 0 auto">목록</button>
	            </div>
	          </div>
	          <div class="comment_wrap">
	            <h3>댓글달기</h3>
				<form name="commentFrm" method="post" action="comWrite.do" onsubmit="return checkFrm(this);">
					<input type="hidden" value="${qnaDTO.idx}" name="board_idx">
		            <div class="comment_box">
		              <textarea name="comments"></textarea>
		              <div class="comment_user">
		                <div class="com_user_info">
		                  <div class="name_wrap info_wrap">
		                    <p>이름</p>
		                    <input type="text" id="userIdInput" value="" name="name">
		                  </div>
		                  <div class="pass_wrap info_wrap">
		                    <p>비밀번호</p>
		                    <input type="password" name="password">
		                  </div>
		                </div>
		                <div class="pass_com">
		                  <input type="checkbox" name="secretYN" id="checkbox">
		                  <label for="checkbox">비밀댓글</label>
		                  (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
		                  <button class="com_btn" type="submit">등록</button>
		                </div>
		              </div>
		            </div>
				</form>
	            <div class="com_list">
					<c:forEach items="${commentLists}" var="row" varStatus="loop">
					          <div style="width:890px; display:flex; gap:10px; border:1px solid black; margin-bottom:20px;">
					            <div style="width:15%; text-align:center; padding:10px">${row.name}</div>
					            <div style="width:75%; padding:10px;">${row.comments}</div>
					            <c:if test="${ UserId eq row.id }">
					              <button type="button" id="commentEdit${row.idx}" style="width:5%; background:black; color:white;">수정</button>
					              <button
					                type="button" 
					                onclick="CommentDelete('${row.idx}', '${board_idx}')"
					              	style="width:5%; margin-right:-1px; background:black; color:white;"
					              >
					                삭제
					              </button>
					            </c:if>
					          </div>
					            <div id="comment_edit_form${row.idx}" style="margin-bottom:20px;">
					              <script
					                src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
					              ></script>
					              <script>
					                $("#commentEdit${row.idx}").click(function () {
					                  var idx = ${row.idx}; // Add this line
					                  $.ajax({
					                    url: "./commentEdit.do",
					                    type: "GET",
					                    data: {
					                      idx: "${row.idx}",
					                      board_idx: "${param.board_idx}",
					                      id: "${row.id}",
					                      name: "${row.name}",
					                      comments: "${row.comments}",
					                    },
					                    success: function (response) {
					                      $("#comment_edit_form" + idx).html(response);
					                    },
					                  });
					                });
					              </script>
					            </div>
					        </c:forEach>
						<c:forEach items="${comlists}" var="row" varStatus="loop">
							<div class="comment">
				                <span class="com_user">${row.name} </span><span>${row.postdate}</span>
				                <div class="com_content">
				                  <p>${row.comments}</p>
				                </div>
				                <div class="com_edit">
				                  <button>수정</button>
				                  <button>삭제</button>
				                </div>
				              </div>
						</c:forEach>
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