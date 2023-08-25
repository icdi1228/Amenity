<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    
    


    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .cart-title {
            text-align: center;
            margin-bottom: 20px;
        }
        .product-list {
            display: flex;
            flex-direction: column;
            align-items: left;
            gap: 20px;
            padding: 20px;
        }

        .product-card {
          
            background-color: #f2f2f2;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 70%; /* Adjust the width as needed */
            box-sizing: border-box;
            transition: transform 0.2s ease-in-out;
            display: flex;
            align-items: center;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 300px;
            height: 300px;
            height: auto;
            margin-right: 20px;
        }

        .product-details {
            flex: 1;
            text-align: left;
        }

        .product-details h3 {
            text-align: left;
            margin-top: 0;
        }

        .resButton {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: inline-block;
            text-decoration: none;
            width: 300px;
        }

        .resButton:hover {
            background-color: #0056b3;
            color: white;
        }

        .selectRoom {
            float: left;
            margin-right: 20px;
            width: 20px;
            height: 20px;
        }
        .selectRoomArea {
            display: flex;
            align-items: flex-start;
            width: 50px;
        }
        .guessP{
            
            background-color: #f76484;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
            margin-bottom: 20px;
            color:white;
        }
        .Pay {
          
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #FF5C73;
            
            text-align: center;
            padding: 10px;
            box-sizing: border-box;
        }
        .Pay h3 {
            margin: 0;
            color: white;
        }
        .Pay h5 {
            margin: 10px 0;
            color: white;
        }
        .payBtn {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
          width:60%;
        }
        .payBtn:hover {
            background-color: #0056b3;
            color: white;
        }
        .delBtn{
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin:10px;
        }
        .delBtn:hover {
            background-color: #0056b3;
            color: white;
        }


        input{
            background-color:#f2f2f2;
            border:none;
        }

        .selectList {
          
          position: fixed;
          top: 30%;
          right:5%;
          width: 400px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
          text-align: center;
          padding: 10px;
          box-sizing: border-box;
      }
      #selected{
        background-color: #f2f2f2;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            transition: transform 0.2s ease-in-out;
            margin:5px;
      }

    </style>
</head>
<body>
    <nav class="cart-title">
        <h1>장바구니</h1>
        <hr>
    </nav>
    <form name="cart_toPay" method="post" action="${contextPath}/user/payment.do">
        <div class="product-list">
            <c:forEach var="cart" items="${cartList}">
                <div class="product-card">
                    <div class="selectRoomArea">
                        <input type="checkbox" class="selectRoom" data-price="${cart.price}" style="display: none;"/>
                    </div>
                    <div class="product-details">
                        <input type="hidden" name="c_id" value="${cart.c_id}"/>
                        <input type="hidden" name="c_no" value="${cart.c_no}"/>
                        <input type="hidden" name="g_no" value="${cart.g_no}"/>
                        <input type="hidden" name="company" value="${cart.company}"/>
                        <h3>${cart.company}</h3>
                        <h5>주소 | ${cart.location}</h5>
                        <hr>
                        <p><b>객실명</b> : ${cart.room}</p>
                        <p><b>가격</b> : ${cart.price} ₩</p>
                        <p><b>체크인: </b>${cart.checkIn}</p>
                        <p><b>체크아웃: </b>${cart.checkOut}</p>
                        
                    </div>
                    <img src="${contextPath}/resources/images/h1.jpg" alt="" />
                </div>
            </c:forEach>
            <div class="guessP">
                <h2>예상금액</h2>
                <p >총 상품금액 : <span id="totalExpectedPrice"></span> 원</p>
                <p>할인금액 : 0 원</p>
                <hr>
                <p>결제 예상 금액 : <span id="expectedPrice"> </span> 원
                <br>
                <p> * 쿠폰은 결제창에서 사용 가능합니다.
            </div>
        </div>
        <div class="Pay">
            <h3>총 <span id="selectCount"> </span>건</h3>
            <h5>결제 예상 금액 : <b><span id="TPrice"> </span> 원</b></h5>
            <input class="payBtn" type="submit" value="결제하기">
        </div>
        <div class="selectList">
            <h3>장바구니 삭제하기</h3>
            <div id="selected">
                <h3>선택된 항목 <span id="selectedC"> </span>건</h3>
            </div>
            <button class="delBtn" onclick="deleteSelectedItems();" >삭제하기</button>
        </div>
    </form>

    
        

    


  
