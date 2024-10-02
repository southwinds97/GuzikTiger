document.addEventListener("DOMContentLoaded", () => {
	// 상품 편집 버튼 클릭 시 처리할 로직
	document.body.addEventListener("click", (event) => {
		if (event.target.tagName === "BUTTON") {
			alert("상품을 편집합니다.");
			// 편집 로직 추가
		}
	});
});

const listId = { A: 'productList', B: 'orderList', C: 'memberList', D: 'chatList' };

function listChk(id) {
	Object.values(listId).forEach(list => {
		$('#' + list).hide();
	});
	$('#' + id).show();
}