<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<link rel="stylesheet" href="css/swiper-bundle.min.css" />
			<link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
			<link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
			<link rel="stylesheet" href="css/productList.css?v=<?php echo time(); ?>">
			<link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>">
			<script src="js/jquery-3.7.1.min.js"></script>
			<script src="js/swiper-bundle.min.js"></script>
			<script src="js/jquery-ui.min.js"></script>
			<script src="js/ui-common.js?v=<?php echo time(); ?>"></script>

		</head>

		<body>
			<div id="skip_navi">
				<a href="#container">본문바로가기</a>
			</div>
			<div id="wrap">
				<!-- 헤더 -->
				<%@ include file="../header.jsp" %>
					<main id="container" class="search_page sub_container">
						<div class="inner_search">
							<div class="path">
								<a href="index.html">Home</a> / <span>상품검색</span>
							</div>
							<h2>상품검색</h2>
							<form method="get">
								<div class="search_input_wrap">
									<div class="search_input">
										<input type="text" value="<%= request.getParameter(" searchword") !=null ?
											request.getParameter("searchword") : "" %>">
										<input type="text" placeholder="검색어를 입력해주세요" name="searchKeyword">
										<button type="submit"><span class="blind">검색</span></button>
									</div>
									<span>인기검색어</span>
									<div class="best_search">
										<button>#부끄부끄 인형</button>
										<button>#키링</button>
										<button>#노트북 파우치</button>
										<button>#사자</button>
										<button>#네임택</button>
										<button>#모니터 인형</button>
										<button>#폰케이스</button>
										<button>#쿠션</button>
									</div>
								</div>
							</form>
							<div class="search_result" style="display: flex; justify-content: space-between;">
								<span>상품 검색 결과</span><strong>${totalCount}</strong>
								<div class="function" id="function" style="padding-top: 40px;">
									<select id="list_array" name="list_array">
										<option value="1">신상품</option>
										<option value="2">상품명</option>
										<option value="3">낮은가격</option>
										<option value="4">높은가격</option>
										<option value="5">인기상품</option>
									</select>
								</div>
							</div>
							<div id="searchListContent"></div>
							<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
							<!-- ajax 처리(searchKeyword 파라미터 전달) -->
							<script>
								// URL에서 파라미터 값을 추출하는 함수
								function getParameterByName(name) {
									name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
									var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
										results = regex.exec(location.search);
									return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
								}

								$(document).ready(function () {
									// URL에서 searchKeyword 파라미터 값 추출
									var searchKeyword = getParameterByName("searchKeyword");
									var listArrayValue = $('#list_array').val();
									var totalCount = 0;

									// 초기 페이지 로딩 시 productListContent를 가져오기 위한 ajax 호출
									loadProductListContent();

									// 리스트 값이 바뀔시 productListContent를 업데이트하기 위한 이벤트 핸들러 등록
									$('#list_array').change(function () {
										listArrayValue = $(this).val();
										$('#searchListContent').empty();
										loadProductListContent();
									});

									// 검색어가 바뀔시 productListContent를 업데이트하기 위한 이벤트 핸들러 등록
									$('form').submit(function (e) {
										e.preventDefault();
										searchKeyword = $('input[name="searchKeyword"]').val();
										$('#searchListContent').empty();
										loadProductListContent();
									});

									// searchKeyword 파라미터가 존재하면 AJAX 요청 보내기
									function loadProductListContent() {
										if (searchKeyword) {
											$.ajax({
												url: "productListContent.do",
												type: "get",
												data: {
													"list_array": listArrayValue,
													"searchKeyword": searchKeyword,
													"totalCount": totalCount
												},
												success: function (data) {
													console.log(data);
													$("#searchListContent").html(data);
												}
											});
										}
									}
								});
							</script>

						</div>
					</main>
					<!-- 푸터 -->
					<%@ include file="../footer.jsp" %>
			</div>
		</body>

		</html>