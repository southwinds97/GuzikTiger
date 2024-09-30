<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>GUZIK TIGER 구직타이거</title>
    <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/common.css?v=<%= System.currentTimeMillis() %>">
    <link rel="stylesheet" href="css/login.css?v=<%= System.currentTimeMillis() %>">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/ui-common.js?v=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
    <main id="container" class="login_page sub_container">
        <div class="contents">
            <div class="inner">
                <div class="login_area">
                    <h2>회원탈퇴</h2>
                    <p>정말로 회원 탈퇴하시겠어요?<br>뚱랑이는 슬퍼!</p>
                </div>
                <!-- input값이 null인지 폼 전송전에 확인 -->
                <!-- 로그인 실패 메시지 표시 -->
                <script>
                    $(document).ready(function () {
                        $("form").submit(function (event) {
                            var pass = $("input[name=pass]").val();
                            if (pass === "") {
                                alert("비밀번호를 입력해주세요.");
                                $("input[name=pass]").focus();
                                event.preventDefault(); // 폼 기본 제출 방지
                            }
                        });
                    });
                </script>
                <form action="/deleteMember.do" method="post">
                    <fieldset>
                        <legend>회원탈퇴</legend>
                        <div class="input_wrap1">
                            <input type="hidden" name="id" value="${id}"/>
                        </div>
                        <div class="input_wrap2">
                            <label for="pass">비밀번호</label>
                            <input type="password" name="pass" />
                        </div>
                        <button type="submit" class="login_btn">회원탈퇴</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </main>
</body>
</html>