<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<link rel="stylesheet" href="css/sub.css?v=<%= System.currentTimeMillis() %>">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			$(document).ready(function () {
				var searchKeyword = null;
				var totalCount = ${ productCount };
				var offset = 0;
				var limit = 10;

				// 초기 페이지 로딩 시 productListContent를 가져오기 위한 ajax 호출
				productSelectContent(true);

				// 검색어가 바뀔시 productListContent를 업데이트하기 위한 이벤트 핸들러 등록
				$("form").submit(function (e) {
					e.preventDefault();
					searchKeyword = $('input[name="searchKeyword"]').val();
					offset = 0;
					productSelectContent(true);
				});

				// more 버튼 클릭 시 추가 제품 로드
				$(document).on("click", ".btn_more", function () { // 이벤트 위임 사용
					productSelectContent(false);
				});
				function productSelectContent(reset) {
					$.ajax({
						url: "productSelectList.do",
						type: "get",
						data: {
							searchKeyword: searchKeyword,
							offset: offset,
							limit: limit,
						},
						success: function (data) {
							console.log(data);
							if (reset) {
								$("#productSelectList").html(data);
							} else {
								$("#productSelectList").append(data);
							}

							offset += limit;

							if ($(data).filter('tr').length < limit) {
								$(".btn_more").hide();
							} else {
								$(".btn_more").show();
							}
						},
						error: function (xhr, status, error) {
							$(".btn_more").hide(); // 에러 발생 시 버튼 숨기기
							console.log(error);
						},
					});
				}

				// 선택 버튼 클릭 이벤트 핸들러
				$(document).on('click', '.select-btn', function () {
					var tr = $(this).closest('tr');
					var name = tr.data('name');
					var price = tr.data('price');
					var img = tr.data('img');

					// 선택된 상품 정보를 부모 창에 전달
					window.opener.document.getElementById("product-name").innerText = name;
					window.opener.document.getElementById("product-price").innerText = price + "원";
					window.opener.document.getElementById("product-img").src = "./images/productList/" + img;
					window.opener.document.getElementById("product-hiddenname").value = name;
					window.opener.document.getElementById("product-hiddenimg").value = img;
					window.opener.document.getElementById("product-hiddenprice").value = price;
					window.close();
				});
			});
		</script>
		<div class="product_selecting">
			<div class="inner">
				<h2>상품검색</h2>
				<form>
					<input type="text" name="searchKeyword">
					<button class="proSel_btn" type="submit">검색하기</button>
				</form>
				<div class="result_product_wrap">
					<div class="product_count">
						총 ${productCount}개의 상품이 검색되었습니다.
					</div>
					<div class="result_product">
						<table>
							<thead>
								<tr>
									<th class="col1">이미지</th>
									<th class="col2">상품정보</th>
									<th class="col3">선택</th>
								</tr>
							</thead>
							<tbody id="productSelectList" class="product_result_list">
							</tbody>
						</table>
						<div class="btr_wrap">
							<button type="button" class="btn_more">
								more&nbsp;&nbsp;&nbsp;+
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>