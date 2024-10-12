<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- <meta name="viewport" content="width=1280"> -->
  <meta name="format-detection" content="telephone=no">
  <meta name="description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
  <meta property="og:type" content="website">
  <meta property="og:url" content="http://yong9701.dothome.co.kr/rwdmyungranghotdog/index.html">
  <meta property="og:title" content="MUZIK TIGER  무직타이거">
  <meta property="og:description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
  <meta property="og:image" content="https://contents.sixshop.com/uploadedFiles/56465/default/image_1710376929430.png">
  <title>GUZIK TIGER  구직타이거</title>
  <link rel="icon" href="images/common/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="images/common/favicon.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  <!-- 라이브러리는 먼저 연결하는 것을 원칙으로 함 -->
  <link rel="stylesheet" href="css/jquery-ui.min.css">
  <link rel="stylesheet" href="css/swiper-bundle.min.css">
  <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
  <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
  <link rel="stylesheet" href="css/order_detailView.css?v=<echo time(); ?>">
  
  <script src="js/jquery-3.7.1.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/swiper-bundle.min.js"></script>
  <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
</head>
<body>
  <%@ include file="../header.jsp" %>
   <div id="wrap">
     <div id="container">
       <div class="location">
         <span>현재위치</span>
         <ol>
           <li><a href="/">홈</a></li>
           <li title="현재위치" class="on">마이 쇼핑</li>
           <li title="현재위치" class="on">주문상세조회</li>
         </ol>
       </div>
       <main id="contents">
         <div class="mypage_main">
  		   <h2>주문상세조회</h2>
  		    <div class="inform">
  		     <h3>주문정보</h3>
  		    </div>
  		    <div class="order">
  		     <table border="1">
  		      <caption>주문정보</caption>
  		       <tbody>
  		        <tr>
  		         <th scope="row">주문번호</th>
  		         <td>${orderDetailList[0].order_id}</td>
  		        </tr>
  		        <tr>
  		         <th scope="row">주문일자</th>
  		         <td><fmt:formatDate value="${orderDetailList[0].order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
  		        </tr>
  		        <tr>
  		         <th scope="row">주문자</th>
  		         <td>${orderDetailList[0].order_name}</td>
  		        </tr>
  		        <tr>
  		         <th scope="row">주문처리상태</th>
  		         <td>${orderDetailList[0].order_prog}</td>
  		        </tr>	
  		       </tbody>
  		     </table>
  		    </div>
  		    <div class="inform">
  		     <h3>결제정보</h3>
  		    </div>
  		    <div class="order">
  		     <table border="1">
  		      <caption>주문정보</caption>
  		       <tbody>
  		        <tr>
  		         <th scope="row">총 주문금액</th>
  		         <td class="product_total"> <button type="button" class="watch_btn">내역보기</button></td>
  		        </tr>
  		        <tr>
  		         <th scope="row">총 결제금액</th>
  		         <td class="order_amount">${orderDetailList[0].order_amount}원</td>
				 <script>
					$('.order_amount').each(function () {
						let price = parseInt($(this).text().replace(/,/g, ''));
						$(this).text(price.toLocaleString() + '원');
					});
				 </script>
  		        </tr>
  		        <tr>
  		         <th scope="row">결제수단</th>
  		         <td>${orderDetailList[0].payment}</br></td>
  		        </tr>	
  		       </tbody>
  		     </table>
  		    </div>
  	  		<div class="inform">
  		     <h3>주문 상품 정보(총 1개 / 0원)</h3>
  		    </div>
  		    <c:forEach var="order" items="${orderDetailList}">
				<div class="goods">
					<img src="/images/productList/${order.img_id}" alt="${order.product_name}">
					<div class="text">
						<p class="ball">${order.product_name}</p>
						<p class="price">${order.price}원<span class="quantity">(${order.quantity}개)</span></p>
						<p class="option">[옵션: ${order.option_id}]</p>
						<p class="delivery">배송 : 기본배송</p>
					</div>
				</div>
			</c:forEach>

			<script>
				$(document).ready(function() {
					// 가격을 포맷팅하여 표시
					$('.price').each(function () {
						let priceText = $(this).contents().filter(function() {
							return this.nodeType === 3; // 텍스트 노드만 선택
						}).text().replace(/,/g, '').replace('원', '').trim();

						let price = parseInt(priceText);
						if (!isNaN(price)) {
							$(this).contents().filter(function() {
								return this.nodeType === 3; // 텍스트 노드만 선택
							}).first().replaceWith(price.toLocaleString() + '원');
						}
					});

					// 총 주문금액 price값을 모두 더함
					var total = 0;
					$(".goods").each(function() {
						var priceText = $(this).find(".price").contents().filter(function() {
							return this.nodeType === 3; // 텍스트 노드만 선택
						}).text().replace("원", "").replace(/,/g, "").trim();

						var quantityText = $(this).find(".quantity").text().replace("(", "").replace("개)", "").trim();
						
						console.log("Price Text: ", priceText); // 디버깅을 위해 추가
						console.log("Quantity Text: ", quantityText); // 디버깅을 위해 추가

						var price = parseInt(priceText);
						var quantity = parseInt(quantityText);
						
						console.log("Parsed Price: ", price); // 디버깅을 위해 추가
						console.log("Parsed Quantity: ", quantity); // 디버깅을 위해 추가
						
						if (!isNaN(price) && !isNaN(quantity)) {
							total += price * quantity;
						}
					});

					console.log("Total: ", total); // 디버깅을 위해 추가

					// .product_total에 총 주문금액을 넣어줌
					$(".product_total").text(total.toLocaleString() + "원");
				});
			</script>
  		   <div class="comple">
  		     <h3>취소완료</h3>
  		     <span class="more"><a href="#" class="btnText">상세정보</a></span>
  		   </div>
  		    <div class="cansle">
 			 <span>[기본배송]</span>
 			 <span>상품구매금액 0 + 배송비 0 + 지역별배송비 0</span>
 			 <span>합계:0원</span>
  		    </div>
  		    <div class="credit">
  		     <h3>최종 결제 정보</h3>
  		    </div>
  		    <div class="money">
  		     <table border="1">
  		      <caption>결제정보</caption>
  		       <tbody>
  		        <tr>
  		         <th scope="row">총 결제금액</th>
  		         <td class="zero">${orderDetailList[0].order_amount}원</td>
				 <script>
					$('.zero').each(function () {
						let price = parseInt($(this).text().replace(/,/g, ''));
						$(this).text(price.toLocaleString() + '원');
					});
				 </script>
  		        </tr>
  		        <tr>
  		         <th scope="row">상품구매금액</th>
  		         <td>0원</td>
  		        </tr>
  		        <tr>
  		         <th scope="row">배송비</th>
  		         <td>0원</td>
  		        </tr>
  		        <tr>
  		         <th scope="row">결제예정금액</th>
  		         <td>0원</td>
  		        </tr>	
  		       </tbody>
  		     </table>
  		    </div>
  		   <div class="refund">
  		    <h3>환불정보</h3>
  		   </div>
  		   <div class="rf_infor">
			<table border="1">
			  <caption>결제정보</caption>
			  <thead>
			    <tr class="division">
			      <th scope="col">구분</th>
			      <th scope="col" class="form">상품정보</th>
			      <th scope="col" class="count">수량</th>
			      <th scope="col" class="buy">상품구매금액</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr class="target">
			      <th scope="row">취소대상</th>
			      <td class="kring">${orderDetailList[0].product_name} 외 4종</br>
			      <span>[옵션:${orderDetailList[0].option_id}]</span></td>
			      <td class="score">${orderDetailList[0].quantity}</td>    <!-- 수량 -->
			      <td class="product_price">${orderDetailList[0].price}</td> <!-- 상품구매금액 -->
				  <script>
					$('.product_price').each(function () {
						let price = parseInt($(this).text().replace(/,/g, ''));
						$(this).text(price.toLocaleString() + '원');
					});
				  </script>
			    </tr>
			    <tr>
			      <th scope="row">환불일자<br/> (처리상태)</th>
			      <td colspan="3"><fmt:formatDate value="${refundDate}" pattern="yyyy-MM-dd HH:mm:ss" /><span class="repay">(환불완료)</span></td>
			    </tr>
			    <tr>
			      <th scope="row">환불금액</th>
			      <td colspan="3"><span class="total">${orderDetailList[0].order_amount}원</span></td>
				  <script>
					$('.total').each(function () {
						let price = parseInt($(this).text().replace(/,/g, ''));
						$(this).text(price.toLocaleString() + '원');
					});
				  </script>
			    </tr>
			    <tr>
			      <th scope="row">환불수단</th>
			      <td colspan="3">현금</td>
			    </tr>
			  </tbody>
			</table>
		   </div>
		   <div class="deliver">
		    <div class="inform">
  		     <h3>배송지정보</h3>
  		    </div>
  		    <div class="order">
  		     <table border="1">
  		      <caption>배송지정보</caption>
  		       <tbody>
  		        <tr>
  		         <th scope="row">받으시는분</th>
  		         <td>${orderDetailList[0].order_name}</td>
  		        </tr>
  		        <tr>
  		         <th scope="row">우편번호</th>
  		         <td>03189</td>
  		        </tr>
  		        <tr>
  		         <th scope="row">주소</th>
  		         <td>${orderDetailList[0].order_addr}</td>
  		        </tr>
  		        <tr>
  		         <th scope="row">휴대전화</th>
  		         <td>${orderDetailList[0].order_phone}</td>
  		        </tr>	
  		        <tr>
  		         <th scope="row">배송메세지</th>
  		         <td>부재시 문 앞에 놓아주세요</td>
  		        </tr>	
  		       </tbody>
  		     </table>
  		    </div>
  		   </div>
  		  <div class="more">
		    <div class="inform">
  		     <h3>추가정보</h3>
  		    </div>
  		  </div>
  		 <div class="bottom">
  		  <button type="button" class="card_btn">카드매출전표 인쇄</button>
  		 </div>
  		 <div class="order_view">
  		   <button type="button" class="view_btn">주문목록보기</button>
  		 </div>
  		 <div class="use">
		  <div class="inform">
  		   <h3>이용안내</h3>
  		   </div>
  		  <div class="guide">
  		   <span>신용카드매출전표 발행 안내</span>
  		    <p>신용카드 결제는 사용하는 PG사 명의로 발행됩니다.</p>
  		   <span>세금계산서 발행 안내</span>
  		    <p>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</p>
  		    <p>세금계산서는 사업자만 신청하실 수 있습니다.</p>
  		    <p>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</p>
  		    <p>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업등록자사본을 보내셔야 세금계산서 발생이 가능합니다.</p>
  		    <p>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</p>
  		    <p>세금계산서는 실결제금액에 대해서만 발행됩니다.(적립금과 할인금액은 세금계산서 금액에서 제외됨)</p>
  		   <span>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경 안내</span>
  		    <p>변경된 부가가치세법에 의거,2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</br>
  		     신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</p>
  		    <p>상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다..</p>
  		   <span>현금영수증 이용안내</span>
  		    <p>현금영수증은 1원 이상의 현금성거래(무통장입금,실시간계좌이체,에스클로,예치금)에 대해 발행이 됩니다.</p>
  		    <p>현금영수증 발행 금액에는 배송비는 포함되고,적립금사용액은 포함되지 않습니다.</p>
  		    <p>발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</p>
  		    <p>현금영수증 발행 취소의 경우는 시간 제한이 없습니다.(국세청의 정책에 따라 변경 될 수 있습니다.)</p>
  		    <p>현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</p>
  		  </div>
  		 </div>
         <div class="myinfo_Main">
           <h2>My Account</h2>
           <div class="subTitle">
             <h3>쇼핑 정보</h3>
           </div>
           <ul class="menu">
             <li>
               <a href="#">주문내역 조회</a>
             </li>
           </ul>
           <div class="subTitle">
             <h3>활동 정보</h3>
           </div>
           <ul class="menu">
             <li>
               <a href="recentView.do">최근 본 상품</a>
             </li>
             <li>
               <a href="wishList.do">나의 위시리스트</a>
             </li>
             <li>
               <a href="myPost.do">나의 게시글</a>
             </li>
           </ul>
           <div class="subTitle">
             <h3>나의 정보</h3>
           </div>
           <ul class="menu">
             <li>
               <a href="registEdit.do">회원정보 수정</a>
             </li>
             <li>
               <a href="#" id="deleteMember">회원탈퇴</a>
             </li>
           </ul>
         </div>
       </main>
     </div>
   </div>

</body>
</html>