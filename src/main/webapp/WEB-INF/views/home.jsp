<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
      <!-- 라이브러리 -->
      <link rel="stylesheet" href="css/jquery-ui.min.css">
      <link rel="stylesheet" href="css/swiper-bundle.min.css" />
      <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
      <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
      <script src="js/jquery-3.7.1.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/swiper-bundle.min.js"></script>
      <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
    </head>

    <body>
      <div id="skip_navi">
        <a href="#container">본문바로가기</a>
      </div>

      <div id="wrap">

        <!-- 헤더 -->
        <%@ include file="header.jsp" %>
          <!-- 메인 -->
          <main id="container">
            <section class="main_slider">
              <h2 class="blind">메인 슬라이더</h2>
              <div class="swiper-container">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <a href="#">
                      <img class="pc_img" src="images/man_visual1_p.png" alt="">
                      <img class="m_img" src="images/man_visual1_m.jpg" alt="">
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="#">
                      <img class="pc_img" src="images/man_visual2_p.png" alt="">
                      <img class="m_img" src="images/man_visual2_m.jpg" alt="">
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="#">
                      <img class="pc_img" src="images/man_visual3_p.png" alt="">
                      <img class="m_img" src="images/man_visual3_m.jpg" alt="">
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="#">
                      <img class="pc_img" src="images/man_visual4_p.png" alt="">
                      <img class="m_img" src="images/man_visual4_m.jpg" alt="">
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="#">
                      <img class="pc_img" src="images/man_visual5_p.png" alt="">
                      <img class="m_img" src="images/man_visual4_m.jpg" alt="">
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="#">
                      <img class="pc_img" src="images/man_visual6_p.png" alt="">
                      <img class="m_img" src="images/man_visual4_m.jpg" alt="">
                    </a>
                  </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev arrow_btn"></div>
                <div class="swiper-button-next arrow_btn"></div>
              </div>
              <script>
                const swiper = new Swiper('.swiper-container', {
                  grabCursor: true,
                  draggable: true,
				  allowTouchMove: false,
                  speed: 1000,
                  loop: true,
                  effect: 'fade',
                  fadeEffect: { crossFade: true },
                  preloadImages: false,
				  autoplay: {
			        delay: 5000,
			        // 슬라이더 내부 인터렉션발생시 자동재생 안멈추게
			        disableOnInteraction: false,
			      },
                  lazy: {
                    loadOnTransitionStart: true,
                    loadPrevNext: true,
                  },
                  pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                  },
                  navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                  },
                });
              </script>
            </section>
            <section class="main_best main_item">
              <div class="inner">
                <div class="main_top">
                  <div class="tit_wrap">
                    <h2>BEST</h2>
                    <p>인기 폭발 뚱랑이를 만나보랑구</p>
                  </div>
                  <ul class="list">
                    <c:forEach items="${bestLists }" var="row" varStatus="loop">
                      <li>
                        <a href="productView.do?product_id=${row.product_id}">
                          <div class="img_wrap">
                            <img style="width : 500px" src="./images/productList/${row.img_id }" alt="상품리스트">
                            <input type="hidden" name="product_id" value="${row.product_id}" />
                            <button class="cart_add_btn add_btn"><span class="blind">장바구니담기</span></button>
                            <button class="wish_add_btn add_btn"><span class="blind">위시리스트추가</span></button>
                          </div>
                        </a>
                        <a href="#">
                          <div class="txt_wrap">
                            <strong>
                              ${row.product_name }
                              <br /> ${row.price }원
                            </strong>
                          </div>
                        </a>
                      </li>
                    </c:forEach>
                  </ul>
                  <!-- 위시리스트 추가 ajax -->
                  <script>
                    $(document).ready(function () {
                      $(".wish_add_btn").click(function () {
                        // a 기본 이벤트 막기
                        event.preventDefault();
                        var product_id = $(this).siblings("input[name='product_id']").val();
                        $.ajax({
                          url: "wishListAdd.do",
                          type: "post",
                          data: {
                            product_id: product_id
                          },
                          success: function (data) {
                            if (data.redirect) {
                              alert(data.message);
                              window.location.href = data.redirect;
                            } else {
                              alert(data.message);
                            }
                          }
                        });
                      });
                    });
                  </script>

                  <button class="move_btn">more +</button>
                  <!-- 이동 -->
                  <script>
                    $(document).ready(function () {
                      $(".move_btn").click(function () {
                        location.href = "productList.do?category=BEST";
                      });
                    });
                  </script>
                </div>
              </div>
            </section>
            <img class="discount" src="images/discount.jpg" alt="공식 온라인몰 회원 혜택">
            <div class="char_gif">
              <a class="gif_img" href="#"><img src="images/main_gif.gif" alt="캐릭터소개"></a>
            </div>
            <section class="main_new main_item">
              <div class="inner">
                <div class="main_top">
                  <div class="tit_wrap">
                    <h2>NEW</h2>
                    <p>새로운 뚱랑이를 만나보랑구</p>
                  </div>
                </div>
                <div class="new_slider_wrap">
                  <div class="new_slider">
                    <div class="swiper">
                      <div class="swiper-wrapper">

                        <c:forEach items="${newLists }" var="row" varStatus="loop">
                        
                          <div class="swiper-slide">
                            <a href="productView.do?product_id=${row.product_id}">
                              <div class="img_wrap">
                                <img style="width : 500px" src="./images/productList/${row.img_id }" alt="상품리스트">
                              </div>
                              <div class="txt_wrap">
                                <strong>
                                  ${row.product_name }
                                  <br /> ${row.price }원
                                </strong>
                              </div>
                            </a>
                          </div>
                        </c:forEach>



                      </div>
                      <div class="swiper-button-prev arrow_btn"></div>
                      <div class="swiper-button-next arrow_btn"></div>
                    </div>
                  </div>
                </div>
              </div>
            </section>
            <section class="main_instagram">
              <div class="main_top">
                <div class="tit_wrap">
                  <h2>INSTAGRAM</h2>
                  <p>@muziktiger</p>
                </div>
              </div>
              <ul class="insta">
                <li>
                  <a href="#">
                    <img src="/images/insta1.jpg" alt="인스타1">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta2.jpg" alt="인스타2">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta3.jpg" alt="인스타3">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta4.jpg" alt="인스타4">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta5.jpg" alt="인스타5">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta6.jpg" alt="인스타6">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta7.jpg" alt="인스타7">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta8.jpg" alt="인스타8">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta9.jpg" alt="인스타9">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta10.jpg" alt="인스타10">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta11.jpg" alt="인스타11">
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/images/insta12.jpg" alt="인스타12">
                  </a>
                </li>
              </ul>
            </section>
          </main>
          <!-- 푸터 -->
          <%@ include file="footer.jsp" %>
      </div>
    </body>

  </html>