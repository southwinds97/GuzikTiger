document.addEventListener("DOMContentLoaded", () => {
  // 상품등록 메뉴 클릭 시 ajax로 상품등록 페이지 불러오기
  function loadProductWrite() {
    $.ajax({
      url: "productWrite.do",
      type: "GET",
      success: function (data) {
        $("#productWrite .ajax-body").html(data);
      },
      error: function (xhr, status, error) {
        console.error("AJAX Error:", status, error);
      },
    });
  }

  // 전역으로 노출할 객체와 함수
  window.listId = {
    A: "productList",
    B: "productWrite",
    C: "orderList",
    D: "memberList",
    E: "chatList",
  };

  window.listChk = function (id) {
    Object.values(listId).forEach((list) => {
      $("#" + list).hide();
    });
    $("#" + id).show();

    // 상품 등록 메뉴 클릭 시 AJAX 호출
    if (id === listId.B) {
      loadProductWrite();
    }
  };
});
