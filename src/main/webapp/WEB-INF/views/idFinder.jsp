<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>KUZIK TIGER 구직타이거</title>
  <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
  <link rel="stylesheet" href="css/jquery-ui.min.css">
  <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
  <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
  <link rel="stylesheet" href="css/idFinder.css?v=<?php echo time(); ?>">
  <script src="js/jquery-3.7.1.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
</head>
<body>
  <div id="find_wrap">
     <!-- 헤더 -->
     <%@ include file="header.jsp" %>
  	 <div class="path">
        <ol>
          <li>
            <a href=""></a>
          </li>
          <li>
            <strong>아이디 찾기</strong>
          </li>
        </ol>
      </div>
     <div class="title">
       <h2>아이디 찾기</h2>
     </div>
    <div class="base_box">
     <fieldset class="content">
     	<legend>아이디 찾기</legend>
     	<ul class="base_desc">
     	  <li class=name_view>
     	  <strong>이름</strong><br>
     	  <input type="text" name="name">
     	  </li>
     	  <li class=mobile_view>
     	  <strong>휴대폰 번호로 찾기</strong><br>
     	  <input type="text" name="phn">-
     	  <input type="text" name="phn">-
     	  <input type="text" name="phn">
     	  </li>
     	</ul>
    </div>
    <div class="bottom_btn">
     <button type="button" class="confirm_btn" onclick="">확인</button>
    </div>
  </div>
   <!-- 푸터 -->
   <%@ include file="footer.jsp" %>
</body>
</html>