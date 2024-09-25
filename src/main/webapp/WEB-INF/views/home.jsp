<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>KUZIK TIGER 구직타이거</title>
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
      <div id="loginModal" class="modal">
        <div class="modal-content">
          <span class="close">&times;</span>
          <div id="modal-body"></div>
        </div>
      </div>
    <div id="wrap">

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
      <!-- 헤더 -->
      <%@ include file="header.jsp" %>
        <!-- 메인 -->
        <main id="container">
          <section class="main_slider">
            <h2 class="blind">메인 슬라이더</h2>
            <div class="swiper">
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
          </section>
          <section class="main_best main_item">
            <div class="inner">
              <div class="main_top">
                <div class="tit_wrap">
                  <h2>BEST</h2>
                  <p>인기 폭발 뚱랑이를 만나보랑구</p>
                </div>
                <ul class="list">
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST1.jpg" alt="무직타이거 부끄부끄 미니 인형 키링 6종">
                        <button class="cart_add_btn add_btn"><span class="blind">장바구니담기</span></button>
                        <button class="wish_add_btn add_btn"><span class="blind">위시리스트추가</span></button>
                      </div>
                    </a>
                    <a href="#">
                      <div class="txt_wrap">
                        <strong>
                          무직타이거 부끄부끄 미니 인형 키링 6종
                          <br /> 8,900원
                        </strong>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST2.jpg" alt="도넛 타이거 노트북 아이패드 파우치">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          도넛 타이거 노트북 아이패드 파우치
                          <br /> 42,000원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST3.jpg" alt="잇츠 오케이 노트북 아이패드 파우치">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          잇츠 오케이 노트북 아이패드 파우치
                          <br /> 36,000원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST4.jpg" alt="무직 타이거 복조리 파우치 6종">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          무직 타이거 복조리 파우치 6종
                          <br /> 17,500원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST5.jpg" alt="시팅 타이거 노트북 아이패드 스트랩 파우치 블랙">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          시팅 타이거 노트북 아이패드 스트랩 파우치 블랙
                          <br /> 41,000원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST6.jpg" alt="뚱랑이 얼굴 미니러그 2종">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          뚱랑이 얼굴 미니러그 2종
                          <br /> 36,000원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST7.jpg" alt="레이지 타이거 노트북 아이패드 파우치">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          레이지 타이거 노트북 아이패드 파우치
                          <br /> 42,000원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST8.jpg" alt="뚱랑이 스트레스볼 3종">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          뚱랑이 스트레스볼 3종
                          <br /> 15,000원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST9.jpg" alt="뚱랑이 모니터 인형 2종">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          뚱랑이 모니터 인형 2종
                          <br /> 13,800원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST10.jpg" alt="무직타이거 납작 인형 키링 4종">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          무직타이거 납작 인형 키링 4종
                          <br /> 11,500원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST11.jpg" alt="무직타이거 쫀득쫀득 모찌 인형 6종">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          무직타이거 쫀득쫀득 모찌 인형 6종
                          <br /> 17,000원
                        </strong>
                      </div>
                    </a>

                  </li>
                  <li>
                    <a href="#">
                      <div class="img_wrap">
                        <img src="images/BEST12.jpg" alt="배낭 여행 뚱랑이 네임택">
                      </div>
                      <div class="txt_wrap">
                        <strong>
                          배낭 여행 뚱랑이 네임택
                          <br /> 7,500원
                        </strong>
                      </div>
                    </a>

                  </li>
                </ul>

                <button class="move_btn">more +</button>
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
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new1.jpg" alt="new1">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              무직타이거 뚱랑이 농구공 키링
                              <br /> 7,000원
                            </strong>
                          </div>
                        </a>
                      </div>
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new2.jpg" alt="new2">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              무직타이거 뚱랑이 야구공 키링
                              <br /> 6,300원
                            </strong>
                          </div>
                        </a>
                      </div>
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new3.jpg" alt="new3">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              무직타이거 뚱랑이 테니스공 키링
                              <br /> 7,000원
                            </strong>
                          </div>
                        </a>
                      </div>
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new4.jpg" alt="new4">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              무직타이거 사자 야구 와펜 3종
                              <br /> 3,510원
                            </strong>
                          </div>
                        </a>
                      </div>
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new5.jpg" alt="new5">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              무직타이거 뚱랑이 야구 와펜 3종
                              <br /> 3,510원
                            </strong>
                          </div>
                        </a>
                      </div>
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new6.jpg" alt="new6">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              무직타이거 복조리 파우치 6종
                              <br /> 15,750원
                            </strong>
                          </div>
                        </a>
                      </div>
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new7.jpg" alt="new7">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              무직타이거 사자 페이스 모찌 쿠션
                              <br /> 37,620원
                            </strong>
                          </div>
                        </a>
                      </div>
                      <div class="swiper-slide">
                        <a href="#">
                          <div class="img_wrap">
                            <img src="images/new8.jpg" alt="new8">
                          </div>
                          <div class="txt_wrap">
                            <strong>
                              뚱랑이 얼굴 키링 3종
                              <br /> 3,600원
                            </strong>
                          </div>
                        </a>
                      </div>
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