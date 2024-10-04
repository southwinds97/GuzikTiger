<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border=1>
    <colgroup>
        <col width="5%" />
        <col width="5%" />
        <col width="20%" />
        <col width="10%" />
        <col width="5%" />
        <col width="5%" />
        <col width="5%" />
        <col width="10%" />
        <col width="10%" />
        <col width="10%" />
    </colgroup>
    <thead>
        <tr>
            <th>순번</th>
            <th>상품ID</th>
            <th>상품명</th>
            <th>옵션명</th>
            <th>상품가격</th>
            <th>재고</th>
            <th>상품분류</th>
            <th>상품정보</th>
            <th>상품 등록일</th>
            <th>상품이미지</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${productList}" var="dto" varStatus="loop">
            <tr>
                <td>${startSeq + loop.index + 1}</td> <!-- 순번 표시 -->
                <td>${dto.product_id}</td>
                <td>${dto.product_name}</td>
                <td>${dto.option_id}</td>
                <td>${dto.price}</td>
                <td>${dto.stock}</td>
                <td>${dto.sub_cate}</td>
                <td>${dto.product_content}</td>
                <td>${dto.regidate}</td>
                <td style="text-align: center;">
                    <img style="width: 80%;" src="./images/productList/${dto.img_id}" alt="상품리스트">
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    ${pagingImg}