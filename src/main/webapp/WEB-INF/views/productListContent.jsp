<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
        </head>

        <body>
            <section class="list">
                <div class="inner">
                    <c:forEach items="${allLists}" var="row" varStatus="loop">
                        <div class="list_item">
                            <a href="#">
                                <div class="item_img">
                                    <img style="width : 500px" src="./images/productList/${row.img_id }" alt="상품리스트">
                                </div>
                                <div class="item_info">
                                    <strong class="item_name">${row.product_name }</strong>
                                    <span class="item_price">${row.price }</span>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <div class="btr_wrap">
                    <a href="#" class="btn_more">more&nbsp;&nbsp;&nbsp;+</a>
                </div>
            </section>
        </body>

    </html>