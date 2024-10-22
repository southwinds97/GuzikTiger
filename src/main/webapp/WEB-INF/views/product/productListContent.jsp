<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
        </head>

        <body>
            <input type="hidden" id="totalCount" value="${totalCount}">
            <section class="list">
                <div class="inner" style="padding: 0;">
                    <c:forEach items="${allLists}" var="row" varStatus="loop">
                        <div class="list_item">
                            <a href="productView.do?product_id=${row.product_id}">
                                <div class="item_img">
                                    <input type="hidden" name="product_id" value="${row.product_id}" />
                                    <img style="width : 500px" src="./images/productList/${row.img_id }" alt="상품리스트">
                                    <!-- <button class="cart_add_btn add_btn"><span class="blind">장바구니담기</span></button> -->
                                    <button class="wish_add_btn add_btn"><span class="blind">위시리스트추가</span></button>
                                </div>
                                <div class="item_info">
                                    <strong class="item_name">${row.product_name }</strong>
                                    <span class="item_price">${row.price }원</span>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <!-- 위시리스트 추가 ajax -->
                <script>
                    $(document).ready(function () {
                        $(".wish_add_btn").click(function () {
                            // a 기본 이벤트 막기
                            event.preventDefault();
                            var product_id = $(this).siblings("input[name='product_id']").val();
                            $.ajax({
                                url: "wishListAdd.do",
                                type: "post",
                                data: {
                                    product_id: product_id
                                },
                                success: function (data) {
                                    if (data.redirect) {
                                        alert(data.message);
                                        window.location.href = data.redirect;
                                    } else {
                                        alert(data.message);
                                    }
                                }
                            });
                        });
                    });
                </script>
            </section>
        </body>

    </html>