</body>
</html>

<script>
    document.addEventListener("DOMContentLoaded", function () {
    const productCards = document.querySelectorAll(".product-card");

    productCards.forEach(function (card) {
        card.addEventListener("click", function () {
            // 클릭된 product-card 요소를 가져옵니다.
            const clickedCard = event.currentTarget;

            // 클릭된 product-card의 체크박스 요소를 가져옵니다.
            const checkbox = clickedCard.querySelector(".selectRoom");

            // 체크박스의 체크 상태를 변경합니다.
            checkbox.checked = !checkbox.checked;

            // 선택된 product-card의 스타일을 변경합니다.
            if (checkbox.checked) {
                clickedCard.style.backgroundColor = "#007bff"; // 선택되었을 때 배경색 변경
                clickedCard.style.color = "white"; // 선택되었을 때 텍스트 색상 변경
            } else {
                clickedCard.style.backgroundColor = "#f2f2f2"; // 선택이 해제되었을 때 배경색 변경
                clickedCard.style.color = "black"; // 선택이 해제되었을 때 텍스트 색상 변경
            }

            // 선택된 상품의 총 금액과 개수 업데이트
            updateSelectedItemCountAndPrice();
        });
    });
});

function updateSelectedItemCountAndPrice() {
    const checkboxes = document.querySelectorAll(".selectRoom");
    let totalSelectedPrice = 0;
    let selectedItemCount = 0;

    checkboxes.forEach(function (checkbox) {
        if (checkbox.checked) {
            const price = parseInt(checkbox.getAttribute("data-price"));
            totalSelectedPrice += price;
            ++selectedItemCount;
        }
    });

    // 선택된 상품의 총 금액과 개수 업데이트
    document.getElementById("expectedPrice").textContent = totalSelectedPrice;
    document.getElementById("selectCount").textContent = selectedItemCount;
    document.getElementById("selectedC").textContent = selectedItemCount;
    document.getElementById("TPrice").textContent = totalSelectedPrice;
    document.getElementById("totalExpectedPrice").textContent = totalSelectedPrice;
}
</script>

<script>
    
    function deleteSelectedItems() {

        event.preventDefault(); 
        
    const checkboxes = document.querySelectorAll(".selectRoom");
    const selectedItems = [];

    checkboxes.forEach(function (checkbox) {
        if (checkbox.checked) {
            const c_id = checkbox.parentElement.nextElementSibling.querySelector("input[name='c_id']").value;
            // 선택된 항목의 고유 ID (예: c_id)를 가져와서 배열에 추가
            selectedItems.push(c_id);
        }
    });

    // 선택된 항목을 JSON 형식으로 변환하여 서버로 전송
    const selectedItemsJSON = JSON.stringify(selectedItems);
    // 서버로 선택된 항목을 보내는 코드 (AJAX 등을 사용)
    // 예: fetch 또는 jQuery.ajax를 사용하여 서버로 데이터를 전송
    fetch("${contextPath}/user/delCart.do", {
        method: "POST",
        body: selectedItemsJSON,
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (response) {
        if (response.ok) {
            // 성공적으로 삭제되었을 때의 처리
            alert("선택된 항목이 삭제되었습니다.");
            location.reload(); // 페이지 새로고침 또는 다른 적절한 동작 수행
        } else {
            // 오류가 발생했을 때의 처리
            alert("삭제에 실패했습니다.");
        }
    }).catch(function (error) {
        console.error("오류 발생: ", error);
    });
}
</script>