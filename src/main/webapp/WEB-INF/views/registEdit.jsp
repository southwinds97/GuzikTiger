<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/swiper-bundle.min.css">
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
    <!-- <link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>"> -->
    <link rel="stylesheet" href="css/registEdit.css?v=<?php echo time(); ?>">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/swiper-bundle.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
  </head>

  <body>
    <div class="edit_wrap">
      <div class="path">
        <ol>
          <li>
            <a href="/Edit.html"></a>
          </li>
          <li>
            <strong>회원 정보 수정</strong>
          </li>
        </ol>
      </div>
      <!-- 헤더 -->
      <%@ include file="header.jsp" %>
        <!-- 회원정보수정 시작 -->
        <div class="title">
          <h2>회원 정보 수정</h2>
        </div>
        <div class="title_area">
          <h3>기본 정보</h3>
          <p><span class="star">*</span>필수입력사항</p>
        </div>
        <div class="basic">
          <table border="1">
            <caption>회원 기본 정보</caption>
            <tbody>
              <tr>
                <th scope="row">비밀번호&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="password" readonly name="userpass" value="">
                  <span class="txt">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,8자~16자)</span>
                </td>
              </tr>
              <tr>
                <th scope="row">비밀번호 확인&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="password" readonly name="userrp" value="">
                </td>
              </tr>
              <tr>
                <th scope="row">비밀번호 확인 질문&nbsp;<span class="star">*</span></th>
                <td>
                  <select id="hint" class="hint" name="hint">
                    <option value="hint_01">기억에 남는 추억의 장소는?</option>
                    <option value="hint_02">자신의 인생 좌우명은?</option>
                    <option value="hint_03">자신의 보물 제1호는?</option>
                    <option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
                    <option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
                    <option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
                    <option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
                    <option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
                    <option value="hint_09">인상 깊게 읽은 책 이름은?</option>
                    <option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
                    <option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
                    <option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
                    <option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
                    <option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
                    <option value="hint_15">내가 좋아하는 캐릭터는?</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th scope="row">비밀번호 확인 답변&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="text" class="answer" name="useras" value="">
                </td>
              </tr>
              <tr>
                <th scope="row" class="name">이름&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="text" name="username" value="">
                </td>
              </tr>
              <tr>
                <th scope="row">주소&nbsp;<span class="star">*</span></th>
                <td>
                  <div class="basic_addr">
                    <input type="text" readonly name="useraddr" value="" placeholder="우편번호">
                    <button type="button" class="search_btn" onclick="''">주소검색</button>
                  </div>
                  <div class="basic_addr">
                    <input type="text" class="basic" readonly name="useraddr1" value="" placeholder="기본주소">
                  </div>
                  <div class="extra_addr">
                    <input type="text" name="useraddr2" value="" placeholder="나머지 주소">
                  </div>
                </td>
              </tr>
              <tr>
                <th scope="row">휴대전화&nbsp;<span class="star">*</span></th>
                <td>
                  <div class="basic_tel">
                    <select class="mobile" name="mobile">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="017">017</option>
                      <option value="018">018</option>
                      <option value="019">019</option>
                    </select><span>-</span>
                    <input type="text" name="usertel2" value=""><span>-</span>
                    <input type="text" name="usertel3" value="">
                  </div>
                </td>
              </tr>
              <tr>
                <th scope="row">SMS 수신여부&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="radio" id="recption" name="sms_recption" />
                  <label for="recption" id="sms">수신함</label>
                  <input type="radio" id="nrecption" name="sms_recption" checked />
                  <label for="nrecption" id="nsms">수신 안함</label>
                  <p class="txtInfo">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
                </td>
              </tr>
              <tr>
                <th scope="row">이메일&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="text" name="useremail" value="">
                </td>
              </tr>
              <tr>
                <th scope="row">이메일 수신여부&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="radio" id="new_mail" name="email_recption" />
                  <label for="new_mail">수신함</label>
                  <input type="radio" id="no_mail" name="email_recption" checked />
                  <label for="no_mail">수신 안함</label>
                  <p class="txtInfo">쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="title_end">
          <h3>추가 정보</h3>
        </div>
        <div class="more">
          <table border="1">
            <caption>회원 기본 정보</caption>
            <tbody>
              <tr>
                <th scope="row">성별</th>
                <td>
                  <input type="radio" id="man" name="usersex" value="man" checked />
                  <label for="man">남자</label>
                  <input type="radio" id="woman" name="usersex" value="woman" />
                  <label for="woman">여자</label>
                </td>
              </tr>
              <tr>
                <th scope="row">생년월일</th>
                <td>
                  <div class="more_date">
                    <input type="text" name="year" value=""><span>년</span>
                    <input type="text" name="month" value=""><span>월</span>
                    <input type="text" name="day" value=""><span>일</span>
                    <input type="radio" class="calendar" id="solar" name="userbirth" value="solar" checked />
                    <label for="solar">양력</label>
                    <input type="radio" class="calendar" id="lunar" name="userbirth" value="lunar" />
                    <label for="lunar">음력</label>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="bottom">
          <button type="button" class="cancel_btn" onclick="">취소</button>
          <button type="button" class="edit_btn" onclick="">회원정보수정</button>
        </div>
        <!-- 푸터 -->
        <%@ include file="footer.jsp" %>
    </div>
  </body>

  </html>