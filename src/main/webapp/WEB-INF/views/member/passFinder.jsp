<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- HTML 인코딩 설정 -->
    <meta charset="UTF-8" />
    <meta name="format-detection" content="telephone=no" />
    <meta
      name="description"
      content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다"
    />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="구직타이거" />
    <meta
      property="og:description"
      content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다"
    />
    <meta
      property="og:image"
      content="https://contents.sixshop.com/uploadedFiles/56465/default/image_1710376929430.png"
    />
    <link rel="icon" href="images/common/favicon.png" />
    <link rel="apple-touch-icon-precomposed" href="images/common/favicon.png" />
    <title>GUZIK TIGER 구직타이거</title>

    <!-- CSS 파일 -->
    <link rel="stylesheet" href="css/jquery-ui.min.css" />
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>" />
    <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>" />
    <link rel="stylesheet" href="css/passFinder.css?v=<?php echo time(); ?>" />

    <!-- JS 파일 -->
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>

    <!-- 이메일/전화번호 전환 JS -->
    <script>
      $(document).ready(function () {
        toggleViews();

        $("input[name='check']").on("change", function () {
          toggleViews();
        });

        function toggleViews() {
          if ($("#check_email").is(":checked")) {
            $(".email_view").show();
            $(".mobile_view").hide();
          } else {
            $(".email_view").hide();
            $(".mobile_view").show();
          }
        }
      });
    </script>

    <style>
      .email_view,
      .mobile_view {
        display: none;
      }
    </style>
  </head>
  <body>
    <div id="find_wrap">
      <!-- 헤더 -->
      <%@ include file="../header.jsp" %>

      <div class="path">
        <ol>
          <li><a href=""></a></li>
          <li><strong>비밀번호 찾기</strong></li>
        </ol>
      </div>

      <div class="title">
        <h2>비밀번호 찾기</h2>
      </div>

      <div class="base_box">
        <form action="passFinder.do" method="post">
          <fieldset class="content">
            <legend>비밀번호 찾기</legend>
            <ul class="base_desc">
              <li class="check_blank">
                <input type="radio" id="check_email" name="check" checked />
                <label for="check_email">이메일</label>
                <input type="radio" id="check_phn" name="check" />
                <label for="check_phn">전화번호</label>
              </li>

              <!-- 이름 입력 필드 -->
              <li class="id_view">
                <strong>아이디</strong>
                <br />
                <input type="text" name="id" />
              </li>

              <!-- 이름 입력 필드 -->
              <li class="name_view">
                <strong>이름</strong>
                <br />
                <input type="text" name="name" />
              </li>

              <!-- 이메일 입력 필드 -->
              <li class="email_view">
                <strong>이메일로 찾기</strong>
                <br />
                <input type="text" name="email" />
              </li>

              <!-- 전화번호 입력 필드 -->
              <li class="mobile_view">
                <strong>휴대폰 번호로 찾기</strong>
                <br />
                <input type="text" name="tel1" />
                -
                <input type="text" name="tel2" />
                -
                <input type="text" name="tel3" />
                <input type="hidden" name="tel" value="" />
              </li>
            </ul>
            <!--전화번호 합치기 Script -->
            <script>
              $(document).ready(function () {
                function updateTel() {
                  var tel1 = $("input[name=tel1]").val();
                  var tel2 = $("input[name=tel2]").val();
                  var tel3 = $("input[name=tel3]").val();

                  // tel1, tel2, tel3 모두 값이 있을 때만 합치기
                  if (tel1 && tel2 && tel3) {
                    $("input[name=tel]").val(tel1 + "-" + tel2 + "-" + tel3);
                  } else {
                    $("input[name=tel]").val(null);
                  }
                  console.log("Updated tel: " + $("input[name=tel]").val());
                }

                $(
                  "input[name=tel1], input[name=tel2], input[name=tel3]"
                ).change(updateTel);

                // 서버에서 전달받은 전화번호를 각각의 필드에 채워줍니다.
                $("input[name=tel1]").val("${tel1}");
                $("input[name=tel2]").val("${tel2}");
                $("input[name=tel3]").val("${tel3}");

                // 초기 전화번호 업데이트
                updateTel();
              });
            </script>
          </fieldset>

          <div class="bottom_btn">
            <button type="submit" class="confirm_btn">확인</button>
          </div>
        </form>
      </div>
    </div>
    <!-- 푸터 -->
    <%@ include file="../footer.jsp" %>
  </body>
</html>
