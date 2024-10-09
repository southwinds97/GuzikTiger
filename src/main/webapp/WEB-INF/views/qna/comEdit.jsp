<%@ page contentType="text/html; charset=UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<form
  name="commentFrm"
  method="post"
  action="javascript:void(0);"
  onsubmit="return checkFrm(this);"
>
  <input type="hidden" value="${comment.idx}" name="idx" />
  <input type="hidden" value="${comment.board_idx}" name="board_idx" />
  <div class="comment_box">
    <textarea name="comments">${comment.comments}</textarea>
    <div class="comment_user">
      <div class="com_user_info">
        <div class="name_wrap info_wrap">
          <p>이름</p>
          <input
            type="text"
            id="userIdInput"
            value="${comment.name}"
            name="name"
          />
        </div>
        <div class="pass_wrap info_wrap">
          <p>비밀번호</p>
          <input type="password" name="password" value="${comment.password}" />
        </div>
      </div>
      <div class="pass_com">
        <input type="checkbox" name="secretYN" id="checkbox" ${comment.secretYN
        == 'on' ? 'checked' : ''} />
        <label for="checkbox">비밀댓글</label>
        (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
        <button class="com_btn" type="submit">등록</button>
      </div>
    </div>
  </div>
</form>
<script>
  function checkFrm(form) {
    var formData = $(form).serializeArray();
    var jsonData = {};
    $.each(formData, function () {
      jsonData[this.name] = this.value;
    });

    $.ajax({
      url: "comEdit.do",
      type: "POST",
      data: JSON.stringify(jsonData),
      contentType: "application/json; charset=UTF-8",
      success: function (response) {
        if (response.status === "success") {
          alert("댓글이 수정되었습니다.");
          location.reload(); // 페이지 새로고침
        } else {
          alert("댓글 수정 중 오류가 발생했습니다.");
        }
      },
      error: function (xhr, status, error) {
        console.error("댓글 수정 중 오류 발생:", error);
        alert("댓글 수정 중 오류가 발생했습니다.");
      },
    });
    return false;
  }
</script>
