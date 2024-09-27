<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="format-detection" content="telephone=no">
  <meta name="description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
  <meta property="og:type" content="website">
  <meta property="og:url" content="http://yong9701.dothome.co.kr/rwdmyungranghotdog/index.html">
  <meta property="og:title" content="MUZIK TIGER  무직타이거">
  <meta property="og:description" content="엉뚱하고 사랑스러운 호랑이, 뚱랑이의 캐릭터 소품을 판매합니다">
  <meta property="og:image" content="https://contents.sixshop.com/uploadedFiles/56465/default/image_1710376929430.png">
  <title>MUZIK TIGER  무직타이거</title>
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
  <link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>">
  <link rel="stylesheet" href="css/wishlist.css?v=<?php echo time(); ?>"> 
  <script src="js/jquery-3.7.1.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/swiper-bundle.min.js"></script>
  <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
</head>
<body>

<script>

var array = new Array(); // 배열 선언
function paymentGo(){
	alert("성공");
	$('input:checkbox[name=cart_dtl_id]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	    array.push(this.value);
	});
				
	$("#arrayParam").val(array);
		
	$("#form").attr("action", "/cartOrder.do");  
	$("#form").submit();
}	
	
</script>
  <div id="skip_navi">
    <a href="#container">Skip to content</a>
  </div>
  <div id="wrap">
  <%@ include file="../header.jsp" %>
    <div id="container">
      <div class="location">
        <a href="index.html">Home</a>
        <a href="mypage.html">마이 쇼핑</a>
        <a> 장바구니</a>
      </div>
      <main id="contents">  
        <div class="mypage_main">
         <h2>장바구니</h2>
         <div class="mylist">
         <c:choose>
    		<c:when test="${ empty lists }"> 
    		<tbody>
		        <tr>
		            <td colspan="5" align="center">
		                장바구니에 등록된 상품이 없습니다^^*
		            </td>
		        </tr>
		     </tbody>
		  </c:when> 
   		  <c:otherwise>    
   		  <form id="cartForm" method="post"> 
	          <c:forEach items="${ lists }" var="row" varStatus="loop">   
		          <ul class="mypage_top">
		          
		            <li>
		            	<input type="checkbox" class="wish_idx" name = "cart_dtl_id" value= "${row.cart_dtl_id }" />
		            </li>
		            <li class="thumbnail">
		              <a href="">
						<img src="./images/productList/${row.img_id }" class="tiger">              
		              </a>
		            </li>
		           <div class="description">
					<a href="" class="proname">${ row.product_name }</a>
				   <ul class="price">
				   	<li>${ row.quantity }원</li>
				   </ul>
				   <div class="name">
		             <span class="optionStr">[옵션: 01. ${ row.option_id }]</span>
		              <span class="optionStr">[수량:  ${ row.quantity }개]</span>
		              </div>	       
				   <a href="#none" class="btndelete">삭제</a> 	  
		           </div>
		           <div class="btngroup">
		           	<div class="btn_right">
		           	 <button type="button" onclick="" class="btnnormal">장바구니</button>
		           	 <button type="button" onclick="" class="btnorder">주문하기</button>
		           	</div>
		           </div>
		          </ul>
	            </c:forEach>  
            </form>
             </c:otherwise>    
		</c:choose>  

         </div>
         <div class="btngroup2">
           <div class="base_btn">
         	<button type="button" onclick="" class="btnall">전체삭제</button>
         	<button type="button" onclick="" class="btnchoose">선택삭제</button>
           </div>
         </div>
          <div class="btngroup3">
           <div class="bottom_btn">
         	<button type="button" onclick="paymentGo()" class="btnallorder">전체상품주문</button>
           </div>
         </div>
        <div class="paginate">
          <a href="#" class="first">첫 페이지</a>
          <a href="#">이전페이지</a>
          <ol>
            <li class="xans-record">
              <a href="#" class="this">1</a>
            </li>
          </ol>
          <a href="#">다음페이지</a>
          <a href="#" class="last">마지막페이지</a>
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
              <a href="#">최근 본 상품</a>
            </li>
            <li>
              <a href="#">나의 위시리스트</a>
            </li>
            <li>
              <a href="#">나의 게시글</a>
            </li>
          </ul>
          <div class="subTitle">
            <h3>나의 정보</h3>
          </div>
          <ul class="menu">
            <li>
              <a href="#">회원정보 수정</a>
            </li>
            <li>
              <a href="#">회원탈퇴</a>
            </li>
          </ul>
        </div>
      </main>
    </div>
  <%@ include file="../footer.jsp" %>
  </div>
</body>
</html>