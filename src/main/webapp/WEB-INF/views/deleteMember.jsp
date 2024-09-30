<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>GUZIK TIGER 구직타이거</title>
        <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
        <link rel="stylesheet" href="css/login.css?v=<?php echo time(); ?>">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
    </head>

    <body>
        <main id="container">
            <div class="contents">
                <div class="inner" style="padding: 0;">
                    <div class="login_area">
                        <h2>회원탈퇴</h2>
                        <p>회원탈퇴를 하시겠습니까?<br>
                            비밀번호를 입력해주세요!</p>
                        <!-- input값이 null인지 폼 전송전에 확인 -->
                        <!-- 로그인 실패 메시지 표시 -->
                        <script>
                            $(document).ready(function () {
                                $("form").submit(function (event) {
                                    var pass = $("input[name=pass]").val();

                                    if (pass == "") {
                                        alert("비밀번호를 입력해주세요.");
                                        $("input[name=pass]").focus();
                                        event.preventDefault(); // 폼 제출 방지
                                    }
                                });
                            });
                        </script>
                        <form action="/deleteMember.do" method="post">
                            <fieldset>
                                <legend>회원탈퇴</legend>
                                <div class="input_wrap1">
                                    <label for="id">아이디</label>
                                    <input type="text" name="id" value="${id}" readonly />
                                </div>
                                <div class="input_wrap2">
                                    <label for="pass">비밀번호</label>
                                    <input type="password" name="pass" />
                                </div>
                                <button type="submit" class="login_btn" style="margin-top: 20px;">회원탈퇴</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>

    </html>