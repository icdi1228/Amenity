<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 

<%
  request.setCharacterEncoding("UTF-8");
%> 


<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        .out {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .out2 {
            max-width: 800px;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .out3 {
            max-width: 800px;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .box {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
        }
        

        .box h3, .box h4 {
            margin-top: 0;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 10px;
        }

        .btn {
            width: 150px;
            height: 50px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        input[type="radio"] {
            margin-right: 10px;
        }
        .numberInput {
            text-align: center;
            margin-left: 10px;
        }
        .al_use {
            border-radius: 5px;
            color:white;
            background-color: black;
            margin-left: 10px;
        }

    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript"> 
        function backToList(obj) {
            obj.action="${contextPath}/main/productList.do";
            obj.submit();
        }

        const num_in = document.querySelector(".numberInput");

        function checkInput(inputElement) {
        var input = inputElement.value;

        if (isNaN(input)) {
            alert("숫자로 입력해주세요");
            return false;
        } else {
            return true;
        }
    }

    function al_use(){
        var userPoint = '${userVO.mileage}';  
        var totalPrice = 0;
        var numberInput = document.querySelector(".numberInput");

        <c:forEach var="item" items="${goods}">
            totalPrice += parseInt('${item.price}');
        </c:forEach>

        if (userPoint > totalPrice) {
            userPoint = totalPrice;
        }

        numberInput.value = userPoint; 
        checkInput(numberInput, document.getElementById("pointErrorMessage"));

    }

    function openPopupAndNavigate(link) {
        var popupWindow = window.open(link, '_blank', 'width=800, height=600');
        
        popupWindow.onload = function() {
            popupWindow.location.href = link;
        };
    }

    function checkMyPoint(){
        var userPoint = '${userVO.mileage}'; 
        var numberInput = document.querySelector(".numberInput");
        var totalPrice = 0;

        <c:forEach var="item" items="${goods}">
            totalPrice += parseInt('${item.price}');
        </c:forEach>

        if (parseInt(numberInput.value) > userPoint) { 
            if(parseInt(numberInput.value) > totalPrice){
                numberInput.value = totalPrice; 

            }
            return false;
        }

        if(parseInt(numberInput.value) > totalPrice){
            numberInput.value = totalPrice;  
        }

        checkInput(numberInput, document.getElementById("pointErrorMessage"));
    }
    



    </script>
    <title>Payment</title>
</head>
<body>
    <!-- ${goods[0].price} -->
    <form action="${contextPath}/user/payComplete.do">

        
    <div class="out">
        <!-- 예약자 정보 -->
        <div class="box">
            <h3>예약자 정보</h3>
            <table>
                <tr>
                    <td>이름</td>
                    <td>${userVO.name}</td>
                </tr>
                <tr>
                    <td>휴대폰번호</td>
                    <td>${userVO.tel1} - ${userVO.tel2} - ${userVO.tel3}</td>
                </tr>
            </table>
        </div>

        <!-- 숙소 정보 -->
    <div class="box">
        <h3>숙소 정보</h3> 
        <table>
            <c:forEach var="goods" items="${goods}">
                
                 <tr>
                    <td>업체명 :</td>
                    <td><b>${goods.company}</b></td>
                </tr>

                <tr>
                    <td>숙소이름 :</td>
                    <td>${goods.room}</td>
                </tr>

                <tr>
                    <td>가격</td>
                    <td>${goods.price} 원</td>
                </tr>
            </c:forEach>    
        </table>
    </div>


        <!-- 할인 수단 선택 -->
        <div class="box">
            <h3>할인 수단 선택</h3>
            <table>

                <tr>
                    <td>쿠폰</td>   
                    
                    <td>
                        <button style="background-color: white;" onclick="openPopupAndNavigate('${contextPath}/user/couponbox.do'); return false;">
                            <span style="color: black; text-decoration:none;">쿠폰함</span>
                        </button>
                    </td>
                    
                </tr>

                <tr aria-colspan="3">
                    <td>쿠폰번호</td>
                    <td>
                        <input type="text" name="couponeid" placeholder="AAAA-BBBB-CCCC-DDDD">
                        <button onclick="return false;"><b>적용</b></button>
                    </td>
                </tr>

                <tr>
                    <td>쿠폰 할인금액</td>
                    <td>coupon.disprice goods.selectedPrice </td>
                </tr>

                <tr>
                    <td> 내 포인트 </td>
                    <td> ${userVO.mileage} Point </td>
                </tr>

                <tr>

                    <td>
                        사용할 포인트
                    </td>

                    <td>
                        <form method="post">
                            <input type="text" class="numberInput" size="20" name="numberInput" 
                                   onblur="checkMyPoint()" placeholder="숫자로 기재해주세요" oninput="checkInput(this, document.getElementById('pointErrorMessage'))"> 
                            <button type="button" class="al_use" onclick="al_use()">모두 사용</button>
                        </form>
                    </td>
                </tr>

                <tr>
                    <td>잔여 포인트</td>
                    <td> </td>
                </tr>


                <tr>
                    <td>총 할인 금액</td>
                    <td>total_dis</td>
                </tr>
            </table>
        </div>

        
    </div>

    <div class="out2">
        <!-- 결제 금액 -->
        <div class="box">
            <h3>결제금액</h3>
            <c:forEach var="goods" items="${goods}">
                <p>가격 ${goods.price}원</p>
            </c:forEach>
            <p>할인금액 {total_dis}</p>
            <p id="pointDisplay">포인트 <span id="pointValue">0</span>Point</p>
            <hr>
            <strong>총 결제 금액</strong> {goods.price} - ${coupon.disprice} - ${user.point} 원
        </div>

        <!-- 결제 수단 선택 -->
        <div class="box">
            <h4>결제 수단 선택</h4>
            <table>
                <tbody>
                    <tr>
                        <td><input type="radio" name="pay" value="kakao"/><img src="#" alt="">카카오 페이</td>
                        <td><input type="radio" name="pay" value="card"/><img src="#" alt="">카드 결제</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="pay" value="toss"/><img src="#" alt="">토스 페이</td>
                        <td><input type="radio" name="pay" value="naver"/><img src="#" alt="">네이버 페이</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="out3">
        <!-- 돌아가기 & 가입하기 버튼 -->
        <div class="box">
            <table>
                <tr>
                    <td>
                        <input type="button" class="btn" value="돌아가기" onClick="backToList(this.form)" />
                    </td>
                    <td>
                        <input type="submit" class="btn" value="결제하기" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>
</body>
<script>
    // 적립금 (밑에 안쓰면 안나옴)
    const pointValueElement = document.getElementById("pointValue");
    var goodsPrice = 0;
    <c:forEach var="item" items="${goods}">
        goodsPrice = ${item.price}; 
    </c:forEach>
    console.log(goodsPrice);
    const pointValue = parseInt(goodsPrice / 100); 
    console.log(pointValue);
    
    if (pointValueElement) {
        pointValueElement.textContent = pointValue;
    } 
    else {
        console.log("pointValueElement not found"); 
    }
    

</script>
</html>
