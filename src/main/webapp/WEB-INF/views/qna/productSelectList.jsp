<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<tr class="listItem" data-img="${row.img_id}" data-name="${row.product_name}"
						data-price="${row.price}">
						<td class="td_img"><img src="./images/productList/${row.img_id}" alt="${row.product_name} 이미지"
								style="width:80px;"></td>
						<td class="td_tit">${row.product_name} ${row.price}원</td>
						<td><button type="button" class="select-btn">선택</button></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>