<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$('#comPassCheck').on('click', function(e) {
	    e.preventDefault();
	    let pass = prompt("비밀번호를 입력하세요:");
		let password = $(this).data('password');
		let comments = $(this).data('comments');
	    if (pass == password) {
	         $(this).html('<img src="/images/lock.gif" alt="비밀글">'+'&nbsp;&nbsp;'+comments);
	    } else {
	        alert('비밀번호가 일치하지 않습니다.');
	    }
	});
</script>
<div class="com_lists">
  <c:forEach var="comment" items="${comlists}">
    <div class="comment">
      <span class="com_user">${comment.name}</span><span>${comment.postdate}</span>
      <div class="com_content">
        <c:choose>
          <c:when test="${comment.secretYN == 'on'}">
			<c:if test="${comment.member_id == sessionScope.id}">
				<img src="/images/lock.gif" alt="비밀글"><p>${comment.comments}</p>
			</c:if>
			<c:if test="${comment.member_id != sessionScope.id}">
	            <a id="comPassCheck" href="#" data-password="${comment.password}" data-comments="${comment.comments}">
					<img src="/images/lock.gif" alt="비밀글">&nbsp;&nbsp;비밀댓글 입니다.</a>
	        </c:if>
          </c:when>
          <c:otherwise>
            <p>${comment.comments}</p>
          </c:otherwise>
        </c:choose>
      </div>
	  <c:if test="${comment.member_id == sessionScope.id}">
	      <div class="com_edit">
	        <button onclick="editComment('${comment.idx}');">수정</button>
	        <button onclick="deleteComment('${comment.idx}');">삭제</button>
	      </div>
	  </c:if>
    </div>
	<div id="editFormContainer_${comment.idx}"></div>
  </c:forEach>
</div>
<script>
function editComment(idx) {
  $.ajax({
    url: "comEdit.do",
    type: "GET",
    data: {
      idx: idx
    },
    success: function(response) {
      $('#editFormContainer_'+idx).html(response);
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