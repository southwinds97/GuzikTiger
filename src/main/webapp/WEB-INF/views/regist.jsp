<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>

        <!-- 라이브러리 -->
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
        <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
        <link rel="stylesheet" href="css/regist.css?v=<?php echo time(); ?>">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- <script src="js/ui-common.js?v=<?php echo time(); ?>"></script> -->
        <!-- ajax 다운로드 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- 중복확인 자바스크립트(Ajax) -->

    </head>

    <body>
        <div class="join_wrap">
            <%@ include file="header.jsp" %>
                <div class="membership">
                    <h2>회원 가입</h2>
                    <form action="/regist.do" method="post" onsubmit="return checked();">
                        <label for="id">아이디 <span>*</span></label>
                        <div class="register_id">
                            <input type="text" name="id" value="" id="id" required /><br>
                            <button type="button" class="check_btn" id="idCheck">중복확인</button>
                        </div>
                        <label for="pass">비밀번호 <span>*</span></label>
                        <input type="password" name="pass" value="" required /><br />
                        <span class="txt">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,8자~16자)</span>

                        <label for="repass">비밀번호 확인 <span>*</span></label>
                        <input type="password" name="passchk" value="" required /><br />

                        <label for="repass">비밀번호 확인 질문 <span>*</span></label>
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

                        <label for="repass">비밀번호 확인 답변 <span>*</span></label>
                        <input type="text" name="hintas" value="" required /><br />

                        <label for="name">이름 <span>*</span></label>
                        <input type="text" name="name" value="" required /><br />

                        <label for="zip_code">주소 <span>*</span></label>
                        <div class="register_addr">
                            <input type="text" readonly name="postcode" value="" placeholder="우편번호"
                                id="postcode" /><br />
                            <button type="button" class="search_btn" onclick="daumPostcode()">주소검색</button>
                        </div>
                        <input type="text" readonly name="addr" value="" placeholder="기본주소" id="address" /><br />
                        <input type="text" value="" name="detailaddr" placeholder="나머지 주소" id="detailAddress" /><br />
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
                        <!-- <label for="tel">일반 전화 <span>*</span></label>
              <div class="register_tel">
                <select class="phn" name="tel1">
                  <option value="02">02</option>
                  <option value="031">031</option>
                  <option value="032">032</option>
                  <option value="033">033</option>
                  <option value="041">041</option>
                  <option value="042">042</option>
                  <option value="043">043</option>
                  <option value="044">044</option>
                  <option value="051">051</option>
                  <option value="052">052</option>
                  <option value="053">053</option>
                  <option value="054">054</option>
                  <option value="055">055</option>
                  <option value="061">061</option>
                  <option value="062">062</option>
                  <option value="063">063</option>
                  <option value="064">064</option>
                  <option value="070">070</option>
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                  <option value="0502">0502</option>
                  <option value="0503">0503</option>
                  <option value="0504">0504</option>
                  <option value="0505">0505</option>
                  <option value="0506">0506</option>
                  <option value="0507">0507</option>
                  <option value="0508">0508</option>
                </select><span>-</span>
                <input type="text" name="tel2" value=""><span>-</span>
                <input type="text" name="tel3" value="">
              </div> -->

                        <label for="tel">휴대 전화 <span>*</span></label>
                        <div class="register_tel">
                            <select class="mobile" name="tel1">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select><span>-</span>
                            <input type="text" name="tel2" value="" /><span>-</span>
                            <input type="text" name="tel3" value="" />
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
                                });

                            </script>
                        </div>

                        <label for="email">이메일 <span>*</span></label>
                        <input type="text" name="email" value=""><br>
                        <!-- 로그인 아이디로 사용할 이메일을 입력해 주세요. -->


                        <div class="more">
                            <label for="sex"> 성별 </label><br>
                            <input type="radio" id="man" name="gen" value="남자" checked />
                            <label for="man">남자</label>
                            <input type="radio" id="woman" name="gen" value="여자" />
                            <label for="woman">여자</label>

                            <label for="birth">생년월일</label>
                            <div class="register_date">
                                <input type="text" name="year" value=""><span style="color: black;">년</span>
                                <input type="text" name="month" value=""><span style="color: black;">월</span>
                                <input type="text" name="day" value=""><span style="color: black;">일</span>
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
                                    });
                                </script>
                            </div>

                            <!-- 양력/음력 선택 필드 -->
                            <input type="radio" class="calendar" id="solar" name="calendar" value="양력" checked />
                            <label for="solar">양력</label>
                            <input type="radio" class="calendar" id="lunar" name="calendar" value="음력" />
                            <label for="lunar">음력</label>
                        </div>

                        <!-- 전체동의 이벤트 -->
                        <script>
                            $(document).ready(function () {
                                // 전체 동의 체크박스
                                $("#Allagree").click(function () {
                                    console.log("전체 동의 체크");
                                    if ($("#Allagree").prop("checked")) {
                                        $("#terms").prop("checked", true);
                                        $("#privacy").prop("checked", true);
                                        $("#sms").prop("checked", true);
                                        $("#email").prop("checked", true);
                                    } else {
                                        $("#terms").prop("checked", false);
                                        $("#privacy").prop("checked", false);
                                        $("#sms").prop("checked", false);
                                        $("#email").prop("checked", false);
                                    }
                                });
                            });
                        </script>

                        <div class="register_agree">
                            <input type="checkbox" id="Allagree" />
                            <label for="Allagree">전체 동의</label>
                            <p>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다. 이용약관 및 개인정보수집 및 이용에 모두 동의합니다.</p>
                        </div>

                        <div class="register_inner">
                            <input type="checkbox" id="terms" />
                            <label for="terms">이용약관에 동의합니다.(필수)</label>
                            <span class="agree_toggle">
                            </span>
                        </div>
                        <div class="register_view">
                            <p>**&nbsp;해당 서식은 공정거래위원회에서 제공하는 전자상거래 표준 약관으로 쇼핑몰 운영형태에 따른 수정이 필요할 수 있습니다.&nbsp;쇼핑몰에 적용하시기
                                전
                                쇼핑몰 운영 사항
                                등을 확인하시고
                                관련 법령 등을 감안하여 적절한 내용을 반영하여 이용하시기 바랍니다. **
                                <br>&nbsp;
                                <br>제1조(목적)
                                <br>이 약관은 (주)스튜디오무직(전자상거래 사업자)이 운영하는 무직타이거 쇼핑몰(이하&nbsp;“몰”이라 한다)에서 제공하는 인터넷 관련
                                서비스(이하&nbsp;“서비스”라
                                한다)를 이용함에 있어
                                사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
                                <br>※「PC통신,&nbsp;무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
                                <br>제2조(정의)
                                <br>①&nbsp;“몰”이란&nbsp;OO&nbsp;회사가 재화 또는 용역(이하&nbsp;“재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등
                                정보통신설비를
                                이용하여 재화
                                등을 거래할 수
                                있도록 설정한 가상의 영업장을 말하며,&nbsp;아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
                                <br>②&nbsp;“이용자”란&nbsp;“몰”에 접속하여 이 약관에 따라&nbsp;“몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                                <br>③&nbsp;‘회원’이라 함은&nbsp;“몰”에 회원등록을 한 자로서,&nbsp;계속적으로&nbsp;“몰”이 제공하는 서비스를 이용할 수 있는 자를
                                말합니다.
                                <br>④&nbsp;‘비회원’이라 함은 회원에 가입하지 않고&nbsp;“몰”이 제공하는 서비스를 이용하는 자를 말합니다.
                                <br>제3조&nbsp;(약관 등의 명시와 설명 및 개정)
                                <br>①&nbsp;“몰”은 이 약관의 내용과 상호 및 대표자 성명,&nbsp;영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를
                                포함),&nbsp;전화번호․모사전송번호․전자우편주소,&nbsp;사업자등록번호,&nbsp;통신판매업 신고번호,&nbsp;개인정보관리책임자등을 이용자가 쉽게 알
                                수
                                있도록&nbsp;00&nbsp;사이버몰의
                                초기 서비스화면(전면)에 게시합니다.&nbsp;다만,&nbsp;약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
                                <br>②&nbsp;“몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할
                                수
                                있도록 별도의
                                연결화면 또는 팝업화면
                                등을 제공하여 이용자의 확인을 구하여야 합니다.
                                <br>③&nbsp;“몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」,&nbsp;「약관의 규제에 관한 법률」,&nbsp;「전자문서 및
                                전자거래기본법」,&nbsp;「전자금융거래법」,&nbsp;「전자서명법」,&nbsp;「정보통신망 이용촉진 및 정보보호 등에 관한 법률」,&nbsp;「방문판매 등에
                                관한
                                법률」,&nbsp;「소비자기본법」 등
                                관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                                <br>④&nbsp;“몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자&nbsp;7일 이전부터
                                적용일자
                                전일까지
                                공지합니다.&nbsp;다만,&nbsp;이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한&nbsp;30일 이상의 사전 유예기간을 두고 공지합니다.
                                &nbsp;이
                                경우&nbsp;"몰“은 개정 전
                                내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
                                <br>⑤&nbsp;“몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정
                                전의
                                약관조항이 그대로
                                적용됩니다.&nbsp;다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에&nbsp;“몰”에
                                송신하여&nbsp;“몰”의 동의를 받은
                                경우에는 개정약관 조항이 적용됩니다.
                                <br>⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률,&nbsp;약관의 규제 등에 관한
                                법률,&nbsp;공정거래위원회가
                                정하는 전자상거래
                                등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
                                <br>제4조(서비스의 제공 및 변경)
                                <br>①&nbsp;“몰”은 다음과 같은 업무를 수행합니다.
                                <br>1.&nbsp;재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
                                <br>2.&nbsp;구매계약이 체결된 재화 또는 용역의 배송
                                <br>3.&nbsp;기타&nbsp;“몰”이 정하는 업무
                                <br>②&nbsp;“몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할
                                수
                                있습니다.&nbsp;이 경우에는 변경된
                                재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
                                <br>③&nbsp;“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를
                                이용자에게 통지 가능한
                                주소로 즉시
                                통지합니다.
                                <br>④ 전항의 경우&nbsp;“몰”은 이로 인하여 이용자가 입은 손해를 배상합니다.&nbsp;다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는
                                그러하지
                                아니합니다.
                                <br>제5조(서비스의 중단)
                                <br>①&nbsp;“몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장,&nbsp;통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로
                                중단할 수
                                있습니다.
                                <br>②&nbsp;“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다.&nbsp;단,
                                “몰”이
                                고의 또는
                                과실이 없음을 입증하는
                                경우에는 그러하지 아니합니다.
                                <br>③ 사업종목의 전환,&nbsp;사업의 포기,&nbsp;업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는&nbsp;“몰”은 제8조에
                                정한
                                방법으로 이용자에게
                                통지하고
                                당초&nbsp;“몰”에서 제시한 조건에 따라 소비자에게 보상합니다.&nbsp;다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는
                                적립금
                                등을&nbsp;“몰”에서 통용되는
                                통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
                                <br>제6조(회원가입)
                                <br>① 이용자는&nbsp;“몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
                                <br>②&nbsp;“몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
                                <br>1.&nbsp;가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우,&nbsp;다만 제7조제3항에 의한 회원자격 상실
                                후&nbsp;3년이
                                경과한
                                자로서&nbsp;“몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
                                <br>2.&nbsp;등록 내용에 허위,&nbsp;기재누락,&nbsp;오기가 있는 경우
                                <br>3.&nbsp;기타 회원으로 등록하는 것이&nbsp;“몰”의 기술상 현저히 지장이 있다고 판단되는 경우
                                <br>③ 회원가입계약의 성립 시기는&nbsp;“몰”의 승낙이 회원에게 도달한 시점으로 합니다.
                                <br>④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우,&nbsp;상당한 기간 이내에&nbsp;“몰”에 대하여 회원정보 수정 등의 방법으로 그
                                변경사항을
                                알려야 합니다.
                                <br>제7조(회원 탈퇴 및 자격 상실 등)
                                <br>① 회원은&nbsp;“몰”에 언제든지 탈퇴를 요청할 수 있으며&nbsp;“몰”은 즉시 회원탈퇴를 처리합니다.
                                <br>② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
                                <br>1.&nbsp;가입 신청 시에 허위 내용을 등록한 경우
                                <br>2. “몰”을 이용하여 구입한 재화 등의 대금,&nbsp;기타&nbsp;“몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
                                <br>3.&nbsp;다른 사람의&nbsp;“몰”&nbsp;이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
                                <br>4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
                                <br>③&nbsp;“몰”이 회원 자격을 제한․정지 시킨 후,&nbsp;동일한 행위가&nbsp;2회 이상 반복되거나&nbsp;30일 이내에 그 사유가 시정되지
                                아니하는
                                경우&nbsp;“몰”은 회원자격을
                                상실시킬 수 있습니다.
                                <br>④&nbsp;“몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다.&nbsp;이 경우 회원에게 이를 통지하고,&nbsp;회원등록 말소 전에
                                최소한&nbsp;30일
                                이상의 기간을 정하여
                                소명할 기회를 부여합니다.
                                <br>제8조(회원에 대한 통지)
                                <br>①&nbsp;“몰”이 회원에 대한 통지를 하는 경우,&nbsp;회원이&nbsp;“몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
                                <br>②&nbsp;“몰”은 불특정다수 회원에 대한 통지의 경우&nbsp;1주일이상&nbsp;“몰”&nbsp;게시판에 게시함으로서 개별 통지에 갈음할 수
                                있습니다.&nbsp;다만,&nbsp;회원 본인의
                                거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
                                <br>제9조(구매신청 및 개인정보 제공 동의 등)
                                <br>①&nbsp;“몰”이용자는&nbsp;“몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의
                                각
                                내용을 알기 쉽게
                                제공하여야 합니다.
                                <br>&nbsp; 1.&nbsp;재화 등의 검색 및 선택
                                <br>&nbsp; 2.&nbsp;받는 사람의 성명,&nbsp;주소,&nbsp;전화번호,&nbsp;전자우편주소(또는 이동전화번호)&nbsp;등의 입력
                                <br>&nbsp; 3.&nbsp;약관내용,&nbsp;청약철회권이 제한되는 서비스,&nbsp;배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인
                                <br>&nbsp; 4.&nbsp;이 약관에 동의하고 위&nbsp;3.호의 사항을 확인하거나 거부하는 표시
                                <br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (예,&nbsp;마우스 클릭)
                                <br>&nbsp; 5.&nbsp;재화등의 구매신청 및 이에 관한 확인 또는&nbsp;“몰”의 확인에 대한 동의
                                <br>&nbsp; 6.&nbsp;결제방법의 선택
                                <br>②&nbsp;“몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우&nbsp;1)&nbsp;개인정보를 제공받는 자, 2)개인정보를 제공받는 자의
                                개인정보 이용목적,
                                3)&nbsp;제공하는
                                개인정보의 항목, 4)&nbsp;개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는
                                경우에도
                                같습니다.)
                                <br>③&nbsp;“몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는&nbsp;1)&nbsp;개인정보 취급위탁을 받는 자,
                                2)&nbsp;개인정보
                                취급위탁을 하는 업무의
                                내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)&nbsp;다만,&nbsp;서비스제공에 관한 계약이행을 위해
                                필요하고 구매자의
                                편의증진과 관련된
                                경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도
                                됩니다.
                                <br>제10조&nbsp;(계약의 성립)
                                <br>①&nbsp; “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다.&nbsp;다만,&nbsp;미성년자와 계약을
                                체결하는
                                경우에는
                                법정대리인의 동의를 얻지
                                못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
                                <br>1.&nbsp;신청 내용에 허위,&nbsp;기재누락,&nbsp;오기가 있는 경우
                                <br>2.&nbsp;미성년자가 담배,&nbsp;주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
                                <br>3.&nbsp;기타 구매신청에 승낙하는 것이&nbsp;“몰”&nbsp;기술상 현저히 지장이 있다고 판단하는 경우
                                <br>②&nbsp;“몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
                                <br>③&nbsp;“몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부,&nbsp;구매신청의 정정 취소 등에 관한 정보 등을
                                포함하여야
                                합니다.
                                <br>제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다.&nbsp;단,
                                “몰”은
                                이용자의 지급방법에
                                대하여 재화 등의
                                대금에 어떠한 명목의 수수료도&nbsp;&nbsp;추가하여 징수할 수 없습니다.
                                <br>1.&nbsp;폰뱅킹,&nbsp;인터넷뱅킹,&nbsp;메일 뱅킹 등의 각종 계좌이체
                                <br>2.&nbsp;선불카드,&nbsp;직불카드,&nbsp;신용카드 등의 각종 카드 결제
                                <br>3.&nbsp;온라인무통장입금
                                <br>4.&nbsp;전자화폐에 의한 결제
                                <br>5.&nbsp;수령 시 대금지급
                                <br>6.&nbsp;마일리지 등&nbsp;“몰”이 지급한 포인트에 의한 결제
                                <br>7. “몰”과 계약을 맺었거나&nbsp;“몰”이 인정한 상품권에 의한 결제&nbsp;&nbsp;
                                <br>8.&nbsp;기타 전자적 지급 방법에 의한 대금 지급 등
                                <br>제12조(수신확인통지․구매신청 변경 및 취소)
                                <br>①&nbsp;“몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
                                <br>② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수
                                있고&nbsp;“몰”은
                                배송 전에
                                이용자의 요청이 있는
                                경우에는 지체 없이 그 요청에 따라 처리하여야 합니다.&nbsp;다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.
                                <br>제13조(재화 등의 공급)
                                <br>①&nbsp;“몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상,&nbsp;이용자가 청약을 한 날부터&nbsp;7일 이내에 재화
                                등을
                                배송할 수 있도록
                                주문제작,&nbsp;포장 등 기타의 필요한 조치를 취합니다.&nbsp;다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는
                                일부를
                                받은
                                날부터&nbsp;3영업일
                                이내에 조치를 취합니다. &nbsp;이때&nbsp;“몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
                                <br>②&nbsp;“몰”은 이용자가 구매한 재화에 대해 배송수단,&nbsp;수단별 배송비용 부담자,&nbsp;수단별 배송기간 등을
                                명시합니다.&nbsp;만약&nbsp;“몰”이
                                약정 배송기간을 초과한
                                경우에는 그로 인한 이용자의 손해를 배상하여야 합니다.&nbsp;다만&nbsp;“몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.
                                <br>제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고
                                사전에
                                재화 등의
                                대금을 받은 경우에는
                                대금을 받은 날부터&nbsp;3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
                                <br>제15조(청약철회 등)
                                <br>①&nbsp;“몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한
                                서면을
                                받은 날(그
                                서면을 받은 때보다
                                재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터&nbsp;7일 이내에는 청약의 철회를 할 수
                                있습니다.&nbsp;다만,&nbsp;청약철회에
                                관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.
                                <br>② 이용자는 재화 등을 배송 받은 경우 다음 각 호의&nbsp;1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
                                <br>1.&nbsp;이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만,&nbsp;재화 등의 내용을 확인하기 위하여 포장 등을 훼손한
                                경우에는
                                청약철회를 할 수
                                있습니다)
                                <br>2.&nbsp;이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
                                <br>3.&nbsp;시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
                                <br>4.&nbsp;같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
                                <br>③ 제2항제2호 내지 제4호의 경우에&nbsp;“몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을
                                제공하는
                                등의 조치를 하지
                                않았다면 이용자의
                                청약철회 등이 제한되지 않습니다.
                                <br>④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은
                                날부터
                                3월
                                이내,&nbsp;그 사실을 안
                                날 또는 알 수 있었던 날부터&nbsp;30일 이내에 청약철회 등을 할 수 있습니다.
                                <br>제16조(청약철회 등의 효과)
                                <br>①&nbsp;“몰”은 이용자로부터 재화 등을 반환받은 경우&nbsp;3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다.&nbsp;이
                                경우&nbsp;“몰”이
                                이용자에게 재화등의 환급을
                                지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
                                <br>②&nbsp;“몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해
                                결제수단을
                                제공한 사업자로
                                하여금 재화 등의
                                대금의 청구를 정지 또는 취소하도록 요청합니다.
                                <br>③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을
                                청구하지
                                않습니다.&nbsp;다만 재화 등의
                                내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은&nbsp;“몰”이 부담합니다.
                                <br>④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에&nbsp;“몰”은 청약철회 시 그 비용을&nbsp;&nbsp;누가 부담하는지를 이용자가 알기
                                쉽도록
                                명확하게
                                표시합니다.
                                <br>제17조(개인정보보호)
                                <br>①&nbsp;“몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
                                <br>②&nbsp;“몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다.&nbsp;다만,&nbsp;관련 법령상 의무이행을 위하여 구매계약
                                이전에
                                본인확인이
                                필요한 경우로서 최소한의
                                특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.
                                <br>③&nbsp;“몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.
                                <br>④&nbsp;“몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며,&nbsp;새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는
                                이용·제공단계에서 당해
                                이용자에게 그 목적을
                                고지하고 동의를 받습니다.&nbsp;다만,&nbsp;관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
                                <br>⑤&nbsp;“몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속,&nbsp;성명 및
                                전화번호,&nbsp;기타
                                연락처),&nbsp;정보의 수집목적
                                및 이용목적,&nbsp;제3자에 대한 정보제공 관련사항(제공받은자,&nbsp;제공목적 및 제공할 정보의 내용)&nbsp;등 「정보통신망 이용촉진 및 정보보호
                                등에
                                관한 법률」
                                제22조제2항이 규정한
                                사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
                                <br>⑥ 이용자는 언제든지&nbsp;“몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며&nbsp;“몰”은 이에 대해 지체 없이
                                필요한
                                조치를 취할
                                의무를
                                집니다.&nbsp;이용자가 오류의 정정을 요구한 경우에는&nbsp;“몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                                <br>⑦&nbsp;“몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를&nbsp;&nbsp;최소한으로 제한하여야 하며
                                신용카드,&nbsp;은행계좌 등을
                                포함한
                                이용자의 개인정보의
                                분실,&nbsp;도난,&nbsp;유출,&nbsp;동의 없는 제3자 제공,&nbsp;변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
                                <br>⑧&nbsp;“몰”&nbsp;또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체
                                없이
                                파기합니다.
                                <br>⑨&nbsp;“몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다.&nbsp;또한 개인정보의 수집·이용·제공에
                                관한
                                이용자의
                                동의거절시 제한되는 서비스를
                                구체적으로 명시하고,&nbsp;필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지
                                않습니다.
                                <br>제18조(“몰“의 의무)
                                <br>①&nbsp;“몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고,&nbsp;안정적으로
                                재화․용역을 제공하는데
                                최선을 다하여야
                                합니다.
                                <br>②&nbsp;“몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
                                <br>③&nbsp;“몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은
                                때에는
                                이를 배상할
                                책임을 집니다.
                                <br>④&nbsp;“몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
                                <br>제19조(회원의&nbsp;ID&nbsp;및 비밀번호에 대한 의무)
                                <br>① 제17조의 경우를 제외한&nbsp;ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
                                <br>② 회원은 자신의&nbsp;ID&nbsp;및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
                                <br>③ 회원이 자신의&nbsp;ID&nbsp;및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로&nbsp;“몰”에
                                통보하고&nbsp;“몰”의
                                안내가 있는
                                경우에는 그에 따라야
                                합니다.
                                <br>제20조(이용자의 의무)&nbsp;이용자는 다음 행위를 하여서는 안 됩니다.
                                <br>1.&nbsp;신청 또는 변경시 허위 내용의 등록
                                <br>2.&nbsp;타인의 정보 도용
                                <br>3. “몰”에 게시된 정보의 변경
                                <br>4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등)&nbsp;등의 송신 또는 게시
                                <br>5. “몰”&nbsp;기타 제3자의 저작권 등 지적재산권에 대한 침해
                                <br>6. “몰”&nbsp;기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
                                <br>7.&nbsp;외설 또는 폭력적인 메시지,&nbsp;화상,&nbsp;음성,&nbsp;기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
                                <br>제21조(연결“몰”과 피연결“몰”&nbsp;간의 관계)
                                <br>① 상위&nbsp;“몰”과 하위&nbsp;“몰”이 하이퍼링크(예:&nbsp;하이퍼링크의 대상에는 문자,&nbsp;그림 및 동화상 등이 포함됨)방식
                                등으로
                                연결된
                                경우,&nbsp;전자를 연결
                                “몰”(웹 사이트)이라고 하고 후자를 피연결&nbsp;“몰”(웹사이트)이라고 합니다.
                                <br>② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면
                                또는
                                연결되는 시점의
                                팝업화면으로 명시한
                                경우에는 그 거래에 대한 보증 책임을 지지 않습니다.
                                <br>제22조(저작권의 귀속 및 이용제한)
                                <br>①&nbsp;“몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은&nbsp;”몰“에 귀속합니다.
                                <br>② 이용자는&nbsp;“몰”을 이용함으로써 얻은 정보 중&nbsp;“몰”에게 지적재산권이 귀속된 정보를&nbsp;“몰”의 사전 승낙 없이
                                복제,&nbsp;송신,&nbsp;출판,&nbsp;배포,&nbsp;방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
                                <br>③&nbsp;“몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
                                <br>제23조(분쟁해결)
                                <br>①&nbsp;“몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.
                                <br>②&nbsp;“몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다.&nbsp;다만,&nbsp;신속한 처리가 곤란한 경우에는
                                이용자에게 그 사유와
                                처리일정을 즉시
                                통보해 드립니다.
                                <br>③&nbsp;“몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는
                                분쟁조정기관의 조정에 따를
                                수 있습니다.
                                <br>제24조(재판권 및 준거법)
                                <br>①&nbsp;“몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고,&nbsp;주소가 없는 경우에는 거소를
                                관할하는
                                지방법원의
                                전속관할로
                                합니다.&nbsp;다만,&nbsp;제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
                                <br>②&nbsp;“몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다. &nbsp; &nbsp;2.&nbsp;등록 내용에
                                허위,&nbsp;기재누락,&nbsp;오기가 있는 경우
                                <br>&nbsp; &nbsp; 3.&nbsp;기타 회원으로 등록하는 것이&nbsp;“몰”의 기술상 현저히 지장이 있다고 판단되는 경우
                                <br>&nbsp; ③&nbsp;회원가입계약의 성립 시기는&nbsp;“몰”의 승낙이 회원에게 도달한 시점으로 합니다.
                                <br>&nbsp; ④&nbsp;회원은 회원가입 시 등록한 사항에 변경이 있는 경우,&nbsp;상당한 기간 이내에&nbsp;“몰”에 대하여 회원정보 수정 등의
                                방법으로 그
                                변경사항을 알려야 합니다.
                                <br>제7조(회원 탈퇴 및 자격 상실 등)
                                <br>&nbsp; ①&nbsp;회원은&nbsp;“몰”에 언제든지 탈퇴를 요청할 수 있으며&nbsp;“몰”은 즉시 회원탈퇴를 처리합니다.
                                <br>&nbsp; ②&nbsp;회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
                                <br>&nbsp; &nbsp; 1.&nbsp;가입 신청 시에 허위 내용을 등록한 경우
                                <br>&nbsp; &nbsp; 2. “몰”을 이용하여 구입한 재화 등의 대금,&nbsp;기타&nbsp;“몰”이용에 관련하여 회원이 부담하는 채무를 기일에
                                지급하지
                                않는 경우
                                <br>&nbsp; &nbsp; 3.&nbsp;다른 사람의&nbsp;“몰”&nbsp;이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
                                <br>&nbsp; &nbsp; 4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
                                <br>&nbsp; ③ “몰”이 회원 자격을 제한․정지 시킨 후,&nbsp;동일한 행위가&nbsp;2회 이상 반복되거나&nbsp;30일 이내에 그 사유가
                                시정되지
                                아니하는
                                경우&nbsp;“몰”은
                                회원자격을 상실시킬 수 있습니다.
                                <br>&nbsp; ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다.&nbsp;이 경우 회원에게 이를 통지하고,&nbsp;회원등록 말소 전에
                                최소한&nbsp;30일
                                이상의 기간을 정하여
                                소명할 기회를 부여합니다.
                                <br>제8조(회원에 대한 통지)
                                <br>&nbsp; ① “몰”이 회원에 대한 통지를 하는 경우,&nbsp;회원이&nbsp;“몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
                                <br>&nbsp; ② “몰”은 불특정다수 회원에 대한 통지의 경우&nbsp;1주일이상&nbsp;“몰”&nbsp;게시판에 게시함으로서 개별 통지에 갈음할 수
                                있습니다.&nbsp;다만,&nbsp;회원
                                본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
                                <br>제9조(구매신청 및 개인정보 제공 동의 등)
                                <br>&nbsp; ① “몰”이용자는&nbsp;“몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서
                                다음의 각
                                내용을 알기
                                쉽게 제공하여야
                                합니다.
                                <br>&nbsp; &nbsp; &nbsp; &nbsp;1.&nbsp;재화 등의 검색 및 선택
                                <br>&nbsp; &nbsp; &nbsp; &nbsp;2.&nbsp;받는 사람의 성명,&nbsp;주소,&nbsp;전화번호,&nbsp;전자우편주소(또는
                                이동전화번호)&nbsp;등의
                                입력
                                <br>&nbsp; &nbsp; &nbsp; &nbsp;3.&nbsp;약관내용,&nbsp;청약철회권이 제한되는 서비스,&nbsp;배송료․설치비 등의 비용부담과
                                관련한
                                내용에 대한
                                확인
                                <br>&nbsp; &nbsp; &nbsp; &nbsp;4.&nbsp;이 약관에 동의하고 위&nbsp;3.호의 사항을 확인하거나 거부하는 표시
                                <br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (예,&nbsp;마우스 클릭)
                                <br>&nbsp; &nbsp; &nbsp; &nbsp;5.&nbsp;재화등의 구매신청 및 이에 관한 확인 또는&nbsp;“몰”의 확인에 대한 동의
                                <br>&nbsp; &nbsp; &nbsp; &nbsp;6.&nbsp;결제방법의 선택
                                <br>&nbsp; ② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우&nbsp;1)&nbsp;개인정보를 제공받는 자, 2)개인정보를 제공받는
                                자의
                                개인정보
                                이용목적,
                                3)&nbsp;제공하는 개인정보의 항목, 4)&nbsp;개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를
                                받은
                                사항이 변경되는
                                경우에도 같습니다.)
                                <br>&nbsp; ③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는&nbsp;1)&nbsp;개인정보 취급위탁을 받는 자,
                                2)&nbsp;개인정보 취급위탁을 하는
                                업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)&nbsp;다만,&nbsp;서비스제공에 관한
                                계약이행을 위해
                                필요하고
                                구매자의 편의증진과 관련된
                                경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도
                                됩니다.
                                <br>제10조&nbsp;(계약의 성립)
                                <br>&nbsp; &nbsp;① &nbsp;“몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수
                                있습니다.&nbsp;다만,&nbsp;미성년자와 계약을
                                체결하는 경우에는
                                법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
                                <br>&nbsp; &nbsp; 1.&nbsp;신청 내용에 허위,&nbsp;기재누락,&nbsp;오기가 있는 경우
                                <br>&nbsp; &nbsp; 2.&nbsp;미성년자가 담배,&nbsp;주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
                                <br>&nbsp; &nbsp; 3.&nbsp;기타 구매신청에 승낙하는 것이&nbsp;“몰”&nbsp;기술상 현저히 지장이 있다고 판단하는 경우
                                <br>&nbsp; ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
                                <br>&nbsp; ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부,&nbsp;구매신청의 정정 취소 등에 관한 정보 등을
                                포함하여야
                                합니다.
                                <br>제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다.&nbsp;단,
                                “몰”은
                                이용자의 지급방법에
                                대하여 재화 등의
                                대금에 어떠한 명목의 수수료도&nbsp;&nbsp;추가하여 징수할 수 없습니다.
                                <br>&nbsp; &nbsp; 1.&nbsp;폰뱅킹,&nbsp;인터넷뱅킹,&nbsp;메일 뱅킹 등의 각종 계좌이체
                                <br>&nbsp; &nbsp; 2.&nbsp;선불카드,&nbsp;직불카드,&nbsp;신용카드 등의 각종 카드 결제
                                <br>&nbsp; &nbsp; 3.&nbsp;온라인무통장입금
                                <br>&nbsp; &nbsp; 4.&nbsp;전자화폐에 의한 결제
                                <br>&nbsp; &nbsp; 5.&nbsp;수령 시 대금지급
                                <br>&nbsp; &nbsp; 6.&nbsp;마일리지 등&nbsp;“몰”이 지급한 포인트에 의한 결제
                                <br>&nbsp; &nbsp; 7. “몰”과 계약을 맺었거나&nbsp;“몰”이 인정한 상품권에 의한 결제&nbsp;&nbsp;
                                <br>&nbsp; &nbsp; 8.&nbsp;기타 전자적 지급 방법에 의한 대금 지급 등
                                <br>제12조(수신확인통지․구매신청 변경 및 취소)
                                <br>&nbsp; ① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
                                <br>&nbsp; ②&nbsp;수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할
                                수
                                있고&nbsp;“몰”은 배송 전에
                                이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다.&nbsp;다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에
                                따릅니다.
                                <br>제13조(재화 등의 공급)
                                <br>&nbsp; ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상,&nbsp;이용자가 청약을 한 날부터&nbsp;7일 이내에 재화
                                등을
                                배송할 수
                                있도록
                                주문제작,&nbsp;포장 등 기타의 필요한 조치를 취합니다.&nbsp;다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는
                                일부를
                                받은
                                날부터&nbsp;3영업일
                                이내에 조치를 취합니다. &nbsp;이때&nbsp;“몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
                                <br>&nbsp; ② “몰”은 이용자가 구매한 재화에 대해 배송수단,&nbsp;수단별 배송비용 부담자,&nbsp;수단별 배송기간 등을
                                명시합니다.&nbsp;만약&nbsp;“몰”이
                                약정 배송기간을
                                초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다.&nbsp;다만&nbsp;“몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.
                                <br>제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고
                                사전에
                                재화 등의
                                대금을 받은 경우에는
                                대금을 받은 날부터&nbsp;3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
                                <br>제15조(청약철회 등)
                                <br>&nbsp; ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에
                                관한
                                서면을 받은
                                날(그 서면을 받은 때보다
                                재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터&nbsp;7일 이내에는 청약의 철회를 할 수
                                있습니다.&nbsp;다만,&nbsp;청약철회에
                                관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.
                                <br>&nbsp; ②&nbsp;이용자는 재화 등을 배송 받은 경우 다음 각 호의&nbsp;1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
                                <br>&nbsp; &nbsp; 1.&nbsp;이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만,&nbsp;재화 등의 내용을 확인하기 위하여
                                포장
                                등을 훼손한
                                경우에는 청약철회를 할
                                수 있습니다)
                                <br>&nbsp; &nbsp; 2.&nbsp;이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
                                <br>&nbsp; &nbsp; 3.&nbsp;시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
                                <br>&nbsp; &nbsp; 4.&nbsp;같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
                                <br>&nbsp; ③&nbsp;제2항제2호 내지 제4호의 경우에&nbsp;“몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에
                                명기하거나
                                시용상품을
                                제공하는 등의 조치를 하지
                                않았다면 이용자의 청약철회 등이 제한되지 않습니다.
                                <br>&nbsp; ④&nbsp;이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해
                                재화
                                등을 공급받은
                                날부터&nbsp;3월
                                이내,&nbsp;그 사실을 안 날 또는 알 수 있었던 날부터&nbsp;30일 이내에 청약철회 등을 할 수 있습니다.
                                <br>제16조(청약철회 등의 효과)
                                <br>&nbsp; ① “몰”은 이용자로부터 재화 등을 반환받은 경우&nbsp;3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다.&nbsp;이
                                경우&nbsp;“몰”이
                                이용자에게 재화등의 환급을
                                지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
                                <br>&nbsp; ② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해
                                결제수단을 제공한
                                사업자로 하여금 재화 등의
                                대금의 청구를 정지 또는 취소하도록 요청합니다.
                                <br>&nbsp; ③&nbsp;청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로
                                위약금
                                또는 손해배상을
                                청구하지
                                않습니다.&nbsp;다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한
                                비용은&nbsp;“몰”이
                                부담합니다.
                                <br>&nbsp; ④&nbsp;이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에&nbsp;“몰”은 청약철회 시 그 비용을&nbsp;&nbsp;누가
                                부담하는지를
                                이용자가 알기
                                쉽도록 명확하게
                                표시합니다.
                                <br>제17조(개인정보보호)
                                <br>&nbsp; ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
                                <br>&nbsp; ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다.&nbsp;다만,&nbsp;관련 법령상 의무이행을 위하여
                                구매계약
                                이전에 본인확인이
                                필요한 경우로서
                                최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.
                                <br>&nbsp; ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.
                                <br>&nbsp; ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며,&nbsp;새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는
                                이용·제공단계에서
                                당해 이용자에게 그
                                목적을 고지하고 동의를 받습니다.&nbsp;다만,&nbsp;관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
                                <br>&nbsp; ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속,&nbsp;성명 및
                                전화번호,&nbsp;기타
                                연락처),&nbsp;정보의
                                수집목적 및 이용목적,&nbsp;제3자에 대한 정보제공 관련사항(제공받은자,&nbsp;제공목적 및 제공할 정보의 내용)&nbsp;등 「정보통신망 이용촉진 및
                                정보보호
                                등에 관한
                                법률」 제22조제2항이
                                규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
                                <br>&nbsp; ⑥&nbsp;이용자는 언제든지&nbsp;“몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며&nbsp;“몰”은
                                이에
                                대해 지체 없이
                                필요한 조치를 취할
                                의무를 집니다.&nbsp;이용자가 오류의 정정을 요구한 경우에는&nbsp;“몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                                <br>&nbsp; ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를&nbsp;&nbsp;최소한으로 제한하여야 하며
                                신용카드,&nbsp;은행계좌
                                등을 포함한
                                이용자의 개인정보의
                                분실,&nbsp;도난,&nbsp;유출,&nbsp;동의 없는 제3자 제공,&nbsp;변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
                                <br>&nbsp; ⑧ “몰”&nbsp;또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체
                                없이
                                파기합니다.
                                <br>&nbsp; ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다.&nbsp;또한 개인정보의
                                수집·이용·제공에 관한
                                이용자의
                                동의거절시 제한되는
                                서비스를 구체적으로 명시하고,&nbsp;필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나
                                거절하지 않습니다.
                                <br>제18조(“몰“의 의무)
                                <br>&nbsp; ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고,&nbsp;안정적으로
                                재화․용역을
                                제공하는데 최선을 다하여야
                                합니다.
                                <br>&nbsp; ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야
                                합니다.
                                <br>&nbsp; ③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은
                                때에는
                                이를 배상할
                                책임을 집니다.
                                <br>&nbsp; ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
                                <br>제19조(회원의&nbsp;ID&nbsp;및 비밀번호에 대한 의무)
                                <br>&nbsp; ①&nbsp;제17조의 경우를 제외한&nbsp;ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
                                <br>&nbsp; ②&nbsp;회원은 자신의&nbsp;ID&nbsp;및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
                                <br>&nbsp; ③&nbsp;회원이 자신의 ID&nbsp;및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로&nbsp;“몰”에
                                통보하고&nbsp;“몰”의
                                안내가 있는 경우에는
                                그에 따라야 합니다.
                                <br>제20조(이용자의 의무)&nbsp;이용자는 다음 행위를 하여서는 안 됩니다.
                                <br>&nbsp; &nbsp; 1.&nbsp;신청 또는 변경시 허위 내용의 등록
                                <br>&nbsp; &nbsp; 2.&nbsp;타인의 정보 도용
                                <br>&nbsp; &nbsp; 3. “몰”에 게시된 정보의 변경
                                <br>&nbsp; &nbsp; 4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등)&nbsp;등의 송신 또는 게시
                                <br>&nbsp; &nbsp; 5. “몰”&nbsp;기타 제3자의 저작권 등 지적재산권에 대한 침해
                                <br>&nbsp; &nbsp; 6. “몰”&nbsp;기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
                                <br>&nbsp; &nbsp; 7.&nbsp;외설 또는 폭력적인 메시지,&nbsp;화상,&nbsp;음성,&nbsp;기타 공서양속에 반하는 정보를 몰에 공개
                                또는
                                게시하는 행위
                                <br>제21조(연결“몰”과 피연결“몰”&nbsp;간의 관계)
                                <br>&nbsp; ①&nbsp;상위&nbsp;“몰”과 하위&nbsp;“몰”이 하이퍼링크(예:&nbsp;하이퍼링크의 대상에는 문자,&nbsp;그림 및 동화상
                                등이
                                포함됨)방식
                                등으로 연결된
                                경우,&nbsp;전자를 연결&nbsp;“몰”(웹 사이트)이라고 하고 후자를 피연결&nbsp;“몰”(웹사이트)이라고 합니다.
                                <br>&nbsp; ②&nbsp;연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을
                                연결“몰”의 초기화면
                                또는 연결되는 시점의
                                팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.
                                <br>제22조(저작권의 귀속 및 이용제한)
                                <br>&nbsp; ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은&nbsp;”몰“에 귀속합니다.
                                <br>&nbsp; ②&nbsp;이용자는&nbsp;“몰”을 이용함으로써 얻은 정보 중&nbsp;“몰”에게 지적재산권이 귀속된 정보를&nbsp;“몰”의 사전
                                승낙 없이
                                복제,&nbsp;송신,&nbsp;출판,&nbsp;배포,&nbsp;방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
                                <br>&nbsp; ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
                                <br>제23조(분쟁해결)
                                <br>&nbsp; ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.
                                <br>&nbsp; ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다.&nbsp;다만,&nbsp;신속한 처리가 곤란한
                                경우에는
                                이용자에게 그
                                사유와 처리일정을 즉시
                                통보해 드립니다.
                                <br>&nbsp; ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는
                                분쟁조정기관의 조정에
                                따를 수 있습니다.
                                <br>제24조(재판권 및 준거법)
                                <br>&nbsp; ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고,&nbsp;주소가 없는 경우에는 거소를
                                관할하는
                                지방법원의
                                전속관할로
                                합니다.&nbsp;다만,&nbsp;제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
                                <br>&nbsp; ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
                            </p>
                        </div>
                        <div class="register_inner">
                            <input type="checkbox" id="privacy" />
                            <label for="privacy">개인정보처리방침에 동의합니다.(필수)</label>
                            <span class="agree_toggle">
                            </span>
                        </div>
                        <div class="register_view">
                            개인정보보호법에 따라 무직타이거에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및
                            동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.<br /> <br />

                            1. 수집하는 개인정보 <br />
                            이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 무직타이거 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그
                            등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 무직타이거는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. <br />

                            회원가입 시점에 무직타이거가 이용자로부터 수집하는 개인정보는 아래와 같습니다. <br />
                            - 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입
                            시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만 14세 미만 아동의 경우, 법정대리인의 동의를 받고 있으며,
                            휴대전화번호 또는 아이핀 인증을 통해 법정대리인의 동의를 확인하고 있습니다. 이 과정에서 법정대리인의 정보(법정대리인의 이름, 중복가입확인정보(DI),
                            휴대전화번호(아이핀 인증인 경우 아이핀번호))를 추가로 수집합니다. <br />
                            - 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다. <br />
                            - 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다. <br />
                            서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다. <br />
                            - 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로
                            자동 입력됩니다. <br />
                            - 무직타이거 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를
                            수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를
                            받습니다. <br /> <br />



                            서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서
                            이미지나 음성이 수집될 수 있습니다.<br />
                            구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하거나 이용자가 입력한 정보를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를
                            원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.<br />
                            서비스 이용 과정에서 위치정보가 수집될 수 있으며,
                            무직타이거에서 제공하는 위치기반 서비스에 대해서는 '무직타이거 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.
                            이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
                            생성정보 수집에 대한 추가 설명<br />
                            - IP(Internet Protocol) 주소란?<br />
                            IP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다. IP 주소가 개인정보에 해당하는지 여부에 대해서는
                            각국마다 매우 다양한 견해가 있습니다.<br />
                            - 서비스 이용기록이란?<br />
                            무직타이거 접속 일시, 이용한 서비스 목록 및 서비스 이용 과정에서 발생하는 정상 또는 비정상 로그 일체,메일 수발신 과정에서 기록되는 이메일주소, 친구 초대하기
                            또는 선물하기 등에서 입력하는 휴대전화번호, 스마트스토어 판매자와 구매자간 상담내역(무직타이거톡톡 및 상품 Q&A 게시글) 등을 의미합니다. 정보주체가 식별되는 일부
                            서비스 이용기록(행태정보 포함)과 관련한 처리 목적 등에 대해서는 본 개인정보 처리방침에서 규정하고 있는 수집하는 개인정보, 수집한 개인정보의 이용, 개인정보의 파기
                            등에서 설명하고 있습니다. 이는 서비스 제공을 위해 수반되는 것으로 이를 거부하시는 경우 서비스 이용에 제한이 있을 수 있으며, 관련하여서는 고객센터로 문의해주시길
                            바랍니다. 이 외에 정보주체를 식별하지 않고 행태정보를 처리하는 경우와 관련하여서는 '무직타이거 맞춤형 광고 안내'에서 확인하실 수 있습니다.
                            - 기기정보란?<br />
                            본 개인정보처리방침에 기재된 기기정보는 생산 및 판매 과정에서 기기에 부여된 정보뿐 아니라, 기기의 구동을 위해 사용되는 S/W를 통해 확인 가능한 정보를 모두
                            일컫습니다. OS(Windows, MAC OS 등) 설치 과정에서 이용자가 PC에 부여하는 컴퓨터의 이름, PC에 장착된 주변기기의 일련번호, 스마트폰의 통신에
                            필요한 고유한 식별값(IMEI, IMSI), AAID 혹은 IDFA, 설정언어 및 설정 표준시, USIM의 통신사 코드 등을 의미합니다. 단, 무직타이거는 IMEI와
                            같은 기기의 고유한 식별값을 수집할 필요가 있는 경우, 이를 수집하기 전에 무직타이거도 원래의 값을 알아볼 수 없는 방식으로 암호화 하여
                            식별성(Identifiability)을 제거한 후에 수집합니다.<br />
                            - 쿠키(cookie)란?<br />
                            쿠키는 이용자가 웹사이트를 접속할 때에 해당 웹사이트에서 이용자의 웹브라우저를 통해 이용자의 PC에 저장하는 매우 작은 크기의 텍스트 파일입니다. 이후 이용자가 다시
                            웹사이트를 방문할 경우 웹사이트 서버는 이용자 PC에 저장된 쿠키의 내용을 읽어 이용자가 설정한 서비스 이용 환경을 유지하여 편리한 인터넷 서비스 이용을 가능케
                            합니다. 또한 방문한 서비스 정보, 서비스 접속 시간 및 빈도, 서비스 이용 과정에서 생성된 또는 제공(입력)한 정보 등을 분석하여 이용자의 취향과 관심에 특화된
                            서비스(광고 포함)를 제공할 수 있습니다. 이용자는 쿠키에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될
                            때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 무직타이거 일부 서비스의 이용에
                            불편이 있을 수 있습니다.<br />

                            <웹 브라우저에서 쿠키 허용/차단 방법><br />
                                - 크롬(Chrome) : 웹 브라우저 설정 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제<br />
                                - 엣지(Edge) : 웹 브라우저 설정 > 쿠키 및 사이트 권한 > 쿠키 및 사이트 데이터 관리 및 삭제<br />

                                <모바일 브라우저에서 쿠키 허용/차단><br />
                                    - 크롬(Chrome) : 모바일 브라우저 설정 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제<br />
                                    - 사파리(Safari) : 모바일 기기 설정 > 사파리(Safari) > 고급 > 모든 쿠키 차단<br />
                                    - 삼성 인터넷 : 모바일 브라우저 설정 > 인터넷 사용 기록 > 인터넷 사용 기록 삭제<br />
                                    쿠키에 관한 자세한 내용(무직타이거 프라이버시 센터) 알아보기<br />

                                    2. 수집한 개인정보의 이용<br />
                                    무직타이거 및 무직타이거 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의
                                    목적으로만 개인정보를 이용합니다.<br />

                                    - 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를
                                    위하여 개인정보를 이용합니다.<br />
                                    - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의
                                    형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. 신규
                                    서비스 요소의 발굴 및 기존 서비스 개선 등에는 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 생성·제공·추천, 상품 쇼핑 등에서의 인공지능(AI)
                                    기술 적용이 포함됩니다.<br />
                                    - 법령 및 무직타이거 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한
                                    방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을
                                    위하여 개인정보를 이용합니다.<br />
                                    - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br />
                                    - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.<br />
                                    - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를
                                    이용합니다.<br />
                                    - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.<br />
                                    3. 개인정보의 보관기간<br />
                                    회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.<br />
                                    단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안
                                    개인정보를 안전하게 보관합니다.<br />
                                    이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.<br />
                                    - 부정 가입 및 이용 방지<br />
                                    부정 이용자의 DI (만 14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관<br />
                                    탈퇴한 이용자의 휴대전화번호(휴대전화 인증 시, 복호화가 불가능한 일방향 암호화(해시)하여 보관), DI(아이핀 인증 시) : 탈퇴일로부터 6개월
                                    보관<br />
                                    - 무직타이거 서비스 제공을 위한 본인 확인<br />
                                    통신사 정보, 휴대전화번호 : 수집 시점으로부터 1년 보관<br />
                                    전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와
                                    같습니다. 무직타이거는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.<br />
                                    - 전자상거래 등에서 소비자 보호에 관한 법률<br />
                                    계약 또는 청약철회 등에 관한 기록: 5년 보관<br />
                                    대금결제 및 재화 등의 공급에 관한 기록: 5년 보관<br />
                                    소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관<br />
                                    - 전자문서 및 전자거래 기본법<br />
                                    공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관<br />
                                    - 통신비밀보호법<br />
                                    로그인 기록: 3개월<br />

                                    4. 개인정보 수집 및 이용 동의를 거부할 권리<br />
                                    이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를
                                    거부하실 경우, 회원가입이 어려울 수 있습니다.<br />

                        </div>
                        <div class="register_inner">
                            <input type="checkbox" id="sms" />
                            <label for="sms">SMS 수신 동의(선택)</label>
                            <span class="agree_toggle">
                            </span>
                        </div>
                        <div class="register_view">
                            <p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS로 받아보실 수 있습니다. 단, 주문/거래 정보 및 주요 정책과
                                관련된
                                내용은
                                수신동의 여부와 관계없이
                                발송됩니다.</p>
                            <p>선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
                        </div>
                        <div class="register_inner">
                            <input type="checkbox" id="email" />
                            <label for="email">이메일 수신 동의(선택)</label>
                            <span class="agree_toggle">
                            </span>
                        </div>
                        <div class="register_view">
                            <p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 이메일로 받아보실 수 있습니다. 단, 주문/거래 정보 및 주요 정책과
                                관련된
                                내용은
                                수신동의 여부와 관계없이
                                발송됩니다.</p>
                            <p>선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
                        </div>
                        <div class="register_btn">
                            <input type="submit" value="회원가입" />
                        </div>
                    </form>
                </div>
        </div>
        <%@ include file="footer.jsp" %>
            <!-- 최종 스크립트 -->
            <script>
                $(document).ready(function () {
                    var isIdChecked = false; // 중복 확인 상태 변수

                    $("#idCheck").click(function () {
                        var id = $("#id").val();
                        $.ajax({
                            url: "/idCheck.do",
                            type: "post",
                            data: {
                                id: id
                            },
                            success: function (data) {
                                if (data == 0) {
                                    alert("사용 가능한 아이디입니다.");
                                    isIdChecked = true; // 중복 확인 완료
                                } else {
                                    alert("이미 사용중인 아이디입니다.");
                                    isIdChecked = false; // 중복 확인 실패
                                }
                            }
                        });
                    });

                    // 폼 제출 시 중복 확인 상태 및 비밀번호 유효성 검사 확인
                    $("form").submit(function (event) {
                        if (!isIdChecked) {
                            alert("아이디 중복 확인을 해주세요.");
                            event.preventDefault(); // 폼 제출 막기
                            return;
                        }

                        if (!checked()) {
                            event.preventDefault(); // 폼 제출 막기
                        }
                    });
                });

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
                    var regExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/; // 비밀번호 정규식
                    // var idRegExp = /^[a-zA-Z0-9]{4,12}$/; // 아이디 정규식

                    if (id == "") {
                        alert("아이디를 입력해주세요.");
                        return false;
                    }

                    if (!regExp.test(pass)) {
                        alert("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자로 입력해주세요.");
                        return false;
                    }

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

                    // 체크박스 동의 여부 확인
                    if (!document.getElementById("terms").checked) {
                        alert("이용약관에 동의해주세요.");
                        return false;
                    }

                    if (!document.getElementById("privacy").checked) {
                        alert("개인정보수집 및 이용에 동의해주세요.");
                        return false;
                    }

                    return true; // 유효성 검사 통과 시 true 반환
                }
            </script>
    </body>

    </html>