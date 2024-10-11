$(function () {
  const header = $("#header");
  let searchActive = false;
  let scrollActive = false;

  $(function () {
    $(".gnb")
      .on("mouseenter", function () {
        $("#header").addClass("on");
      })
      .on("mouseleave", function () {
        $("#header").removeClass("on");
      });
  });

  $(document).ready(function () {
    $("#header").addClass("on");
    $("#header").on("mouseleave", function () {
      $("#header").removeClass("on");
    });

    $(document).ready(function () {
      function updateHeaderBackground() {
        if ($(".main_best").length > 0) {
          // .main_best가 있을 경우
          $("#header").css({
            background: "transparent",
            border: "none",
          });
        } else {
          // .main_best가 없을 경우
          $("#header").css({
            background: "white",
          });
        }
      }

      // 페이지 로드 시 초기 설정
      updateHeaderBackground();

      if (!!$("#header").offset()) {
        // 스크롤 이벤트 핸들러 정의
        $(window).on("scroll", function () {
          let windowTop = $(window).scrollTop();
          let gnbTop =
            $(".main_best").length > 0 ? $(".main_best").offset().top : 0;

          if ($(".main_best").length > 0) {
            // .main_best가 있을 경우
            if (gnbTop < windowTop) {
              if (!searchActive) {
                $("#header").css({
                  position: "fixed",
                  background: "white",
                  "border-bottom": "1px solid #ebebeb", // 필요 시 추가
                  "box-shadow": "rgba(0, 0, 0, 0.5)",
                  width: "100%",
                  top: 0,
                  left: 0,
                  "z-index": 9999,
                });
              }
            } else {
              if (!searchActive) {
                $("#header").css({
                  position: "fixed",
                  background: "transparent",
                  "border-bottom": "none",
                  "box-shadow": "none",
                });
              }
            }
          }
        });
      }

      // 초기 스크롤 핸들링
      $(window).trigger("scroll");
    });
    // 검색창 토글
    $(".search").on("click", function () {
      searchActive = !searchActive;

      $(".header_bottom").addClass("on");
      $("#header").css({
        background: "white",
      });
      $(".header_bottom").css({
        "border-top": "1px solid #ebebeb",
        background: "white",
      });
    });

    $(".close_btn").on("click", function () {
      searchActive = !searchActive;

      // .main_best 요소가 존재하는지 확인
      if ($(".main_best").length > 0) {
        let gnbTop = $(".main_best").offset().top;
        let windowTop = $(window).scrollTop();
        if (windowTop > gnbTop) {
          // 기준으로 설정한 스크롤 위치
          scrollActive = true; // 스크롤 활성화
        } else {
          scrollActive = false; // 스크롤 비활성화
        }
      } else {
        // .main_best 요소가 없을 때 기본값 설정
        scrollActive = false;
      }

      $(".header_bottom").removeClass("on");
      if (scrollActive) {
        $("#header").css({
          background: "white",
        });
        $(".header_bottom").css({
          "border-top": "none",
          background: "none",
        });
      } else {
        $("#header").css({
          background: "white", // 배경을 white로 설정
        });
        $(".header_bottom").css({
          "border-top": "none",
          background: "none",
        });
      }
    });
  });

  // 이벤트핸들러 안에서 this는 이벤트가 연결된 요소를 의미
  $("#header .m_gnb_btn").on("click", function () {
    // body 스크롤바 안보이게, iOS 사파리는 안됨
    $("body").toggleClass("on");
    header.toggleClass("on");
    $(this).toggleClass("on");
    $("#header .m_gnb_wrap").toggleClass("on");
  });

  $(document).ready(function () {
    $("#header .m_gnb_wrap").on("click", function (e) {
      // 닫기 버튼의 예상 크기와 위치를 정의
      const closeButtonSize = 30; // 닫기 버튼의 크기
      const closeButtonPosition = { top: 10, right: 20 }; // 닫기 버튼의 위치

      // 클릭된 위치가 닫기 버튼의 영역 내인지 확인
      const withinCloseButtonX =
        e.pageX >
          $(this).offset().left +
            $(this).outerWidth() -
            closeButtonPosition.right -
            closeButtonSize &&
        e.pageX <
          $(this).offset().left +
            $(this).outerWidth() -
            closeButtonPosition.right;
      const withinCloseButtonY =
        e.pageY > $(this).offset().top + closeButtonPosition.top &&
        e.pageY <
          $(this).offset().top + closeButtonPosition.top + closeButtonSize;

      if (withinCloseButtonX && withinCloseButtonY) {
        // 여기에 닫기 버튼 클릭 시 실행할 코드를 작성
        $("body").toggleClass("on");
        $("#header").toggleClass("on");
        $("#header .m_gnb_btn").toggleClass("on");
        $(this).toggleClass("on");
      }
    });
  });

  // 모바일 아코디언 메뉴
  $(".m_gnb>li>a").on("click", function (e) {
    e.preventDefault();

    $(this).parent().toggleClass("on");
    $(this).parent().siblings().removeClass("on");
  });

  // 메인슬라이더
  let mainSlider = new Swiper(".main_slider .swiper", {
    loop: true,
    // 슬라이드 이동 속도
    speed: 1000,
    // 마우스드래그, 모바일 swipe 끄기
    allowTouchMove: false,
    autoplay: {
      delay: 5000,
      // 슬라이더 내부 인터렉션발생시 자동재생 안멈추게
      disableOnInteraction: false,
    },
    pagination: {
      // 페이지네이션 클릭으로 이동
      clickable: true,
      el: ".swiper-pagination",
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  // 메뉴슬라이더

  // 좌우화살표를 .swiper밖으로 뺄 경우 부모이름을 적어야함
  let newSlider = new Swiper(".new_slider .swiper", {
    loop: true,
    slidesPerView: 4,
    spaceBetween: 30,
    autoplay: {
      delay: 2000,
      // 슬라이더 내부 인터렉션발생시 자동재생 안멈추게
      disableOnInteraction: false,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  //  푸터버튼
  $("#footer .family_btn ").on("click", function () {
    $(this).parent().toggleClass("on");
  });

  // 서브 모바일 탭메뉴
  $(".sub_tab2 .tab_btn ").on("click", function () {
    $(this).parent().toggleClass("on");
  });
});

// 회원가입 페이지
// register_inner 토글
$(function () {
  $(".register_inner").on("click", function () {
    $(this).toggleClass("on");
    $(".register_view").addClass("on");
  });

  //장바구니 아코디언
  $(".ec-base-fold > .title").on("click", function (e) {
    e.preventDefault();

    $(this).parent().toggleClass("on");
    $(this).parent().siblings().removeClass("on");
  });

  //뷰 아코디언
  $(".ec-base-fold > .eToggle_title").on("click", function (e) {
    e.preventDefault();
    $(this).parent().toggleClass("on");
  });

  // 메인 슬라이드
  var mainSwiper = new Swiper(".jsPrdThumbSlide", {
    navigation: {
      nextEl: ".jsThumbNext",
      prevEl: ".jsThumbPrev",
    },
    scrollbar: {
      el: ".jsThumbSlidePager",
      draggable: true,
    },
    slidesPerView: 1,
    spaceBetween: 10,
  });

  // 썸네일 슬라이드
  var thumbSwiper = new Swiper(".jsThumbNav", {
    direction: "vertical",
    slidesPerView: 4,
    spaceBetween: 10,
    slideToClickedSlide: true,
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
  });

  // 썸네일 클릭 시 메인 슬라이드 변경
  document.querySelectorAll(".list__item img").forEach(function (thumb) {
    thumb.addEventListener("click", function () {
      var index = this.getAttribute("data-slide-index");
      mainSwiper.slideTo(index);

      // current 클래스 제거
      document.querySelectorAll(".list__item").forEach(function (item) {
        item.classList.remove("current");
      });
      // 클릭된 썸네일에 current 클래스 추가
      this.parentElement.classList.add("current");
    });
  });

  // 메인 슬라이드 변경 시 썸네일 슬라이드 변경
  mainSwiper.on("slideChange", function () {
    var activeIndex = mainSwiper.activeIndex;
    thumbSwiper.slideTo(activeIndex);

    // current 클래스 제거
    document.querySelectorAll(".list__item").forEach(function (item) {
      item.classList.remove("current");
    });
    // 현재 활성화된 썸네일에 current 클래스 추가
    document
      .querySelector(`.list__item img[data-slide-index="${activeIndex}"]`)
      .parentElement.classList.add("current");
  });

  //많이 구매한 제품 슬라이더
  var individualSwiper = new Swiper(".product_relationlist .swiper-container", {
    slidesPerView: "auto",
    slidesPerView: 4,
    spaceBetween: 10,
    navigation: {
      nextEl: ".prd-nav--next",
      prevEl: ".prd-nav--prev",
    },
  });
});
