<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8" />
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
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="css/productWrite2.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
<!-- summernote 추가 -->
  <script src="js/jquery-3.7.1.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
  <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
</head>

<body>
  <div id="skip_navi">
    <a href="#container">본문바로가기</a>
  </div>
  <div id="wrap">
  <!-- 헤더 -->
  <%@ include file="../header.jsp" %>
    <main id="container">
      <div class="WritingWrap">
				<div class="WritingHeader">
					<h2 class="title"> 상품등록 </h2>
        </div>
        <div class="WritingContent">
          <div class="WritingEditor">
						<div id="previewContainer" class="preview-container">
							<div class="form-group">
								<label for="thumbnail" class="thst">썸네일</label>
								<input type="file" class="form-control" name="thumbnail" id="thumbnail">
								<div id="thumbnailPreview" class="preview"></div>
							</div>
							<div id="thumbnailPreview" class="preview"></div>
							<div class="form-group">
								<label for="upfile" class="thst">추가이미지</label>
								<input type="file" multiple name="upfile[]" id="upfile" style="display:none;">
								<div id="target_file_wrap">
									<a href="#" onclick="document.getElementById('upfile').click()" class="btn btn-primary">이미지선택</a>
								</div>
								<div id="imageArea"></div>
							</div>
						</div>
            <div class="editer_wrap">
							<div class="ArticleWritingTitle">
								<div class="row">
									<div class="column_title">
										<div class="FormSelectBox menu_candidates_selectbox">
											<div class="FormSelectButton">
												<div class="main_Categorie">
													<table border="1" class="option_table">
														<caption>상품 옵션</caption>
														<tbody class="option">
															<tr>
																<td>
																	<select name="main_Categories" id="main_Categories" class="main_Categories">
																		<option value="0">카테고리 대분류</option>
																		<option value="1">토이/인형</option>
																		<option value="2">키링</option>
																		<option value="3">노트북/태블릿 파우치</option>
																		<option value="4">패브릭/생활</option>
																		<option value="5">키친</option>
																		<option value="6">패션잡화</option>
																		<option value="7">여행/잡화</option>
																		<option value="8">문구류</option>
																		<option value="9">스티커/마스킹테이프</option>
																		<option value="10">엽서/카드/포스터</option>
																		<option value="11">폰케이스/모양톡/스트랩</option>
																		<option value="12">에어팟/버즈 케이스</option>
																		<option value="13">선물세트추천</option>
																	</select>
																	<p class="value"></p>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="sub_Categorie">
													<table border="1" class="option_table">
														<caption>상품 옵션</caption>
														<tbody class="option">
															<tr>
																<td>
																	<select name="menu_candidates" id="menu_candidates" class="menu_candidates">
																		<option value="0">카테고리 중분류</option>
																		<option value="a" class="prd1">피규어</option>
																		<option value="b" class="prd1">인형</option>
																		<option value="c" class="prd1">인형쿠션</option>
																		<option value="d" class="prd2">아크릴 키링</option>
																		<option value="e" class="prd2">인형 키링</option>
																		<option value="f" class="prd2">파우치 키링</option>
																		<option value="g" class="prd3">노트북/태블릿 파우치</option>
																		<option value="h" class="prd4">패브릭소품</option>
																		<option value="u" class="prd4">카페트/러그</option>
																		<option value="i" class="prd4">쿠션</option>
																		<option value="k" class="prd4">생활용품</option>
																		<option value="x" class="prd4">마스크</option>
																		<option value="x" class="prd5">텀블러</option>
																		<option value="x" class="prd5">컵</option>
																		<option value="x" class="prd5">주방전화</option>
																		<option value="x" class="prd6">마스크</option>
																		<option value="x" class="prd6">지갑/파우치</option>
																		<option value="x" class="prd6">가방</option>
																		<option value="x" class="prd6">슬리퍼</option>
																		<option value="x" class="prd6">슈즈악세사리</option>
																		<option value="x" class="prd6">양말</option>
																		<option value="x" class="prd6">뱃지</option>
																		<option value="x" class="prd7">여행/캠핑</option>
																		<option value="x" class="prd8">PVC마우스</option>
																		<option value="x" class="prd8">극세사마우스패드</option>
																		<option value="x" class="prd8">메모지</option>
																		<option value="x" class="prd8">노트</option>
																		<option value="x" class="prd8">달력</option>
																		<option value="x" class="prd8">필기구</option>
																		<option value="x" class="prd8">필름</option>
																		<option value="x" class="prd9">리무버블 스티커</option>
																		<option value="x" class="prd9">조각 스티커</option>
																		<option value="x" class="prd9">씰 스티커</option>
																		<option value="x" class="prd9">타투 스티커</option>
																		<option value="x" class="prd9">마스킹 테이프</option>
																		<option value="x" class="prd10">엽서</option>
																		<option value="x" class="prd10">카드</option>
																		<option value="x" class="prd10">포스터</option>
																		<option value="x" class="prd11">폰케이스</option>
																		<option value="x" class="prd11">모양톡</option>
																		<option value="x" class="prd11">스트랩</option>
																		<option value="x" class="prd12">에어팟 케이스</option>
																		<option value="x" class="prd12">에어팟 프로 케이스</option>
																		<option value="x" class="prd12">에어팟3 케이스</option>
																		<option value="x" class="prd12">에어팟 맥스 케이스</option>
																		<option value="x" class="prd12">버즈 케이스</option>
																		<option value="z" class="prd13">선물세트추천</option>
																	</select>
																	<p class="value"></p>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="option">
													<div class="Categories_option">
														<textarea placeholder="상품옵션" class="textarea_input"></textarea>
													</div>
												</div>
												</div>
											</div>
										</div>
									</div>  
									<div class="form-group-inline">
										<label for="stock" class="thst">재고</label>
										<input type="number" class="form-control" name="stock" id="stock" placeholder="재고 수량">
										<label for="price" class="thst">가격</label>
										<input type="number" class="form-control" name="price" id="price" placeholder="가격">
									</div>
									<div class="row">
										<div class="FlexableTextArea">
											<textarea placeholder="상품 이름을 입력해 주세요" class="textarea_input" style="height: 28px;"></textarea>
										</div>
									</div>
								</div>
							</div>
            </div>
            <td><textarea id="summernote" name="content"></textarea></td>
         		<div class="btn_wrap">
              <button href="admin.do">취소</button>
              <button class="write_btn" type="submit">등록</button>
            </div>
          </div>
        </div>  
      </div>
    </main>
  </div>

  <script>
    $(document).ready(function () {
        $('#summernote').summernote({
            height: 1000, // 에디터 높이
            minHeight: null, // 최소 높이
            maxHeight: null, // 최대 높이
            focus: true // 에디터 로딩 후 포커스 맞추기
        });
    });
  </script>
			<script>
				document.addEventListener('DOMContentLoaded', function() {
					// 썸네일 미리보기
					document.getElementById('thumbnail').addEventListener('change', function(event) {
						const file = event.target.files[0];
						if (file) {
							const reader = new FileReader();
							reader.onload = function(e) {
								const img = document.createElement('img');
								img.src = e.target.result;
								img.className = 'thumbnail'; // 썸네일 클래스 추가

								const preview = document.getElementById('thumbnailPreview');
								preview.innerHTML = ''; // 기존 썸네일 초기화

								const deleteBtn = document.createElement('button');
								deleteBtn.innerText = 'X';
								deleteBtn.className = 'delete-btn';
								deleteBtn.onclick = function() {
									preview.innerHTML = ''; // 썸네일 삭제
								};

								const imgWrapper = document.createElement('div');
								imgWrapper.className = 'img-wrapper';
								imgWrapper.appendChild(img);
								imgWrapper.appendChild(deleteBtn);

								preview.appendChild(imgWrapper);
							};
							reader.readAsDataURL(file);
						}
					});

					// 추가 이미지 미리보기
					document.getElementById('upfile').addEventListener('change', function(event) {
						const files = event.target.files;
						const imageArea = document.getElementById('imageArea');
						Array.from(files).forEach(file => {
							const reader = new FileReader();
							reader.onload = function(e) {
								const col = document.createElement('div');
								col.className = 'col';

								const img = document.createElement('img');
								img.src = e.target.result;
								img.className = 'preview-img'; // 미리보기 이미지 클래스 추가

								const deleteBtn = document.createElement('button');
								deleteBtn.innerText = 'X';
								deleteBtn.className = 'delete-btn';
								deleteBtn.onclick = function() {
									col.remove(); // 이미지 삭제
								};

								const imgWrapper = document.createElement('div');
								imgWrapper.className = 'img-wrapper';
								imgWrapper.appendChild(img);
								imgWrapper.appendChild(deleteBtn);

								col.appendChild(imgWrapper);
								imageArea.appendChild(col);
							};
							reader.readAsDataURL(file);
						});
					});
				});
				</script>

				<style>
				#wrap {
					max-width: 100%;
					overflow: hidden;
				}

				#target_file_wrap {
				margin-bottom: 20px; /* 이미지 선택 버튼과 이미지 사이의 간격 */
				}

				#previewContainer {
					display: flex;
					gap: 20px; /* 썸네일과 추가 이미지 간의 간격 */
				}

				#thumbnailPreview {
					flex: 0 0 auto; /* 썸네일 크기 고정 */
				}

				.form-control {
					width: 100%;
					border-color: #e0e0e0;;
				}

				.thumbnail {
					max-width: 400px;
					max-height: 400px;
					display: block;
					margin-bottom: 10px;
				}

				.preview-img {
					max-width: 100%;
					max-height: 200px;
					display: block;
					margin-bottom: 10px;
				}

				#imageArea {
					display: grid;
  				grid-template-columns: repeat(3, 1fr); /* 한 줄에 3개씩 배치 */
					gap: 10px; /* 이미지 간의 간격 */
				}

				.preview img {
					max-width: 100%;
					height: auto;
				}

				#imageArea .col {
					position: relative;
					margin-bottom: 10px;
				}

				#imageArea img {
					max-width: 100%;
					height: auto;
				}

				.img-wrapper {
					position: relative;
					display: inline-block;
				}

				.delete-btn {
					position: absolute;
					top: 5px;
					right: 5px;
					background-color: transparent;
					color: black;
					border: none;
					font-size: 20px;
					font-weight: bold;
					cursor: pointer;
					opacity: 0.7;
				}

				.delete-btn:hover {
					opacity: 1;
				}

				.form-group-inline {
					display: flex;
					align-items: center;
					gap: 10px;
					padding-top: 10px;
				}
				</style>
	<!-- 푸터 -->
    <%@ include file="../footer.jsp" %>
</body>
</html>