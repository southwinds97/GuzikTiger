<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
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
    <link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/recentView.css?v=<?php echo time(); ?>">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/swiper-bundle.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
  </head>

  <body>
    <div id="skip_navi">
      <a href="#container"></a>
    </div>
    <%@ include file="../header.jsp" %>
      <div id="deleteMemberModal" class="modal">
        <div class="modal-content">
          <span class="close">&times;</span>
          <div id="modal-body-member"></div>
        </div>
      </div>

      <script>
        $(document).ready(function () {
          var modal = $('#deleteMemberModal');
          var modalContent = $('#modal-body-member');

          $('#deleteMember').click(function (event) {
            event.preventDefault();
            $.ajax({
              url: '/deleteMember.do',
              type: 'GET',
              success: function (data) {
                console.log("AJAX 요청 성공:", data); // 디버깅용 콘솔 로그
                modalContent.html(data);
                modal.show();
              },
              error: function (xhr, status, error) {
                console.error("AJAX 요청 실패:", status, error); // 디버깅용 콘솔 로그
                alert('회원탈퇴 페이지를 불러오는 데 실패했습니다.');
              }
            });
          });

          $('.close').click(function () {
            modal.hide();
          });

          $(window).click(function (event) {
            if ($(event.target).is(modal)) {
              modal.hide();
            }
          });
        });
        
        //최근 리스트 스크립트에서 변환 , 
        let arr = new Array();
        <c:forEach items="${recentViewList}" var="item">
        arr.push({product_id : "${item.product_id}"
        	, option_id : "${item.option_id}"
            , product_name : "${item.product_name}"
            ,price : "${item.price}" 
            ,idx : "${item.idx}" 
        	,option_List :"${item.option_list}"});
        </c:forEach>
        
        //옵션 및 옵션가격 조회
        $(function(){
        
        	$(".optionNum").change(function(){
        	var idx =	(this.value);
        	var product_id = $(this).parent().attr('id');
        	let option_price = arr.filter((e)=>{
        		return idx===e.idx && product_id===e.product_id
        	});
        	
        	var out = document.getElementById(product_id+"p");
        	out.innerHTML = option_price[0].price+'원';
        	//$('#priceTest').text(option_price[0].price);
        	});
        });
        
      </script>
      <div id="wrap">
        <div id="container">
          <div class="location">
            <span>현재위치</span>
            <ol>
              <li><a href="/">홈</a></li>
              <li title="현재위치" class="on">최근 본 상품</li>
            </ol>
          </div>
          <main id="contents">
            <div class="mypage_main">
              <div class="top_titlearea">
                <h2>최근 본 상품</h2>
              </div>
              <div class="recentView">
                <ul class="productList">
                
                <c:forEach items="${recentViewList}" var="row" varStatus="loop">
                  <c:if test="${row.idx eq 1}">     
                  <li class="list_Wrap">
                    <div class="prdlist">
                      <div class="prdBox">
                        <div class="thumbnail">
                          <a href="#">
                            <img src="../images/productList/${row.img_id }" alt="상품리스트"> 
                          </a>
                        </div>
                        <div class="description">
                          <strong class="prdName">
                            <a href="#"> ${row.product_name }</a>
                          </strong>
                           <div id="${row.product_id }${'p'}"><strong class="price">${row.price }원</strong></div>
                          <ul class="Savings">
                            <li class="mileage">
                              <span><img src="images/ico_product_point.gif" alt="적립금"> 5%</span>
                            </li>
                          </ul>
                        </div>
                        <div class="buttonGroup">
                          <span class="gRight">
                            <button type="button" class="btn_cart">장바구니</button>
                            <button type="button" class="btn_buy">주문하기</button>
                          </span>
                        </div>
                      </div>
	                     <c:if test="${fn:length(row.option_list) gt 1 }">
	                      <ul class="options">
	                        <li class="optionsWrap">
	                          <div class="name" id="${row.product_id}">
	                            <span class="optionName">${row.cd_name}</span>
	                            
	                            <select class="optionNum" >
	                              <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
	                              <option value="**" disabled>-------------------</option>
	                             <c:forEach items="${row.option_list}" var="dto" varStatus="loop">
		                              	  <option value="${loop.count}">0${loop.count}. ${dto}</option>
						           </c:forEach> 
	                            </select>
	                          </div>
	                        </li>
	                      </ul>
                      	</c:if>
                      <button type="button" class="btn_Delete" href="#none">삭제</button>
                    </div>
                  </li>
               	  </c:if>
    			</c:forEach> 
                </ul>
              </div>


              <!--페이지 -->
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
              <!-- 왼쪽메뉴 -->
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
              </div>
          </main>
        </div>
      </div>
      <%@ include file="../footer.jsp" %>
  </body>

  </html>