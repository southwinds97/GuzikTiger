document.addEventListener("DOMContentLoaded", () => {
    // 상품 편집 버튼 클릭 시 처리할 로직
    const editButtons = document.querySelectorAll("button");

    editButtons.forEach(button => {
        button.addEventListener("click", () => {
            alert("상품을 편집합니다.");
            // 편집 로직 추가
        });
    });
});

const listId = {A:'productList', B:'orderList', C:'memberList'};

function listChk(id){
	if(id===listId.A){
		$('#'+listId.A).show();
		$('#'+listId.B).hide();
		$('#'+listId.C).hide();
	}else if(id===listId.B){
		$('#'+listId.A).hide();
		$('#'+listId.B).show();
		$('#'+listId.C).hide();
	}else if(id===listId.C){
		$('#'+listId.A).hide();
		$('#'+listId.B).hide();
		$('#'+listId.C).show();
	}	
}