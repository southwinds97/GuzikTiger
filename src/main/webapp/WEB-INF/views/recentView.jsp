<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>MUZIK TIGER  무직타이거</title>
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
  <div id="wrap">
  	<!-- 헤더 -->
  	<%@ include file="header.jsp" %>
    <div id="container">
      <div class="location">
        <span>현재위치</span>
        <ol>
          <li><a href="/">홈</a></li>
          <li title="현재위치" class="on">최근 본 상품<</li>
        </ol>
      </div>
      <main id="contents">
        <div class="mypage_main">
          <div class="top_titlearea">
            <h2>최근 본 상품</h2>
          </div>
          <div class="recentView">
            <ul class="productList">
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
              <li class="list_Wrap">
                <div class="prdlist">
                  <div class="prdBox">
                    <div class="thumbnail">
                      <a href="#">
                        <img src="images/recentView.jpg" alt="상품명">
                      </a>
                    </div>
                    <div class="description">
                      <strong class="prdName">
                        <a href="#">무직타이거 납작 인형 키링4종</a>
                      </strong>
                      <strong class="price">10,000원</strong>
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
                  <ul class="options">
                    <li class="optionsWrap">
                      <div class="name">
                        <span class="optionName">디자인</span>
                        <select class="optionNum">
                          <option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
                          <option value="**" disabled>-------------------</option>
                          <option value="1">01. 적호 뚱랑이[품절]</option>
                          <option value="2">02. 백호 뚱랑이[품절]</option>
                          <option value="3">03. 흑호 뚱랑이[품절]</option>
                          <option value="4">04. 포르미</option>
                          <option value="4">05. 4종 세트 (5% OFF)</option>
                        </select> 
                      </div>
                    </li>
                  </ul>
                    <button type="button" class="btn_Delete" href="#none">삭제</button>
                </div>
              </li>
            </ul>  
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
        </div>
      </main>
    </div>
      <!-- 푸터 -->
    <%@ include file="footer.jsp" %>
  </div>
</body>
</html>	