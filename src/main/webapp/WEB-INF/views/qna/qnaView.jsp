<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Q&A View</title>
      <link rel="stylesheet" href="css/jquery-ui.min.css">
      <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
      <link rel="stylesheet" href="css/common.css?v=<%= System.currentTimeMillis() %>">
      <link rel="stylesheet" href="css/main.css?v=<%= System.currentTimeMillis() %>">
      <link rel="stylesheet" href="css/sub.css?v=<%= System.currentTimeMillis() %>">
      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
      <script src="js/ui-common.js?v=<%= System.currentTimeMillis() %>"></script>
    </head>
    <script>
      function checkFrm(frm) {
        if (frm.password.value == '') {
          alert('비밀번호를 입력해주세요.');
          frm.password.focus();
          return false;
        }
      }
    </script>

    <body>
      <div id="wrap">
        <!-- 헤더 -->
        <%@ include file="../header.jsp" %>
          <main id="container" class="qna_page sub_container">
            <div class="inner">
              <div class="path">
                <a href="index.html">Home</a> / <span>Q&A</span>
              </div>
              <h2>Q&A</h2>
              <c:choose>
                <c:when test="${not empty qnaDTO.product}">
                  <div class="product_sel">
                    <img src="./images/productList/${qnaDTO.product_img}" onerror="this.src='url';">
                    <div class="product_info">
                      <div class="txt_wrap">
                        <a href="#">${qnaDTO.product}</a>
                        <span>${qnaDTO.product_price}원</span>
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
                <div class="down_wrap">
                  <img src='./uploads/${qnaDTO.sfile}' style="width:400px;">
                  <a href="/downloadFile?sfile=${qnaDTO.sfile}&ofile=${qnaDTO.ofile}">${qnaDTO.ofile}</a>
                </div>
                <div class="content_wrap">
                  ${qnaDTO.content}
                </div>
                <div class="btn_wrap">
                  <div id="viewBtnWrap" class="view_btn_wrap" style="display:none;">
                    <button type="button" onclick="deletePost('${qnaDTO.idx}');">삭제</button>
                    <button type="button" onclick="location.href='qnaEdit.do?idx=${qnaDTO.idx}'; ">수정</button>
                  </div>
                  <button type="button" id="reviewBtn" style="display:none;"
                    onclick="location.href='qnaEdit.do?idx=${qnaDTO.idx}'; ">답변</button>
                  <button type="button" onclick="location.href='qnaList.do';" style="margin:0 0 0 auto">목록</button>
                </div>
              </div>
              <div class="comment_wrap">
                <h3>댓글달기</h3>
                <form name="commentFrm" method="post" action="comWrite.do" onsubmit="return checkFrm(this);">
                  <input type="hidden" value="${qnaDTO.idx}" name="board_idx">
                  <input type="hidden" value="${id}" name="member_id">
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
                <div id="commentList" class="com_list"></div>
              </div>
              <div class="pagination_view">
                <div class="prev_btn">
                  <span>이전</span>
                  <c:if test="${not empty prevQna}">
                    <a href="qnaView.do?idx=${prevQna.idx}">${prevQna.title}</a>
                  </c:if>
                  <c:if test="${empty prevQna}">
                    <a href="#">이전 글이 없습니다</a>
                  </c:if>
                </div>
                <div class="next_btn">
                  <span>다음</span>
                  <c:if test="${not empty nextQna}">
                    <a href="qnaView.do?idx=${nextQna.idx}">${nextQna.title}</a>
                  </c:if>
                  <c:if test="${empty nextQna}">
                    <a href="#">다음 글이 없습니다</a>
                  </c:if>
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
                      <c:choose>
                        <c:when test="${empty relatedQnaList}">
                          <tr>
                            <td colspan="5" align="center">관련 글이 없습니다.</td>
                          </tr>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${relatedQnaList}" var="row">
                            <tr>
                              <td>${row.idx}</td>
                              <td>${row.product}</td>
                              <td class="td_tit">
                                <a href="qnaView.do?idx=${row.idx}">${row.title}</a>
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
            </div>
          </main>
          <!-- 푸터 -->
          <%@ include file="../footer.jsp" %>
      </div>
      <script>
        function deletePost(idx) {
          var confirmed = confirm("정말로 삭제하시겠습니까?");
          if (confirmed) {
            var form = document.writeFrm;
            form.method = "post";
            form.action = "delete.do";
            form.submit();
          }
        }

        function loadComments(idx) {
          $.ajax({
            url: "comList.do",
            type: "GET",
            data: {
              idx: idx // idx 값을 전달
            },
            success: function (data) {
              $("#commentList").html(data);
            },
            error: function (xhr, status, error) {
              console.error("댓글 목록을 불러오는 중 오류 발생:", error);
            }
          });
        }

        $(document).ready(function () {
          var idx = '${qnaDTO.idx}'; // JSP 표현식을 사용하여 idx 값을 가져옴
          loadComments(idx);

          var userName = '<%= session.getAttribute("name") != null ? session.getAttribute("name") : "" %>';
          var postAuthorName = '${qnaDTO.name}'; // 작성자의 아이디를 가져옵니다.

          if (userName && userName === postAuthorName) {
            document.getElementById('viewBtnWrap').style.display = 'block'; // div 보이기
          }
          document.getElementById('userIdInput').value = userName;

          if (userName == "관리자") {
            document.getElementById('reviewBtn').style.display = 'block';
          }
        });
      </script>
    </body>

    </html>