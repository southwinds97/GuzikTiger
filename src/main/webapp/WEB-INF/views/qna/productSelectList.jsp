<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet" href="css/sub.css?v=<%= System.currentTimeMillis() %>">
</head>
<script>
	$(".select-btn").on("click", function() {
        // 선택한 상품 정보 가져오기
        var row = $(this).closest("tr");
        var img = row.data("img");
        var name = row.data("name");
        var price = row.data("price");

        // 선택된 상품 정보를 부모 창에 전달
        window.opener.document.getElementById("product-name").innerText = name;
        window.opener.document.getElementById("product-price").innerText = price + "원";
        window.opener.document.getElementById("product-img").src = "./images/productList/" + img;
        window.opener.document.getElementById("product-hiddenname").value = name; 
        window.opener.document.getElementById("product-hiddenimg").value = img; 
        window.opener.document.getElementById("product-hiddenprice").value = price; 
        window.close();
    });
</script>
<c:choose>
	<c:when test="${empty productLists}">
		<tr>
			<td colspan="3" align="center">
				조회된 상품이 없습니다.
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${productLists}" var="row">
		    <tr class="listItem" data-img="${row.img_id}" data-name="${row.product_name}" data-price="${row.price}">
		        <td class="td_img"><img src="./images/productList/${row.img_id}" alt="${row.product_name} 이미지" style="width:80px;"></td>
		        <td class="td_tit">${row.product_name} ${row.price}원</td>
		        <td><button type="button" class="select-btn">선택</button></td>
		    </tr>
		</c:forEach>
    </c:otherwise>
</c:choose>

