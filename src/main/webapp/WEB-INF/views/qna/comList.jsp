<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="com_lists">
  <c:forEach var="comment" items="${comlists}">
    <div class="comment">
      <span class="com_user">${comment.name}</span><span>${comment.postdate}</span>
      <div class="com_content">
        <c:choose>
          <c:when test="${comment.secretYN == 'on'}">
			<c:if test="">
				<img src="/images/lock.gif" alt="비밀글"><p>${comment.comments}</p>
			</c:if>
            <img src="/images/lock.gif" alt="비밀글"><p>비밀댓글 입니다.</p>
          </c:when>
          <c:otherwise>
            <p>${comment.comments}</p>
          </c:otherwise>
        </c:choose>
      </div>
      <div class="com_edit">
        <button onclick="editComment('${comment.idx}');">수정</button>
        <button onclick="deleteComment('${comment.idx}');">삭제</button>
      </div>
    </div>
  </c:forEach>
</div>
<div id="editFormContainer"></div>
<script>
function editComment(idx) {
  $.ajax({
    url: "comEdit.do",
    type: "GET",
    data: {
      idx: idx
    },
    success: function(response) {
      $('#editFormContainer').html(response);
    },
    error: function(xhr, status, error) {
      console.error("댓글 수정 폼을 불러오는 중 오류 발생:", error);
      alert("댓글 수정 폼을 불러오는 중 오류가 발생했습니다.");
    }
  });
}

function deleteComment(idx) {
  if (confirm("정말로 삭제하시겠습니까?")) {
    $.ajax({
      url: "comDelete.do",
      type: "POST",
      data: {
        idx: idx
      },
      success: function(response) {
        alert("댓글이 삭제되었습니다.");
        location.reload(); // 페이지 새로고침
      },
      error: function(xhr, status, error) {
        console.error("댓글 삭제 중 오류 발생:", error);
        alert("댓글 삭제 중 오류가 발생했습니다.");
      }
    });
  }
}
</script>