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
				  <form name="writeFrm" method="post" enctype="multipart/form-data" action="./qnaList.do" onsubmit="return validateForm(this);">
					<input type="text" value="name" name="name">
		          	<div class="product_sel">
		            <img src="images/noimg.gif" onerror="this.src='url';">
		            <div class="product_info">
		              <div class="txt_wrap">
		                <a href="#">무직타이거 뚱랑이 테니스공 키링</a>
		                <span>7,000원</span>
		              </div>
		              <div class="sel_wrap">
		                <a href="#">상품상세보기</a>
		                <a href="#">상품정보선택</a>
		              </div>
		            </div>
		          </div>
		          <div class="qna_write">
		            <table>
		              <tbody>
		                <tr>
		                  <th>제목</th>
		                  <td>
		                    <div class="select_wrap">
		                      <select name="category">
		                        <option name="category">상품문의</option>
		                        <option name="category">주문/결제</option>
		                        <option name="category">배송문의</option>
		                        <option name="category">교환/반품</option>
		                        <option name="category">기타문의</option>
		                      </select>
		                    </div>
		                    <div class="select_wrap sel_tit">
		                      <select>
		                        <option name="title">문의드려요 :)</option>
		                      </select>
		                    </div>
		                  </td>
		                </tr>
		                <tr>
		                  <th>본문</th>
		                  <td><textarea name="content"></textarea></td>
		                </tr>
		                <tr>
		                  <th>UCC URL</th>
		                  <td>
		                    <input type="text" name="uccURL"> 
		                  </td>
		                </tr>
		                <tr>
		                  <th>첨부파일</th>
		                  <td>
		                    <input type="file" name="ofile">
		                  </td>
		                </tr>
		                <tr>
		                  <th>비밀번호</th>
		                  <td>
		                    <input type="text" name="password">
		                  </td>
		                </tr>
		                <tr>
		                  <th>비밀글설정</th>
		                  <td>
		                      <input type="radio" name="secretYN" value="n" id="passn" checked>
		                      <label for="passn">공개글</label>
		                      <input type="radio" name="secretYN" value="y" id="passy">
		                      <label for="passy">비밀글</label>
		                  </td>
		                </tr>
		                </tr>
		              </tbody>
		            </table>
		            <div class="btn_wrap">
		              <a href="qnaList.do">목록</a>
		              <div class="write_btn_wrap">
		                <a href="qnaList.do">취소</a>
		                <button class="write_btn" type="submit">등록</button>
		              </div>
		            </div>
		          </div>
				</form>
	        </div>
	      </main>
        <!-- 푸터 -->
        <%@ include file="footer.jsp" %>
    </div>
  </body>

  </html>