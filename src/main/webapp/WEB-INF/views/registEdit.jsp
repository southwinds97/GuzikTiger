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
      <!-- 헤더 -->
      <%@ include file="header.jsp" %>
    <div class="edit_wrap">
      <div class="path">
        <ol>
          <li>
            <a href="/"></a>
          </li>
          <li>
            <strong>회원 정보 수정</strong>
          </li>
        </ol>
      </div>
        <!-- 회원정보수정 시작 -->
        <div class="title">
          <h2>회원 정보 수정</h2>
        </div>
        <div class="title_area">
          <h3>기본 정보</h3>
          <p><span class="star">*</span>필수입력사항</p>
        </div>
        <div class="basic">
        <form action="/registEdit.do" method="post">
          <table border="1">
            <caption>회원 기본 정보</caption>
            <tbody>
              <input type="hidden" name="id" value="${member.id}" />
              <tr>
                <th scope="row">비밀번호&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="password" name="pass" value="${member.pass}" />
                  <span class="txt">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,8자~16자)</span>
                </td>
              </tr>
              <tr>
                <th scope="row">비밀번호 확인&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="password" name="passchk" value="${member.pass}" />
                </td>
              </tr>
              <tr>
                <th scope="row">비밀번호 확인 질문&nbsp;<span class="star">*</span></th>
                <td>
                  <select id="hint" class="hint" name="hint">
                    <option value="hint_01" ${member.hint == 'hint_01' ? 'selected' : ''}>기억에 남는 추억의 장소는?</option>
                    <option value="hint_02" ${member.hint == 'hint_02' ? 'selected' : ''}>자신의 인생 좌우명은?</option>
                    <option value="hint_03" ${member.hint == 'hint_03' ? 'selected' : ''}>자신의 보물 제1호는?</option>
                    <option value="hint_04" ${member.hint == 'hint_04' ? 'selected' : ''}>가장 기억에 남는 선생님 성함은?</option>
                    <option value="hint_05" ${member.hint == 'hint_05' ? 'selected' : ''}>타인이 모르는 자신만의 신체비밀이 있다면?</option>
                    <option value="hint_06" ${member.hint == 'hint_06' ? 'selected' : ''}>추억하고 싶은 날짜가 있다면?</option>
                    <option value="hint_07" ${member.hint == 'hint_07' ? 'selected' : ''}>받았던 선물 중 기억에 남는 독특한 선물은?</option>
                    <option value="hint_08" ${member.hint == 'hint_08' ? 'selected' : ''}>유년시절 가장 생각나는 친구 이름은?</option>
                    <option value="hint_09" ${member.hint == 'hint_09' ? 'selected' : ''}>인상 깊게 읽은 책 이름은?</option>
                    <option value="hint_10" ${member.hint == 'hint_10' ? 'selected' : ''}>읽은 책 중에서 좋아하는 구절이 있다면?</option>
                    <option value="hint_11" ${member.hint == 'hint_11' ? 'selected' : ''}>자신이 두번째로 존경하는 인물은?</option>
                    <option value="hint_12" ${member.hint == 'hint_12' ? 'selected' : ''}>친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
                    <option value="hint_13" ${member.hint == 'hint_13' ? 'selected' : ''}>초등학교 때 기억에 남는 짝꿍 이름은?</option>
                    <option value="hint_14" ${member.hint == 'hint_14' ? 'selected' : ''}>다시 태어나면 되고 싶은 것은?</option>
                    <option value="hint_15" ${member.hint == 'hint_15' ? 'selected' : ''}>내가 좋아하는 캐릭터는?</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th scope="row">비밀번호 확인 답변&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="text" class="answer" name="hintas" value="${member.hintas}" required />
                </td>
              </tr>
              <tr>
                <th scope="row" class="name">이름&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="text" name="name" value="${member.name}">
                </td>
              </tr>
              <tr>
                <th scope="row">주소&nbsp;<span class="star">*</span></th>
                <td>
                  <div class="basic_addr">
                    <input type="text" readonly name="postcode" value="${member.postcode}" placeholder="우편번호"
                                id="postcode" />
                    <button type="button" class="search_btn" onclick="daumPostcode()">주소검색</button>
                  </div>
                  <div class="basic_addr">
                    <input type="text" class="basic" readonly name="addr" value="${member.addr}" placeholder="기본주소" id="address" />
                  </div>
                  <div class="extra_addr">
                    <input type="text" value="${member.detailaddr}" name="detailaddr" placeholder="나머지 주소" id="detailAddress" />
                  </div>
                </td>
                <!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
                        <!-- 주소검색 API -->
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script>
                            function daumPostcode() {
                                new daum.Postcode({
                                    oncomplete: function (data) {
                                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                        var addr = ''; // 주소 변수
                                        var extraAddr = ''; // 참고항목 변수

                                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                            addr = data.roadAddress;
                                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                            addr = data.jibunAddress;
                                        }

                                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                        if (data.userSelectedType === 'R') {
                                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                                extraAddr += data.bname;
                                            }
                                            // 건물명이 있고, 공동주택일 경우 추가한다.
                                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                            }
                                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                            if (extraAddr !== '') {
                                                extraAddr = ' (' + extraAddr + ')';
                                            }
                                            // 조합된 참고항목을 해당 필드에 넣는다.
                                            // document.getElementById("sample6_extraAddress").value = extraAddr;

                                        } else {
                                            // document.getElementById("sample6_extraAddress").value = '';
                                        }

                                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                        document.getElementById('postcode').value = data.zonecode;
                                        document.getElementById("address").value = addr;
                                        // 커서를 상세주소 필드로 이동한다.
                                        document.getElementById("detailAddress").focus();
                                    }
                                }).open();
                            }
                        </script>
              </tr>
              <tr>
                <th scope="row">휴대전화&nbsp;<span class="star">*</span></th>
                <td>
                  <div class="basic_tel">
                    <select class="mobile" name="tel1">
                      <option value="010" ${tel1 == '010' ? 'selected' : ''}>010</option>
                      <option value="011" ${tel1 == '011' ? 'selected' : ''}>011</option>
                      <option value="016" ${tel1 == '016' ? 'selected' : ''}>016</option>
                      <option value="017" ${tel1 == '017' ? 'selected' : ''}>017</option>
                      <option value="018" ${tel1 == '018' ? 'selected' : ''}>018</option>
                      <option value="019" ${tel1 == '019' ? 'selected' : ''}>019</option>
                    </select><span>-</span>
                    <input type="text" name="tel2" value="${tel2}"><span>-</span>
                    <input type="text" name="tel3" value="${tel3}">
                    <input type="hidden" name="tel" value="" />
                    <!--전화번호 합치기 Script -->
                    <script>
                      $(document).ready(function () {
                          function updateTel() {
                              var tel1 = $("select[name=tel1]").val();
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
                
                          $("select[name=tel1], input[name=tel2], input[name=tel3]").change(updateTel);
                
                          // 서버에서 전달받은 전화번호를 각각의 필드에 채워줍니다.
                          $("select[name=tel1]").val("${tel1}");
                          $("input[name=tel2]").val("${tel2}");
                          $("input[name=tel3]").val("${tel3}");

                          // 초기 전화번호 업데이트
                          updateTel();
                      });
                    </script>
                  </div>
                </td>
              </tr>
              <tr>
                <th scope="row">SMS 수신여부&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="radio" id="recption" name="sms_recption" checked />
                  <label for="recption" id="sms">수신함</label>
                  <input type="radio" id="nrecption" name="sms_recption" />
                  <label for="nrecption" id="nsms">수신 안함</label>
                  <p class="txtInfo">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
                </td>
              </tr>
              <tr>
                <th scope="row">이메일&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="text" name="email" value="${member.email}">
                </td>
              </tr>
              <tr>
                <th scope="row">이메일 수신여부&nbsp;<span class="star">*</span></th>
                <td>
                  <input type="radio" id="new_mail" name="email_recption" checked  />
                  <label for="new_mail">수신함</label>
                  <input type="radio" id="no_mail" name="email_recption" />
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
                  <input type="radio" id="man" name="gen" value="남" ${member.gen == '남' ? 'checked' : ''} />
                  <label for="man">남자</label>
                  <input type="radio" id="woman" name="gen" value="여" ${member.gen == '여' ? 'checked' : ''} />
                  <label for="woman">여자</label>
                </td>
              </tr>
              <tr>
                <th scope="row">생년월일</th>
                <td>
                  <div class="more_date">
                    <input type="text" name="year" value="${year}"><span>년</span>
                    <input type="text" name="month" value="${month}"><span>월</span>
                    <input type="text" name="day" value="${day}"><span>일</span>
                    <input type="hidden" name="birth" value="" />
                     <!--생년월일 합치기 Script -->
                     <script>

                      $(document).ready(function () {
                          function updateBirth() {
                              var year = $("input[name=year]").val();
                              var month = $("input[name=month]").val();
                              var day = $("input[name=day]").val();

                              if (year && month && day) {
                                  $("input[name=birth]").val(year + "-" + month + "-" + day);
                              } else {
                                  $("input[name=birth]").val(null);
                              }
                              console.log("Updated birth: " + $("input[name=birth]").val());
                          }

                          $("input[name=year], input[name=month], input[name=day]").change(updateBirth);

                          // 초기 생년월일 업데이트
                          updateBirth();
                
                      });
                  </script>
                    <input type="radio" class="calendar" id="solar" name="calendar" value="양력" ${member.calendar == '양력' ? 'checked' : ''} />
                    <label for="solar">양력</label>
                    <input type="radio" class="calendar" id="lunar" name="calendar" value="음력" ${member.calendar == '음력' ? 'checked' : ''} />
                    <label for="lunar">음력</label>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="bottom">
          <button type="button" class="cancel_btn" onclick="">취소</button>
          <button type="submit" class="edit_btn" onclick="">회원정보수정</button>
        </div>
        <!-- 버튼 처리 -->
        <script>
          $(document).ready(function () {
              $(".edit_btn").click(function () {
                  if (checked()) {
                      $("form").submit();
                  }
              });
          });
          // 취소 버튼
          $(".cancel_btn").click(function
              () {
              location.href = "/mypage.do";
          });
        </script>
        </form>
        <!-- 회원정보수정 확인 스크립트 -->
        <script>
          // 비밀번호 유효성 검사 및 내용 빈칸 확인
          function checked() {
                    var id = document.getElementById("id").value;
                    var pass = document.getElementsByName("pass")[0].value;
                    var passchk = document.getElementsByName("passchk")[0].value;
                    var hint = document.getElementsByName("hint")[0].value;
                    var hintas = document.getElementsByName("hintas")[0].value;
                    var name = document.getElementsByName("name")[0].value;
                    var postcode = document.getElementById("postcode").value;
                    var address = document.getElementById("address").value;
                    // var regExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/; // 비밀번호 정규식
                    // var idRegExp = /^[a-zA-Z0-9]{4,12}$/; // 아이디 정규식

                    if (id == "") {
                        alert("아이디를 입력해주세요.");
                        return false;
                    }

                    // if (!regExp.test(pass)) {
                    //     alert("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자로 입력해주세요.");
                    //     return false;
                    // }

                    if (pass != passchk) {
                        alert("비밀번호가 일치하지 않습니다.");
                        return false;
                    }

                    if (hint == "") {
                        alert("비밀번호 확인 질문을 선택해주세요.");
                        return false;
                    }

                    if (hintas == "") {
                        alert("비밀번호 확인 답변을 입력해주세요.");
                        return false;
                    }

                    if (name == "") {
                        alert("이름을 입력해주세요.");
                        return false;
                    }

                    if (postcode == "") {
                        alert("우편번호 및 주소를 입력해주세요.");
                        return false;
                    }

                    if (address == "") {
                        alert("우편번호 및 주소를 입력해주세요.");
                        return false;
                    }

                    return true;
                }
        </script>
    </div>
        <!-- 푸터 -->
        <%@ include file="footer.jsp" %>
  </body>

  </html>