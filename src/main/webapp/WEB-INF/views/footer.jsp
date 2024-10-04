<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>


    <footer id="footer">
        <div class="footer_wrap">
            <div class="footer_left">
                <div class="family_wrap">
                    <a class="logo" href="index.html">
                        <img src="images/logo.png" alt="무직타이거">
                    </a>
                    <p class="copyright">Copyright © MUZIKTIGER. All rights reserved.</p>
                    <div class="family_wrap">
                        <button class="family_btn" type="button">About</button>
                        <ul class="family">
                            <li><a href="#" target="_blank" title="새창 열림">Privacy policy</a></li>
                            <li><a href="#" target="_blank" title="새창 열림">Agreement</a></li>
                            <li><a href="#" target="_blank" title="새창 열림">Guide</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer_right">
                <div class="customer_center">
                    <h3>Customer center</h3>
                    <p>070-7788-9849</p>
                    <p>MON - FRI : 10:00 - 19:00</p>
                    <p>SAT, SUN, Holiday OFF</p>
                </div>
                <div class="com_info">
                    <h3>Company info</h3>
                    <p class="address">
                        상호명 : 주식회사 스튜디오무직<br />
                        대표 : 송의섭<br />
                        주소 : 경기 성남시 분당구 황새울로 132번길 34, 지하 1층(정자동)<br />
                        사업자 등록번호: 192-81-02515<br />
                        통신판매신고번호: 제2022-성남분당A-0057<br />
                        이메일: muziktiger@muziktiger.com<br />
                    </p>
                </div>
                <div class="shop_menu">
                    <h3>Shop menu</h3>
                    <ul class="shop">
                        <li>
                            <a href="#">Notice</a>
                        </li>
                        <li>
                            <a href="#">My page</a>
                        </li>
                        <li>
                            <a href="#">Q&A</a>
                        </li>
                        <li>
                            <a href="#">FAQ</a>
                        </li>
                    </ul>
                </div>
                <div class="follow_us">
                    <h3>Follow us</h3>
                    <ul class="follow">
                        <li>
                            <a href="#">Instagram</a>
                        </li>
                        <li>
                            <a href="#">Smartstore</a>
                        </li>
                        <li>
                            <a href="#">Twitter</a>
                        </li>
                        <li>
                            <a href="#">Newsletter</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 푸터 챗 아이콘(Fix) -->
            <div class="footer_chat">
                <c:choose>
                    <c:when test="${sessionScope.id != null}">
                        <a href="#" class="chatting_btn" id="chattingId_btn">
                            <img src="images/chaticon.png" alt="챗 아이콘" style="max-width: 150%;">
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="#" class="chatting_btn" id="chattingNId_btn">
                            <img src="images/chaticon.png" alt="챗 아이콘" style="max-width: 150%;">
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
        <!-- 채팅창 모달창으로 띄우기(chat_btn 클릭시) -->
        <div class="chat_modal" style="display: none; width: 500px; height: 700px;">
            <iframe id="chat_iframe" src="#" frameborder="0" width="100%" height="100%"></iframe>
        </div>
        <script>
            $(document).ready(function () {
                $("#chattingId_btn").click(function (event) {
                    event.preventDefault();
                    $(".chat_modal").show();
                    var roomId = '<%= session.getAttribute("id") %>';
                    var userId = '<%= session.getAttribute("id") %>';

                    $("#chat_iframe").attr("src", "chat/talk?roomId=" + roomId + "&userId=" + userId);
                });

                // 모달 창을 클릭하면 닫기
                $(".chat_modal").click(function () {
                    $(".chat_modal").hide();
                    $("#chat_iframe").attr("src", ""); // iframe src 초기화
                });

                // iframe 내부에서 부모 창으로 메시지를 보내면 모달 창을 닫기
                window.addEventListener("message", function (event) {
                    if (event.data === "closeModal") {
                        $(".chat_modal").hide();
                        $("#chat_iframe").attr("src", ""); // iframe src 초기화
                    }
                });
            });
        </script>

        <script>
            // chattingId_btn 이 버튼 클릭시 alert로 로그인 해주세요 띄우기
            $("#chattingNId_btn").click(function () {
                alert("로그인 후 이용해주세요.");
            });

        </script>

    </footer>

    </html>