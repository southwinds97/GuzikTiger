$(function () {
  const header = $('#header');
  let searchActive = false;
  let scrollActive = false;

  $(function () {
    $('.gnb')
      .on('mouseenter', function () {
        $('#header').addClass('on');
      })
      .on('mouseleave', function () {
        $('#header').removeClass('on');
      });
  });

  $(document).ready(function () {
    $('#header').addClass('on');
    $('#header').on('mouseleave', function () {
      $('#header').removeClass('on');
    });

    // 헤더메뉴 고정
    $(window).on('resize', function () {
      let w = $(this).outerWidth();

      if (w < 1201) {
        $(window).off('scroll').on('scroll', function () { });
      } else {
        if (!!$('#header').offset()) {
          // .main_best 요소가 존재하는지 확인
          if ($('.main_best').length > 0) {
            let gnbTop = $('.main_best').offset().top;
            $(window).on('scroll', function () {
              let windowTop = $(window).scrollTop();
              if (gnbTop < windowTop) {
                if (!searchActive) {
                  scrollActive = true;
                  $('#header').css({
                    position: 'fixed',
                    top: 0,
                    left: 0,
                    'z-index': 9999,
                    background: 'white',
                    'border-bottom': '1px solid #ebebeb',
                    width: '100%',
                    'box-shadow': 'rgba(0, 0, 0, 0.5)',
                  });
                }
              } else {
                if (!searchActive) {
                  scrollActive = false;
                  $('#header').css({
                    position: 'fixed',
                    background: 'none',
                    'border-bottom': 'none',
                    'box-shadow': 'none',
                  });
                }
              }
            });
          } else {
            // .main_best 요소가 없을 때 기본 동작 설정
            $('#header').css({
              background: 'white', // 배경을 white로 설정
            });
            $(window).on('scroll', function () {
              let windowTop = $(window).scrollTop();
              if (windowTop > 0) {
                if (!searchActive) {
                  scrollActive = true;
                  $('#header').css({
                    position: 'fixed',
                    top: 0,
                    left: 0,
                    'z-index': 9999,
                    background: 'white',
                    'border-bottom': '1px solid #ebebeb',
                    width: '100%',
                    'box-shadow': 'rgba(0, 0, 0, 0.5)',
                  });
                }
              } else {
                if (!searchActive) {
                  scrollActive = false;
                  $('#header').css({
                    position: 'fixed',
                    background: 'white', // 배경을 white로 설정
                    'border-bottom': 'none',
                    'box-shadow': 'none',
                  });
                }
              }
            });
          }
        }
      }
    });

    // 검색창 토글
    $('.search').on('click', function () {
      searchActive = !searchActive;

      $('.header_bottom').addClass('on');
      $('#header').css({
        background: 'white',
      });
      $('.header_bottom').css({
        'border-top': '1px solid #ebebeb',
        background: 'white',
      });
    });

    $('.close_btn').on('click', function () {
      searchActive = !searchActive;

      // .main_best 요소가 존재하는지 확인
      if ($('.main_best').length > 0) {
        let gnbTop = $('.main_best').offset().top;
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

      $('.header_bottom').removeClass('on');
      if (scrollActive) {
        $('#header').css({
          background: 'white',
        });
        $('.header_bottom').css({
          'border-top': 'none',
          background: 'none',
        });
      } else {
        $('#header').css({
          background: 'white', // 배경을 white로 설정
        });
        $('.header_bottom').css({
          'border-top': 'none',
          background: 'none',
        });
      }
    });
  });

  // 이벤트핸들러 안에서 this는 이벤트가 연결된 요소를 의미
  $('#header .m_gnb_btn').on('click', function () {
    // body 스크롤바 안보이게, iOS 사파리는 안됨
    $('body').toggleClass('on');
    header.toggleClass('on');
    $(this).toggleClass('on');
    $('#header .m_gnb_wrap').toggleClass('on');
  });

  $(document).ready(function () {
    $('#header .m_gnb_wrap').on('click', function (e) {
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
        $('body').toggleClass('on');
        $('#header').toggleClass('on');
        $('#header .m_gnb_btn').toggleClass('on');
        $(this).toggleClass('on');
      }
    });
  });

  // 모바일 아코디언 메뉴
  $('.m_gnb>li>a').on('click', function (e) {
    e.preventDefault();

    $(this).parent().toggleClass('on');
    $(this).parent().siblings().removeClass('on');
  });

  // 메인슬라이더
  let mainSlider = new Swiper('.main_slider .swiper', {
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
      el: '.swiper-pagination',
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

  // 메뉴슬라이더

  // 좌우화살표를 .swiper밖으로 뺄 경우 부모이름을 적어야함
  let newSlider = new Swiper('.new_slider .swiper', {
    loop: true,
    slidesPerView: 4,
    spaceBetween: 30,
    autoplay: {
      delay: 2000,
      // 슬라이더 내부 인터렉션발생시 자동재생 안멈추게
      disableOnInteraction: false,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

  //  푸터버튼
  $('#footer .family_btn ').on('click', function () {
    $(this).parent().toggleClass('on');
  });

  // 서브 모바일 탭메뉴
  $('.sub_tab2 .tab_btn ').on('click', function () {
    $(this).parent().toggleClass('on');
  });
});

// 회원가입 페이지
// register_inner 토글
$(function () {
  $('.register_inner').on('click', function () {
    $(this).toggleClass('on');
    $('.register_view').addClass('on');
  });

  //장바구니 아코디언
  $('.ec-base-fold > .title').on('click', function (e) {
    e.preventDefault();

    $(this).parent().toggleClass('on');
    $(this).parent().siblings().removeClass('on');
  });



});
