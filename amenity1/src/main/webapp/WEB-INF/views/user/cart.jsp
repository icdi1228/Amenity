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
            align-items: center;
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
        input{
            background-color:#f2f2f2;
            border:none;
        }
    </style>
</head>
<body>
    <nav class="cart-title">
        <h1>장바구니</h1>
        <hr>
    </nav>
    <form name="cart_toPay" method="post" action="${contextPath}#">
        <div class="product-list">
            <c:forEach var="cart" items="${cartList}">
                <div class="product-card">
                    <div class="selectRoomArea">
                        <input type="checkbox" class="selectRoom" data-price="${cart.price}"/>
                    </div>
                    <div class="product-details">
                        <input type="hidden" name="c_no" value="${cart.c_no}"/>
                        <input type="hidden" name="g_no" value="${cart.g_no}"/>
                        <h3><input type="text" name="company" value="${cart.company}"/></h3>
                        <h5>주소 | ${cart.location}</h5>
                        <hr>
                        <p><b>객실명</b> : ${cart.room}</p>
                        <p><b>가격</b> : ${cart.price} ₩</p>
                        
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
            <h5>결제 예상 금액 : <b><span id="totalExpectedPrice"> </span> 원</b></h5>
            <input class="payBtn" type="submit" value="결제하기">
        </div>
    </form>
  
</body>
</html>

<script>
    // 페이지가 로드될 때 실행되는 함수
    document.addEventListener("DOMContentLoaded", function () {
        // 모든 체크박스 엘리먼트 가져오기
        const checkboxes = document.querySelectorAll(".selectRoom");
        // 선택된 상품의 총 금액을 저장할 변수 초기화
        let totalSelectedPrice = 0;
        // 선택된 상품의 개수를 저장할 변수 초기화
        let selectedItemCount = 0;

        // 각 체크박스에 이벤트 리스너 추가
        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener("change", function () {
                // 체크박스의 data-price 속성을 이용하여 상품 가격 가져오기
                const price = parseInt(checkbox.getAttribute("data-price"));

                // 체크박스의 체크 여부에 따라 금액을 추가하거나 제거
                if (checkbox.checked) {
                    totalSelectedPrice += price;
                    selectedItemCount++;
                } else {
                    totalSelectedPrice -= price;
                    selectedItemCount--;
                }

                // 선택된 상품의 총 금액과 개수 업데이트
                document.getElementById("expectedPrice").textContent = totalSelectedPrice;
                document.getElementById("selectCount").textContent = selectedItemCount;

                // 결제 예상 금액 업데이트
                document.getElementById("totalExpectedPrice").textContent = totalSelectedPrice;
            });
        });
    });
</script>
