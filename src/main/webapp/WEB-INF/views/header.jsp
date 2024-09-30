<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html>
  <div id="loginModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <div id="modal-body"></div>
    </div>
  </div>

  <script>
    $(document).ready(function () {
      var modal = $('#loginModal');
      var modalContent = $('#modal-body');

      $('#login').click(function (event) {
        event.preventDefault();
        $.ajax({
          url: '/login.do',
          type: 'GET',
          success: function (data) {
            modalContent.html(data);
            modal.show();
          },
          error: function () {
            alert('로그인 페이지를 불러오는 데 실패했습니다.');
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
  </script>

  <header id="header">
    <div class="inner">
      <div class="header_left">
        <nav class="gnb_wrap">
          <ul class="gnb">
            <li>
              <a href="productList.do?category=BEST">BEST</a>
            </li>
            <li>
              <a href="productList.do?category=NEW">NEW</a>
            </li>
            <li>
              <a href="productList.do?category=mainCate">SHOP</a>
              <ul class="depth2">
                <li>
                  <a href="productList.do?category=토이/인형">토이/인형</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=피규어">피규어</a></li>
                    <li><a href="productList.do?category=인형">인형</a></li>
                    <li><a href="productList.do?category=인형쿠션">인형쿠션</a></li>
                  </ul>
                </li>
                <li>
                  <a href="productList.do?category=키링">키링</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=아크릴키링">아크릴 키링</a></li>
                    <li><a href="productList.do?category=인형키링">인형 키링</a></li>
                    <li><a href="productList.do?category=파우치키링">파우치 키링</a></li>
                  </ul>
                </li>
                <li><a href="productList.do?category=노트북/태블릿 파우치">노트북/태블릿 파우치</a></li>
                <li>
                  <a href="productList.do?category=패브릭/생활">패브릭/생활</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=패브릭소품">패브릭소품</a></li>
                    <li><a href="productList.do?category=카페트/러그">카페트/러그</a></li>
                    <li><a href="productList.do?category=쿠션">쿠션</a></li>
                    <li><a href="productList.do?category=생활용품">생활용품</a></li>
                    <li><a href="productList.do?category=마스크">마스크</a></li>
                  </ul>
                </li>
                <li>
                  <a href="productList.do?category=키친">키친</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=텀블러">텀블러</a></li>
                    <li><a href="productList.do?category=컵">컵</a></li>
                    <li><a href="productList.do?category=주방잡화">주방잡화</a></li>
                  </ul>
                </li>
                <li>
                  <a href="productList.do?category=패션잡화">패션잡화</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=지갑/파우치">지갑/파우치</a></li>
                    <li><a href="productList.do?category=가방">가방</a></li>
                    <li><a href="productList.do?category=슬리퍼">슬리퍼</a></li>
                    <li><a href="productList.do?category=슈즈악세사리">슈즈악세사리</a></li>
                    <li><a href="productList.do?category=양말">양말</a></li>
                    <li><a href="productList.do?category=뱃지">뱃지</a></li>
                  </ul>
                </li>
                <li><a href="productList.do?category=여행/캠핑">여행/캠핑</a></li>
                <li>
                  <a href="productList.do?category=문구류">문구류</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=PVC마우스패드">PVC마우스패드</a></li>
                    <li><a href="productList.do?category=극세사마우스패드">극세사마우스패드</a></li>
                    <li><a href="productList.do?category=메모지">메모지</a></li>
                    <li><a href="productList.do?category=노트">노트</a></li>
                    <li><a href="productList.do?category=필기구">필기구</a></li>
                    <li><a href="productList.do?category=필통">필통</a></li>
                  </ul>
                </li>
                <li>
                  <a href="productList.do?category=스티커/마스킹테이프">스티커/마스킹테이프</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=리무버블 스티커">리무버블 스티커</a></li>
                    <li><a href="productList.do?category=조각 스티커">조각 스티커</a></li>
                    <li><a href="productList.do?category=씰 스티커">씰 스티커</a></li>
                    <li><a href="productList.do?category=타투 스티커">타투 스티커</a></li>
                    <li><a href="productList.do?category=마스킹테이프">마스킹테이프</a></li>
                  </ul>
                </li>
                <li>
                  <a href="productList.do?category=엽서/카드/포스터">엽서/카드/포스터</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=엽서">엽서</a></li>
                    <li><a href="productList.do?category=카드">카드</a></li>
                    <li><a href="productList.do?category=포스터">포스터</a></li>
                  </ul>
                </li>
                <li>
                  <a href="productList.do?category=폰케이스/스마트톡/스트랩">폰케이스/스마트톡/스트랩</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=폰케이스">폰케이스</a></li>
                    <li><a href="productList.do?category=모양톡">모양톡</a></li>
                    <li><a href="productList.do?category=스트랩">스트랩</a></li>
                  </ul>
                </li>
                <li>
                  <a href="productList.do?category=에어팟/버즈 케이스">에어팟/버즈 케이스</a>
                  <ul class="depth3">
                    <li><a href="productList.do?category=에어팟 케이스">에어팟 케이스</a></li>
                    <li><a href="productList.do?category=에어팟 프로 케이스">에어팟 프로 케이스</a></li>
                    <li><a href="productList.do?category=에어팟3 케이스">에어팟3 케이스</a></li>
                    <li><a href="productList.do?category=에어팟 맥스 케이스">에어팟 맥스 케이스</a></li>
                    <li><a href="productList.do?category=버즈 케이스">버즈 케이스</a></li>
                  </ul>
                </li>
                <li><a href="productList.do?category=선물세트추천">선물세트추천</a></li>
              </ul>
            </li>
            <li>
              <a href="#">COMMUNITY</a>
              <ul class="depth2">
                <li>
                  <a href="#">공지사항</a>
                </li>
                <li>
                  <a href="#">언론보도</a>
                </li>
                <li>
                  <a href="qnaList.do">Q&A</a>
                </li>
                <li>
                  <a href="#">배경화면</a>
                </li>
                <li>
                  <a href="#">베스트리뷰어</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="#">ABOUT</a>
              <ul class="depth2">
                <li>
                  <a href="#">브랜드</a>
                </li>
                <li>
                  <a href="#">캐릭터</a>
                </li>
                <li>
                  <a href="#">콜라보레이션</a>
                </li>
                <li>
                  <a href="#">Contact</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="#">오늘출발🚛</a>
            </li>
          </ul>
        </nav>
        <h1 class="logo"><a href="/"><img src="/images/logo.png" alt="무직타이거"></a></h1>
      </div>
      <div class="header_right">
        <!-- 섹션에 id값이 없는 경우 -->
        <% if (session.getAttribute("id")==null) { %>
          <a href="#" id="login">Login</a>
          /
          <a href="regist.do">Join</a>
          <% } else { %>
            <a href="myPage.do">my page</a>
            /
            <a href="logout.do">Logout</a>
            <% } %>
              <button class="search"><span class="blind">검색</span></button>
              <button class="wish"><span class="blind">위시리스트</span></button>
              <button class="cart"><span class="blind">장바구니</span></button>
      </div>
    </div>
    <div class="header_bottom">
      <div class="search_wrap">
        <input type="search" placeholder="무엇을 찾아드릴까요?">
        <div class="trend">
          <button>부끄부끄 인형</button>
          <button>키링</button>
          <button>노트북 파우치</button>
          <button>사자</button>
          <button>네임택</button>
          <button>모니터 인형</button>
          <button>폰케이스</button>
          <button>쿠션</button>
        </div>
        <button class="close_btn"><span class="blind">닫기</span></button>
      </div>
    </div>
  </header>


  </html>