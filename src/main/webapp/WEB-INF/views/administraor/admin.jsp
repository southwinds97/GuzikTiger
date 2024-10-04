<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width,initial-scale=1" />
			<meta name="theme-color" content="#000000" />
			<meta name="description" content="Web site created using create-react-app" />
			<link rel="manifest" href="/reactChat/manifest.json" />
			<script defer="defer" src="/reactChat/static/js/main.43a062b6.js"></script>
			<link href="/reactChat/static/css/main.4c573039.css" rel="stylesheet">
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
			<script src="js/admin.js"></script>
			<script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
		</head>

		<body>


			<div id="skip_navi">
				<a href="#container"></a>
			</div>
			<div id="wrap">
				<!-- 헤더 -->
				<%@ include file="../header.jsp" %>
					<div id="container">
						<div class="location">
							<span>현재위치</span>
							<ol>
								<li><a href="/">홈</a></li>
								<li title="현재위치" class="on">admin menu</li>
							</ol>
						</div>
						<main id="contents">
							<!-- -----------------------------------  1서브메뉴 변경 시작---------------------------->
							<div id="productList">
								<div class="top_titlearea">
									<h2>상품 정보</h2>
								</div>
								<div class="recentView">
									<table border=1>
										<colgroup>
											<col width="3%" />
											<col width="5%" />
											<col width="20%" />
											<col width="20%" />
											<col width="5%" />
											<col width="3%" />
											<col width="4%" />
											<col width="20%" />
											<col width="10%" />
											<col width="10%" />
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>상품ID</th>
												<th>상품명</th>
												<th>옵션명</th>
												<th>상품가격</th>
												<th>재고</th>
												<th>상품분류</th>
												<th>상품정보</th>
												<th>상품 등록일</th>
												<th>상품이미지</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${productList}" var="dto" varStatus="loop">
												<tr>
													<td>${loop.count}</td>
													<td>${dto.product_id}</td>
													<td>${dto.product_name}</td>
													<td>${dto.option_id}</td>
													<td>${dto.price}</td>
													<td>${dto.stock}</td>
													<td>${dto.sub_cate}</td>
													<td>${dto.product_content}</td>
													<td>${dto.regidate} </td>
													<td><img style="width : 100px"
															src="./images/productList/${dto.img_id }" alt="상품리스트"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- -----------------------------------  1서브메뉴 변경 끝---------------------------->

							<!-- -----------------------------------  2서브메뉴 변경 시작---------------------------->
							<div id="orderList" style="display:none">
								<div class="top_titlearea">
									<h2>주문 정보</h2>
								</div>
								<div class="recentView">
									<table border=1>
										<colgroup>
											<col width="10%" />
											<col width="10%" />
											<col width="15%" />
											<col width="10%" />
											<col width="10%" />
											<col width="20%" />
											<col width="5%" />
											<col width="5%" />
											<col width="5%" />
											<col width="5%" />
											<col width="5%" />
										</colgroup>
										<thead>
											<tr>
												<th>주문ID</th>
												<th>회원ID</th>
												<th>주문시간</th>
												<th>주문자성명</th>
												<th>전화번호</th>
												<th>주소</th>
												<th>주문금액</th>
												<th>결제종류</th>
												<th>배송비</th>
												<th>결제진행</th>
												<th>배송진행</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orderList}" var="dto" varStatus="loop">
												<tr>
													<td>${dto.order_id}</td>
													<td>${dto.member_id}</td>
													<td>${dto.order_date}</td>
													<td>${dto.order_name}</td>
													<td>${dto.order_phone}</td>
													<td>${dto.order_addr}</td>
													<td>${dto.order_amount}</td>
													<td>${dto.payment}</td>
													<td>${dto.deliv_charge} </td>
													<td>${dto.order_prog}</td>
													<td>${dto.deliv_prog}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- -----------------------------------  2서브메뉴 변경 끝---------------------------->

							<!-- -----------------------------------  3서브메뉴 변경 시작---------------------------->
							<div id="memberList" style="display:none">
								<div class="top_titlearea">
									<h2>회원 정보</h2>
								</div>
								<div class="recentView">
									<table border=1>
										<colgroup>
											<col width="5%" />
											<col width="5%" />
											<col width="10%" />
											<col width="10%" />
											<col width="10%" />
											<col width="15%" />
											<col width="20%" />
											<col width="5%" />
											<col width="10%" />
											<col width="10%" />
										</colgroup>
										<thead>
											<tr>
												<th>회원ID</th>
												<th>이름</th>
												<th>비밀번호</th>
												<th>힌트</th>
												<th>전화번호</th>
												<th>이메일주소</th>
												<th>주소</th>
												<th>적립금</th>
												<th>가입일자</th>
												<th>등급</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${memberList}" var="dto" varStatus="loop">
												<tr>
													<td>${dto.id}</td>
													<td>${dto.name}</td>
													<td>${dto.pass}</td>
													<td>${dto.hint}</td>
													<td>${dto.tel}</td>
													<td>${dto.email}</td>
													<td>${dto.addr}</td>
													<td>${dto.points}</td>
													<td>${dto.regdate} </td>
													<td>${dto.user_level}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- -----------------------------------  3서브메뉴 변경 끝---------------------------->
							<!-- 4서브메뉴 변경 시작 -->
							<div id="chatList" style="display:none; height: 1000px">
								<iframe id="chatFrame" src="" style="width:100%; height:100%; border:none;"></iframe>
							</div>
							<!-- 4서브메뉴 끝 -->

							<!-- -----------------------------------  페이지네이션 ---------------------------->
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


							<!-- -----------------------------------  left menu ---------------------------->
							<div class="myinfo_Main">
								<h2>Admin Menu</h2>
								<div class="subTitle">
									<h3>상품 정보</h3>
								</div>
								<ul class="menu">
									<li>
										<a href="#" onclick="listChk(listId.A)">상품 리스트</a>
									</li>
									<li>
										<a href="#">상품 등록</a>
									</li>
								</ul>
								<div class="subTitle">
									<h3>주문 정보</h3>
								</div>
								<ul class="menu">
									<li>
										<a href="#" onclick="listChk(listId.B)">주문 리스트</a>
									</li>
								</ul>
								<div class="subTitle">
									<h3>회원 정보</h3>
								</div>
								<ul class="menu">
									<li>
										<a href="#" onclick="listChk(listId.C)">회원 리스트</a>
									</li>
									<li>
										<a href="#">회원정보 수정</a>
									</li>
								</ul>
								<div class="subTitle">
									<h3>채팅</h3>
								</div>
								<ul class="menu">
									<li>
										<a href="#" onclick="listChk(listId.D)">채팅 관리자</a>
									</li>
								</ul>
							</div>
						</main>
					</div>
			</div>
			<script>
				// iframe으로 reactChat 채팅창 불러오기
				document.getElementById('chatFrame').src = '/chat';


			</script>
			<!-- 푸터 -->
			<%@ include file="../footer.jsp" %>
		</body>

		</html>