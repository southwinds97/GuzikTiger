<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>KUZIK TIGER 구직타이거</title>
    <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/login.css?v=<?php echo time(); ?>">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
  </head>

  <body>
    <main id="container" class="login_page sub_container">
      <div class="contents">
        <div class="inner">
          <div class="login_area">
            <h2>로그인</h2>
            <p>1초 회원가입으로 쿠폰도 받고<br>
              간편하게 로그인 하랑구!</p>
            <div class="btn_wrap">
              <a class="kakao_btn" href="#">카카오 1초 로그인</a>
              <a class="naver_btn" href="#">네이버 1초 로그인</a>
            </div>
            <!-- input값이 null인지 폼 전송전에 확인 -->
            <!-- 로그인 실패 메시지 표시 -->
            <script>
              $(document).ready(function () {
                $("form").submit(function (event) {
                  event.preventDefault(); // 폼 기본 제출 방지
                  var id = $("input[name=id]").val();
                  var pass = $("input[name=pass]").val();

                  if (id == "") {
                    alert("아이디를 입력해주세요.");
                    $("input[name=id]").focus();
                    return false;
                  }
                  if (pass == "") {
                    alert("비밀번호를 입력해주세요.");
                    $("input[name=pass]").focus();
                    return false;
                  }

                  // AJAX 요청
                  $.ajax({
                    type: "POST",
                    url: "/loginCheck.do",
                    data: { id: id, pass: pass },
                    success: function (response) {
                      if (response.success) {
                        // 로그인 성공 시 폼 제출
                        $("form")[0].submit();
                      } else {
                        // 로그인 실패 시 메시지 표시
                        alert(response.message);
                      }
                    },
                    error: function () {
                      alert("서버와의 통신 중 오류가 발생했습니다.");
                    }
                  });
                });
              });
            </script>
            <form action="/login.do" method="post">
              <fieldset>
                <legend>로그인</legend>
                <div class="input_wrap1">
                  <label for="id">아이디 또는 이메일</label>
                  <input type="text" name="id" />
                </div>
                <div class="input_wrap2">
                  <label for="pass">비밀번호</label>
                  <input type="password" name="pass" />
                </div>
                <ul class="link_wrap">
                  <li><a href="#">회원가입</a></li>
                  <li><a href="/idFinder.do">아이디</a></li>
                  <li><a href="#">비밀번호 찾기</a></li>
                </ul>
                <button type="submit" class="login_btn">로그인</button>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
      </div>
    </main>
  </body>

  </html>