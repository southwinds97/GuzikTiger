document.addEventListener("DOMContentLoaded", function () {
  const selectElement = document.getElementById("option1");
  const tbodyElement = document.querySelector("tbody.option_products");
  const totalPriceElement = document.querySelector(
    "#totalPrice .total strong em"
  );
  const totalQuantityElement = document.querySelector("#totalPrice .total"); // (0개) 부분을 포함하는 요소
  const insufficientPriceElement = document.querySelector(".insufficientPrice"); // 무료배송 부분을 포함하는 요소
  const text1Element = document.querySelector(".text1");
  const text2Element = document.querySelector(".text2");
  const levelLineActiveElement = document.getElementById("levelLineActive"); // width를 동적으로 변경할 요소
  let productViewList = [];
  let basePrice = 50000; // 무료배송 기준 금액

  // AJAX 요청을 통해 JSON 데이터를 가져옴
  const productId = new URLSearchParams(window.location.search).get(
    "product_id"
  );
  fetch(`/productViewJson.do?product_id=${productId}`)
    .then((response) => response.json())
    .then((data) => {
      productViewList = data;
      console.log("Product data loaded:", productViewList);
    })
    .catch((error) => {
      console.error("Error fetching product data:", error);
    });

  function updateTotal() {
    let currentTotalPrice = 0;
    let currentTotalQuantity = 0;
    document.querySelectorAll(".option_product").forEach((row) => {
      const price = parseInt(row.querySelector(".option_box_price").value);
      const quantity = parseInt(row.querySelector(".quantity_opt").value);
      currentTotalPrice += price * quantity;
      currentTotalQuantity += quantity;

      // 개별 상품의 총 가격 업데이트
      const totalPriceElement = row.querySelector(
        ".ec-front-product-item-price"
      );
      totalPriceElement.textContent =
        (price * quantity).toLocaleString() + "원";

      // 개별 상품의 적립금 업데이트
      const mileageElement = row.querySelector(".mileage_price");
      const mileage = Math.floor(price * quantity * 0.05);
      mileageElement.textContent = mileage.toLocaleString() + "원";
    });
    if (totalPriceElement) {
      totalPriceElement.textContent = currentTotalPrice.toLocaleString() + "원";
    }
    if (totalQuantityElement) {
      totalQuantityElement.innerHTML = `<strong><em>${currentTotalPrice.toLocaleString()}원</em></strong> (${currentTotalQuantity}개)`;
    }
    if (insufficientPriceElement) {
      const remainingPrice = basePrice - currentTotalPrice;
      insufficientPriceElement.textContent =
        remainingPrice > 0 ? remainingPrice.toLocaleString() : "0";
      if (remainingPrice <= 0) {
        text1Element.style.display = "none";
        text2Element.style.display = "block";
      } else {
        text1Element.style.display = "block";
        text2Element.style.display = "none";
      }
    }
    if (levelLineActiveElement) {
      const widthPercentage = Math.min(
        (currentTotalPrice / basePrice) * 100,
        100
      );
      levelLineActiveElement.style.width = widthPercentage + "%";
    }
  }

  selectElement.addEventListener("change", function () {
    const selectedValue = selectElement.value;
    if (selectedValue !== "*") {
      const selectedText =
        selectElement.options[selectElement.selectedIndex].text;
      const selectedProduct = productViewList[selectedValue - 1]; // 선택된 제품 정보 가져오기
      const price = parseInt(selectedProduct.price.replace(/,/g, "")); // 가격에서 쉼표 제거 후 정수로 변환
      const mileage = Math.floor(price * 0.05); // 가격의 5% 계산
      const selectedProducts = []; // 선택된 제품 정보를 담을 배열
      // 선택된 제품 정보를 배열에 추가
      selectedProducts.push({ selectedProduct });
      console.log(selectedProducts);

      //   console.log("선택된 값:", selectedValue);
      console.log("선택된 텍스트:", selectedText); // 선택된 텍스트를 콘솔에 출력하여 확인
      //   console.log("선택된 제품:", selectedProduct); // 선택된 제품 정보를 콘솔에 출력하여 확인
      //   console.log("계산된 적립금:", mileage); // 계산된 적립금을 콘솔에 출력하여 확인

      const newRow = document.createElement("tr");
      newRow.className = "option_product";
      newRow.innerHTML = `
        <td>
          <p class="product">
            ${selectedProduct.product_name}
            <br>
            -
            <span>${selectedText}</span>
          </p>
        </td>
        <td>
          <span class="quantity" style="width: 65px;">
            <input type="text" id="option_box${selectedValue}_quantity" name="quantity"
              class="quantity_opt eProductQuantityClass" value="1">
            <a href="#none" class="up eProductQuantityUpClass">
              <img src="images/btn_count_up.gif" id="option_box${selectedValue}_up" class="option_box_up"
                alt="수량증가">
            </a>
            <a href="#none" class="down eProductQuantityDownClass">
              <img src="images/btn_count_down.gif" id="option_box${selectedValue}_down"
                class="option_box_down" alt="수량감소">
            </a>
          </span>
          <a href="#none" class="delete">
            <img src="images/btn_delete.gif" id="option_box${selectedValue}_del" class="option_box_del"
              alt="삭제">
          </a>
        </td>
        <td class="right">
          <span id="option_box${selectedValue}_price">
            <input type="hidden" class="option_box_price" value="${price}">
            <span class="ec-front-product-item-price">${price.toLocaleString()}원</span>
          </span>
          <span class="mileage">
            (
            <img src="images/ico_product_point.gif" alt="적립금">
            <span id="option_box${selectedValue}_mileage" class="mileage_price">${mileage.toLocaleString()}</span>
            )
          </span>
        </td>
      `;
      tbodyElement.appendChild(newRow);

      // 수량 증가 버튼 이벤트 리스너
      newRow.querySelector(".up").addEventListener("click", function () {
        const quantityInput = newRow.querySelector(".quantity_opt");
        let quantity = parseInt(quantityInput.value);
        quantityInput.value = quantity + 1;
        updateTotal();
      });

      // 수량 감소 버튼 이벤트 리스너
      newRow.querySelector(".down").addEventListener("click", function () {
        const quantityInput = newRow.querySelector(".quantity_opt");
        let quantity = parseInt(quantityInput.value);
        if (quantity > 1) {
          quantityInput.value = quantity - 1;
          updateTotal();
        }
      });

      // 삭제 버튼 이벤트 리스너
      newRow.querySelector(".delete").addEventListener("click", function () {
        newRow.remove();
        updateTotal();
      });

      // 총 금액 및 총 수량 업데이트
      updateTotal();

      // 밑에 코드는 JS로 처리시 중복 호출됨
      // URL에서 매개변수를 추출하는 함수 정의
      //   function getParameterByName(name, url = window.location.href) {
      //     name = name.replace(/[\[\]]/g, "\\$&");
      //     const regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
      //     const results = regex.exec(url);
      //     if (!results) return null;
      //     if (!results[2]) return "";
      //     return decodeURIComponent(results[2].replace(/\+/g, " "));
      //   }

      //   // 장바구니에 담기 버튼(#actionCart) 클릭 이벤트 처리(ajax) 배열로 담아서 전송
      //   const actionCart = document.getElementById("actionCart");
      //   let isRequestInProgress = false; // 요청 진행 중인지 확인하는 플래그

      //   actionCart.addEventListener("click", function () {
      //     if (isRequestInProgress) return; // 요청이 진행 중이면 함수 종료

      //     const productArray = [];
      //     document.querySelectorAll(".option_product").forEach((row) => {
      //       const productId = getParameterByName("product_id");
      //       const quantity = row.querySelector(".quantity_opt").value;
      //       const option_id = row
      //         .querySelector(".product span")
      //         .textContent.split(". ")[1];
      //       const number = row
      //         .querySelector(".product span")
      //         .textContent.split(". ")[0];
      //       const idx = parseInt(number, 10); // number를 idx로 변환

      //       productArray.push({
      //         product_id: productId,
      //         quantity: quantity,
      //         option_id: option_id,
      //         idx: idx,
      //       });
      //     });

      //     console.log(productArray);

      //     isRequestInProgress = true; // 요청 시작 시 플래그 설정
      //     actionCart.disabled = true; // 버튼 비활성화

      //     // ajax 요청(Json 처리 안함)
      //     $.ajax({
      //       url: "/cartInsert.do",
      //       type: "post",
      //       data: JSON.stringify(productArray),
      //       contentType: "application/json",
      //       success: function (data) {
      //         alert("장바구니에 담겼습니다.");
      //         isRequestInProgress = false; // 요청 완료 시 플래그 해제
      //         actionCart.disabled = false; // 버튼 활성화
      //       },
      //       error: function (xhr, status, error) {
      //         alert("장바구니 담기 실패");
      //         isRequestInProgress = false; // 요청 실패 시 플래그 해제
      //         actionCart.disabled = false; // 버튼 활성화
      //       },
      //     });
      //   });
    }
  });
});
