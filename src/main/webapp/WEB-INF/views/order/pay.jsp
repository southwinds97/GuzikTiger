<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <!-- HTML 인코딩 설정 -->
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

      <!-- CSS 파일 -->
      <link rel="stylesheet" href="css/jquery-ui.min.css">
      <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/pay.css?v=<?php echo time(); ?>">

      <!-- JS 파일 -->
      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/swiper-bundle.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
      <script src="js/main.js"></script>
    </head>

    <body>
      <header id="header">
        <div class="top_head">
          <h2><a href="/">MUZIKTIGER</a></h2>
          <div class="left_menu">
            <span class="back_btn">
              <a href="/" onclick=""></a>
            </span>
          </div>
          <div class="right_menu">
            <span class="other_btn">
              <a href="/cartList.do" onclick=""></a>
              <span class="count">2</span>
            </span>
            <a href="myPage.do" onclick="" class="person"></a>
          </div>
        </div>
        <div class="title_area">
          <h2>주문/결제</h2>
        </div>
      </header>
      <div class="order_bord"></div>
      <div class="shop_title">
        <div class="delivery">
          <h2>배송지</h2>
        </div>
        <div class="base_table hidden-content">
          <div class=inform>
            <ul>
              <li class="recent_addr">
                <a href="#none">최근 배송지</a>
              </li>
              <li class="direct_input">
                <a href="#none">직접입력</a>
              </li>
            </ul>
            <div class="same_addr">
              <input type="radio" id="same" name="delivery_option" checked />
              <label for="same">회원 정보와 동일</label>
              <input type="radio" id="new" name="delivery_option">
              <label for="new">새로운 배송지</label>
            </div>
            <div class="base_table">
              <div class="rcv_man">
                <label for="receive">받는 사람*</label>
                <input type="text" class="receive" id="orderName">
              </div>
              <!-- 주소와 우편번호가 한 줄에 나란히 배치되도록 변경 -->
              <div class="addr_container">
                <label for="zip">주소*</label>
                <input type="text" readonly name="zip_code" value="" placeholder="우편번호" id="postcode" />
                <button type="button" class="search_btn" onclick="daumPostcode()">주소검색</button>
              </div>
              <!-- 주소검색 API -->
              <script src=" //t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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


              <div class="addr1">
                <input type="text" readonly name="addr" value="" placeholder="기본주소" id="address" class="basic" />
                <input type="text" value="" name="detailaddr" placeholder="나머지 주소" id="detailAddress" />
                
              </div>
              <div class="tel">
                <label for="tel">휴대전화*</label>
                <select class="mobile" name="tel1">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select><span>-</span>
                <input type="text" name="tel2" id="tel2" value="" /><span>-</span>
                <input type="text" name="tel3" id="tel3" />
                <input type="hidden" name="tel" id="tel4" />
                <input type="hidden" name="emailAll" id="emailAll" />
              </div>
              <div class="email">
                <label for="email">이메일*</label>
                <input type="text" id="email">@
                <select class="choose_mail" id="emailSelect">
                  <option value="naver.com" selected="selected">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="yahoo.com">yahoo.com</option>
                  <option value="empas.com">empas.com</option>
                  <option value="korea.com">korea.com</option>
                  <option value="dreamwiz.com">dreamwiz.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="etc">직접입력</option>
                </select>
              </div>
            </div>
            <div class="choose_msg">
              <select class="message_select" id="messageSelect">
                <option value="oMessage-0" selected="selected">-- 메시지 선택 (선택사항) --</option>
                <option value="oMessage-1">배송 전에 미리 연락바랍니다.</option>
                <option value="oMessage-2">부재 시 경비실에 맡겨주세요.</option>
                <option value="oMessage-3">부재 시 문 앞에 놓아주세요.</option>
                <option value="oMessage-4">빠른 배송 부탁드립니다.</option>
                <option value="oMessage-5">택배함에 보관해 주세요.</option>
                <option value="oMessage-input">직접 입력</option>
              </select>
              <div id="customMessageInput" class="direct_msg" style="display: none;">
    			<input type="text" placeholder="메시지를 직접 입력하세요">
  			  </div>
              <div class="save_addr">
                <input type="checkbox" id="save">
                <label for="save">기본 배송지로 저장</label>
              </div>
            </div>
          </div>
        </div>
        <div class="order_bord"></div>
        
       <script>
		  document.getElementById('messageSelect').addEventListener('change', function () {
		    var customInputDiv = document.getElementById('customMessageInput');
		    
		    // '직접 입력'이 선택되면 표시, 아니면 숨김
		    if (this.value === 'oMessage-input') {
		      customInputDiv.style.display = 'block';
		    } else {
		      customInputDiv.style.display = 'none';
		    }
		  });
		</script>
        <script>
          //주문상품정보
          let intlOrder = new Array();
          //결제금액정보
          let paymentInfo = new Array();
          $(document).ready(function () {


            //주문 리스트 스크립트에서 변환 , 
            function fnIntl() {
              let orderArr = new Array();

              <c:forEach items="${orderList}" var="item">
                orderArr.push({product_id : "${item.product_id}"
                , member_id : "${item.member_id}"
                , cart_dtl_id : "${item.cart_dtl_id}"
                , option_id : "${item.option_id}"
                , product_name : "${item.product_name}"
                , price : "${item.price}"
                , idx : "${item.idx}"
                , quantity : "${item.quantity}"
                , option_List :"${item.option_list}"
                , point : "${item.points}"
	    });
              </c:forEach>
              console.log('##주문리스트###', orderArr);

              //전역변수 설정
              intlOrder = orderArr;

              // 주문자정보 셋팅
              Basket.orderMember(orderArr);

              return orderArr;
            }


            //주문금액 정보
            let orderArr = fnIntl();
            paymentInfo = Basket.paymemtSetAmont(orderArr);
            console.log('##결제정보###', paymentInfo);

            //적립금 change event

            $('#usePoint').change(function (e) {
              let usePoint = Number(e.target.value);

              if (usePoint > orderArr[0].point) {
                alert('사용가능 적립금보다 많습니다 적립금 사용금액을 다시 입력해주세요');
                $('#usePoint').val(0);
                let orderArr = fnIntl();
                Basket.finalSetAmount(orderArr, 0);
                return;
              } else {
                let orderArr = fnIntl();
                paymentInfo = Basket.finalSetAmount(orderArr, usePoint);
              }
            });
          });

          //적립금 전액사용 
          function usefullPoint() {
            let usePoint = intlOrder[0].point;
            $('#usePoint').val(usePoint);
            paymentInfo = Basket.finalSetAmount(intlOrder, usePoint);
          }
          // 결제 진행
          function fnPayment() {
            Basket.payProcess(intlOrder, paymentInfo);
          }
        </script>
        <script>

        </script>
        <div class="order_form">
          <h2>주문상품</h2>
          <div class="buy_table">

            <!-- ---------------주문상품 목록 시작------------------------------------- -->
            <c:forEach items="${orderList}" var="row" varStatus="loop">
              <div class="probox2">
                <div class="thumbnail">
                  <a href="">
                    <img src="../images/productList/${row.img_id }" class="tiger">
                  </a>
                </div>
                <div class="description">
                  <a href="" class="proname">${row.product_name}</a>
                  <span class="option">
                    <p>[옵션: 0${row.idx}. ${row.option_id}]</p>
                  </span>
                  <span class="number">
                    <p>수량: ${row.quantity}개</p>
                  </span>
                  <span class="price">
                    <p>${row.quantity*row.price}</p>
                  </span>
                  <script>
                    //상품금액 콤마찍기
                    $(document).ready(function () {
                      $('.price p').each(function () {
                       let price = parseInt($(this).text().replace(/[^0-9]/g, ''));
                       $(this).text(price.toLocaleString() + '원');
                      });
                    });
                  </script>
                </div>
                <button type="button" class="btnRemove" onclick="Basket.productRemove('${row.cart_dtl_id}')"></button>
              </div>
            </c:forEach>
            <!-- ---------------주문상품 목록 끝------------------------------------- -->
            <div class="price_title">
              <h3>배송비</h3>
              <span class="dlprice" id="delvAmout1">
                3,000원
              </span>
            </div>
          </div>
        </div>
        <div class="order_bord"></div>
        <script>

        </script>
        <div class="discount">
          <h2>할인/부가결제</h2>
          <div class="dis_table">
            <div class=dis_detail>
              <h3>자동&nbsp할인</h3>
              <span class="dis_price" id="productDscount1">
                890원
              </span>
            </div>

            <div class="membership">
              <h3>적립금</h3>
              <input type="text" class="member_money" id="usePoint" value=0>
              <button type="button" class="use_btn" onclick="usefullPoint('${item.points}')">전액 사용</button>
            </div>
            <div class="balance">
              <span class="summary">보유&nbsp잔액
                <span class="txtem" id="points">0원</span>
                <script>
                  $(document).ready(function () {
                    let point = parseInt($('#points').text().replace(/[^0-9]/g, ''));
                    $('#points').text(point.toLocaleString() + '원');
                  });
                </script>
              </span>
            </div>
            <div class="expand">
              <div class="moneywrap">
                <p class="buy">1회 구매시 적립금 최대 사용금액은 3,000원입니다.</p>
                <p>최소 적립금 0원 이상일 때 사용 가능합니다.</p>
                <p>최대 사용금액은 제한이 없습니다.</p>
                <p>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</p>
              </div>
            </div>
            <div class="totalpay">
              <h3>적용금액</h3>
              <div class="txtem" id="totalDiscount1">-890원</div>
            </div>
          </div>
          <div class="order_bord"></div>
          <script>

          </script>
        </div>
        <div class="payinfo">
          <h2>결제정보</h2>
          <div class="info_table">
            <div class="sagment">
              <h3>주문상품</h3>
              <span class="order_price" id="totalProductPrice">
                23,900원
              </span>
            </div>
            <div class="sagment">
              <h3>배송비</h3>
              <span class="order_price" id="delvAmout2">
                +3,000원
              </span>
            </div>
            <div class="sagment">
              <h3>할인/부가결제</h3>
              <span class="more_price" id="totalDiscount2">
                -890원
              </span>
            </div>
            <div class="dis_basic">
              <h3><i></i>기본 할인</h3>
              <span class="basic_price" id="productDscount2">
                -890원
              </span>
            </div>
            <div class="dis_basic">
              <h3><i></i>적립금</h3>
              <span class="basic_price" id="usedPoint">
                0원
              </span>
            </div>
            <div class="payment">
              <h3>최종 결제 금액</h3>
              <span class="order_price" id="totalPaymentAmount">
                26,010원
              </span>
            </div>
          </div>
          <div class="order_bord"></div>
          <script>

          </script>
        </div>
        <div class="paymethod">
          <h2>결제수단</h2>
          <div class="mt_table">
            <div class="paychoice">
              <h3>결제수단 선택</h3>
            </div>
            <div class="payinner">
              <div class="cardpay" id="cardpay">
                <img src="images/common/ico_card.png">
              </div>
              <div class="deposit" id="deposit">
                <img src="images/common/ico_bank.png">
              </div>
            </div>
            <div class="paycard">
              <div class="more_card">
                <label for="card">카드선택</label>
                <select class="cardSelect">
                  <option value="" selected="selected">선택해주세요.</option>
                  <option value="card_16">삼성카드</option>
                  <option value="card_12">신한카드</option>
                  <option value="card_01">KB국민카드</option>
                  <option value="card_17">현대카드</option>
                  <option value="card_04">비씨카드</option>
                  <option value="card_19">NH카드</option>
                  <option value="card_08">전북카드</option>
                  <option value="card_05">하나카드</option>
                  <option value="card_15">광주카드</option>
                  <option value="card_18">롯데카드</option>
                  <option value="card_06">우리카드</option>
                  <option value="card_09">씨티카드</option>
                </select>
              </div>
              <div class="period">
                <label for="installment">할부기간</label>
                <select class="cardone" disabled="">
                  <option value="0">일시불</option>
                </select></br>
                <span class="basehelp">법인카드는 무이자 할부 적용이 되지 않습니다.</span>
              </div>
              <div class="period">
                <label for="card">결제안내</label>
                <button type="button" class="certi">공인인증서 발급안내</button>
                <button type="button" class="click">안심클릭 안내</button>
                <button type="button" class="isp">안전결제(ISP)안내</button>
              </div>
              <span class="more_letter">-소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span>
              <div class="nextuse">
                <input type="checkbox" id="savearea" name="use">
                <label for="savearea" name="use">결제수단과 입력정보를 다음에도 사용</label>
              </div>
            </div>
            <div class="paybank">
              <div class="deposit1">
                <label for="bank">입금은행*</label>
                <select class="bankaccount" name="bankaccount">
                  <option value="-1">::: 선택해 주세요. :::</option>
                  <option value="">하나은행 34791002336804 주식회사 스튜디오무직</option>
                </select>
              </div>
              <div class="deposit2">
                <label for="name">입금자명*</label>
                <input type="text" class="txt_name">
              </div>
              <div class="deposit3">
                <h3>현금영수증</h3>
                <input type="radio" id="cashreceipt_regist" name="cash">
                <label for="cashreceipt_regist">현금영수증 신청</label>
                <input type="radio" id="cashreceipt_regist1" name="cash">
                <label for="cashreceipt_regist1">신청 안함</label>
              </div>
              <div class="deposit4">
                <input type="radio" id="personal" name="people" checked>
                <label for="personal">개인</label>
                <div class="tel">
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
                </div>
                <div class="nextuse">
                  <input type="checkbox" id="savearea2" name="use">
                  <label for="savearea2" name="use">결제수단과 입력정보를 다음에도 사용</label>
                </div>
              </div>
            </div>
            <script>
              // 카드 결제 버튼과 계좌 이체 버튼 선택
              const cardpayButton = document.querySelector('.cardpay');
              const depositButton = document.querySelector('.deposit');
              const paycard = document.querySelector('.paycard');
              const paybank = document.querySelector('.paybank');

              // 카드 결제 버튼 클릭 시
              cardpayButton.addEventListener('click', function () {
                depositButton.classList.remove('pay_active');
                cardpayButton.classList.add('pay_active');
                paycard.style.display = 'flex';
                paybank.style.display = 'none';
              });

              // 계좌 이체 버튼 클릭 시
              depositButton.addEventListener('click', function () {
                cardpayButton.classList.remove('pay_active');
                depositButton.classList.add('pay_active');
                paybank.style.display = 'flex';
                paycard.style.display = 'none';
              });

              // 페이지 로드 시 cardpay 버튼 클릭 상태로 설정
              window.onload = function () {
                cardpayButton.classList.add('pay_active'); // 카드 결제 버튼 활성화
                paycard.style.display = 'flex'; // paycard 보이게
                paybank.style.display = 'none'; // paybank 숨기기
              };
            </script>
          </div>
        </div>
        <div class="order_bord"></div>
        <script>
          $(document).ready(function () {
            $('.paymethod').click(function () {
              // 'active' 클래스 토글
              $(this).toggleClass('active');

              // 클릭된 .paymethod의 다음 형제 중 .mt_table만 숨기거나 보이게 처리
              $('.mt_table').toggleClass('hidden-content');
            });
          });
        </script>
        <div class="earn">
          <h2>적립 혜택</h2>
          <div class="sagment">
            <h3>상품별 적립금</h3>
            <span class="order_price" id="productSavePoint">
              1,200원
            </span>
          </div>
          <div class="sagment">
            <h3>회원 적립금</h3>
            <span class="order_price">
              0원
            </span>
          </div>
          <div class="sagment">
            <h3>쿠폰 적립금</h3>
            <span class="order_price">
              0원
            </span>
          </div>
        </div>
        <div class="totalpay2">
          <h3>적립&nbsp예정금액</h3>
          <div class="txtem" id="expectSavePoint">1,200원</div>
        </div>
        <div class="order_bord"></div>
        <div class="agree">
          <div class="all_agr">
            <input type="checkbox" id="allagree" name="agree">
            <label for="allagree">모든 약관 동의</label>
          </div>
          <div class="service">
            <input type="checkbox" id="needagree" name="agree1">
            <label for="needagree">[필수] 결제대행서비스 약관 동의</label>
          </div>
        </div>
        <button type="button" class="paybtn" onclick="fnPayment()">
          <span class="price_view" id="paySubmit">
            26,900원 결제하기
          </span></button>
        <div class="helparea">
          <span class="typedash">
            <p>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.
              무이자할부를 원하시는 경우</br> 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</p>
            <p>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
          </span>
        </div>
      </div>
      <!-- 모든 약관 동의 눌렀을때 둘다 체크 -->
      <script>
        document.getElementById('allagree').addEventListener('change', function () {
          var isChecked = this.checked;
          document.getElementById('needagree').checked = isChecked;
        });
      </script>
    </body>

    </html>