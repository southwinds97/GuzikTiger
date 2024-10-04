<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <meta property="og:image" content="https://contents.sixshop.com/uploadedFiles/56465/default/image_1710376929430.png">
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
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
</head>
<body>
  <header id="header">
    <div class="top_head">
      <h2><a href="#">MUZIKTIGER</a></h2>
      <div class="left_menu">
        <span class="back_btn">
          <a href="#none" onclick=""></a>  
        </span>
      </div>
      <div class="right_menu">
        <span class="other_btn">
          <a href="#none" onclick=""></a>
          <span class="count">2</span>
        </span>
        <a href="#none" onclick="" class="person"></a>    
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
    <ul>
      <li class="recent_addr">
        <a href="#none">최근 배송지</a>
      </li>
      <li class="direct_input">
        <a href="#none">직접입력</a>
      </li>
    </ul>
    <div class="same_addr">
      <input type="radio" id="same" name="delivery_option" checked/>
      <label for="same">회원 정보와 동일</label>
      <input type="radio" id="new" name="delivery_option">
      <label for="new">새로운 배송지</label>
    </div>
    <div class="base_table">
      <div class="rcv_man">
        <label for="receive">받는 사람*</label>
        <input type="text" class="receive" id="receive">
      </div>
	  <!-- 주소와 우편번호가 한 줄에 나란히 배치되도록 변경 -->
	 <div class="addr_container">
	   <label for="zip">주소*</label>
	   <input type="text" readonly name="zip_code" value="" placeholder="우편번호" id="zip" />
	   <button type="button" class="search_btn" onclick="">주소검색</button>
	 </div>
	
	 <div class="addr1">
	   <input type="text" readonly name="addr" value="" placeholder="기본주소" id="address" class="basic"/>
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
        <input type="text" name="tel2" value="" /><span>-</span>
        <input type="text" name="tel3" value="" />
        <input type="hidden" name="tel" value="" />
      </div>
      <div class="email">
        <label for="email">이메일*</label>
        <input type="text" id="email">@
        <select class="choose_mail">
		<option value="">-이메일 선택-</option>
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
     <select class="message_select">
		<option value="oMessage-0" selected="selected">-- 메시지 선택 (선택사항) --</option>
		<option value="oMessage-1">배송 전에 미리 연락바랍니다.</option>
		<option value="oMessage-2">부재 시 경비실에 맡겨주세요.</option>
		<option value="oMessage-3">부재 시 문 앞에 놓아주세요.</option>
		<option value="oMessage-4">빠른 배송 부탁드립니다.</option>
		<option value="oMessage-5">택배함에 보관해 주세요.</option>
		<option value="oMessage-input">직접 입력</option>
	</select>
    </div>
    <div class="save_addr">
     <input type="checkbox" id="save">
     <label for="save">기본 배송지로 저장</label>
    </div>
    <div class="order_bord"></div>
    <div class="more_title">
      <h2>추가입력</h2>
      <div class="gift">
      	<h3>선물하기</h3>
      	 <textarea class="more_msg"></textarea> 
      </div>
    </div>
    <div class="order_bord"></div>
    <div class="order_form">
	 <h2>주문상품</h2>
	<div class="probox">
     <div class="thumbnail">
       <a href="">
         <img src="/images/BEST8.jpg" class="tiger">   
       </a>
     </div>
    <div class="description">
     <a href="" class="proname">뚱랑이 스트레스볼 3종</a>
      <span class="option">
      <p>[옵션: 01. 적호 뚱랑이]</p>
      </span>
      <span class="number">
	   <p>수량: 1개</p>
      </span>	   
	  <span class="price">
	   <p>15,000원</p>
      </span>	       
    </div>
    <button type="button" class="btnRemove"></button>
    </div>
    <div class="probox2">
     <div class="thumbnail">
       <a href="">
		  <img src="/images/BEST1.jpg">  
       </a>
     </div>
    <div class="description">
     <a href="" class="proname">무직타이거 부끄부끄 미니 인형 키링 6종</a>
      <span class="option">
      <p>[옵션: 01. 적호 뚱랑이]</p>
      </span>
      <span class="number">
	   <p>수량: 1개</p>
      </span>	   
	  <span class="price">
	   <p>8,900원</p>
      </span>	       
    </div>
    <button type="button" class="btnRemove"></button>
    </div>
    <div class="price_title">
     <h3>배송비</h3>
     <span class="dlprice">
      3,000원
     </span>
    </div>
    </div>
   <div class="order_bord"></div>
   <div class="discount">
    <h2>할인/부가결제</h2>
   <div class=dis_detail>
   	<h3>자동&nbsp할인</h3>
   	<span class="dis_price">
   	 890원
   	</span>
   </div>
    <div class=dis_detail2>
   	<h3>기간할인</h3>
   	<span class="dis_period">
   	 890원
   	</span>
   </div>
   <div class="membership">
   	<h3>적립금</h3>
   	<input type="text" class="member_money">
    <button type="button" class="use_btn" onclick="">전액 사용</button>
   </div>
   <div class="balance">
    <span class="summary">보유&nbsp잔액
     <span class="txtem">3,000원</span>
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
  	<div class="txtem">-890원</div>
  </div>
  <div class="order_bord"></div>
  </div>
  <div class="payinfo">
  	<h2>결제정보</h2>
  	<div class="sagment">
  	 <h3>주문상품</h3>
  	 <span class="order_price">
  	 23,900원
  	 </span>
  	</div>
  	<div class="sagment">
  	 <h3>배송비</h3>
  	 <span class="order_price">
  	 +3,000원
  	 </span>
  	</div>
  	<div class="sagment">
  	 <h3>할인/부가결제</h3>
  	 <span class="more_price">
  	 -890원
  	 </span>
  	</div>
  <div class="dis_basic">
    <h3><i></i>기본 할인</h3>
    <span class="basic_price">
     -890원
    </span>
  </div>
  <div class="payment">
  	<h3>최종 결제 금액</h3>
  	<span class="order_price">
  	 26,010원
  	</span>
  </div>
  <div class="order_bord"></div>
   <div class="paymethod">
    <h2>결제수단</h2>
   <div class="paychoice">
    <h3>결제수단 선택</h3>  
   </div>
   <div class="payinner">
    <div class="cardpay">
     <img src="images/common/ico_card.png">
    </div>
    <div class="deposit">
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
    cardpayButton.addEventListener('click', function() {
        depositButton.classList.remove('active');
        cardpayButton.classList.add('active');
        paycard.style.display = 'flex';
        paybank.style.display = 'none';
    });

    // 계좌 이체 버튼 클릭 시
    depositButton.addEventListener('click', function() {
        cardpayButton.classList.remove('active');
        depositButton.classList.add('active');
        paybank.style.display = 'flex';
        paycard.style.display = 'none';
    });

    // 페이지 로드 시 cardpay 버튼 클릭 상태로 설정
    window.onload = function() {
        cardpayButton.classList.add('active'); // 카드 결제 버튼 활성화
        paycard.style.display = 'flex'; // paycard 보이게
        paybank.style.display = 'none'; // paybank 숨기기
    };
</script>
  </div>
  <div class="order_bord"></div>
  <div class="earn">
   <h2>적립 혜택</h2>
   	<div class="sagment">
  	 <h3>상품별 적립금</h3>
  	 <span class="order_price">
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
  	 <span class="more_price">
  	 0원
  	 </span>
  	</div>
  </div>
    <div class="totalpay2">
  	<h3>적립&nbsp예정금액</h3>
  	<div class="txtem">1,200원</div>
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
   <button type="button" class="paybtn">
    <span class="price_view">
     26,900원 결제하기
    </span></button>
   <div class="helparea">
    <span class="typedash">
    <p>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다. 
    무이자할부를 원하시는 경우</br>  장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</p>
    <p>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
    </span>
  </div>
  </div>
  <!-- 모든 약관 동의 눌렀을때 둘다 체크 -->
  <script>
    document.getElementById('allagree').addEventListener('change', function() {
      var isChecked = this.checked;
      document.getElementById('needagree').checked = isChecked;
    });
  </script>
</body>
</html>
