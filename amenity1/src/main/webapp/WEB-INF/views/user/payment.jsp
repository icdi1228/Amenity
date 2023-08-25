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

    // 모두사용 버튼
    function al_use(){
        var userPoint = '${userVO.mileage}';  
        var totalPrice = 0;
        var cou_disprice = parseInt(document.getElementById("co_dis").textContent); 
        var numberInput = document.querySelector(".numberInput");

        

        <c:forEach var="item" items="${goods}">
            totalPrice += parseInt('${item.price}');
        </c:forEach>

        if (userPoint >= (totalPrice-cou_disprice)) {
            numberInput.value = (totalPrice-cou_disprice);
            var remainingPoint = userPoint - (totalPrice-cou_disprice);
            var restPointElement = document.getElementById("rest_point");

            if(restPointElement) {
            restPointElement.textContent = remainingPoint + " Point";
            }
        }

        if ((totalPrice-cou_disprice) > userPoint) {
            numberInput.value = userPoint;
            var remainingPoint = userPoint - userPoint;
            var restPointElement = document.getElementById("rest_point");

            if(restPointElement) {
            restPointElement.textContent = remainingPoint + " Point";
            }
        }

    }

    function openPopupAndNavigate(link) {
        var popupWindow = window.open(link, '_blank', 'width=800, height=600');
        
        popupWindow.onload = function() {
            popupWindow.location.href = link;
        };
    }

    // 내포인트
    function checkMyPoint(){
        var userPoint = '${userVO.mileage}'; 
        var numberInput = document.querySelector(".numberInput");
        var totalPrice = 0;

        <c:forEach var="item" items="${goods}">
            totalPrice += parseInt('${item.price}');
        </c:forEach>

        var remainingPoint = parseInt(userPoint) - parseInt(numberInput.value);

        if (parseInt(numberInput.value) > userPoint) {
            numberInput.value =  userPoint;
            if(parseInt(numberInput.value) > totalPrice){
                numberInput.value = totalPrice; 
            }
            
            return false;
        }

        if(parseInt(numberInput.value) > totalPrice){
            numberInput.value = totalPrice;  
        }



        checkInput(numberInput, document.getElementById("pointErrorMessage"));
        var restPointElement = document.getElementById("rest_point");
        
        if (restPointElement) {

            if(isNaN(remainingPoint)){
                remainingPoint = 0; 
            }

            restPointElement.textContent = remainingPoint + " Point";
        }

    }
    
    // 총 할인 금액 
    function total_dis() {
        var cou_disprice = parseInt(document.getElementById("co_dis").textContent);        
        var numberInput = parseInt(document.querySelector(".numberInput").value);
        
        if(isNaN(numberInput)){
            numberInput = 0;
        }

        var totla_dis = cou_disprice + numberInput ; 

        var totalDisElement = document.getElementById("total_dis");
        var totalDisElement2 = document.getElementById("total_dis2");
        

        if (totalDisElement) {
            totalDisElement.textContent = totla_dis + "원"; 
        }
        if (totalDisElement2) {
            totalDisElement2.textContent = totla_dis + "원"; 
        }
        calculateFinalTotal()
    }


    // 총 결제금액
    function calculateFinalTotal() {
        var goodsPrice = 0;

        <c:forEach var="item" items="${goods}">
            goodsPrice += parseInt('${item.price}'); 
        </c:forEach>

        var cou_disprice = parseInt(document.getElementById("co_dis").textContent);
        var numberInput = parseInt(document.querySelector(".numberInput").value);
    
        if (isNaN(numberInput)) {
            numberInput = 0;
        }

        var totalDiscount = cou_disprice + numberInput;
        var finalTotal = goodsPrice - totalDiscount;

        var finalTotalElement = document.getElementById("finalTotal");

        if (finalTotalElement) {
            finalTotalElement.textContent = finalTotal + "원";
        }
    }




    function setCouponCode(couponCode,discountType,discountValue) {
        document.getElementById("couponCodeInput").value = couponCode;
        document.getElementById("coupon_dis_Type").value = discountType;
        document.getElementById("coupon_dis_Value").value = discountValue;
    }

    // 적용 버튼 클릭 
    function apply_cou() {
        var discountType =  document.getElementById("coupon_dis_Type").value;
        var discountValue = document.getElementById("coupon_dis_Value").value;
        var totalPrice = 0;
        var coupon_dis_price = 0; 

        <c:forEach var="item" items="${goods}">
            totalPrice += parseInt('${item.price}');
        </c:forEach>


        if(discountType == "PERCENTAGE"){
            console.log("% 계산");
            coupon_dis_price = totalPrice * (discountValue / 100);
            document.getElementById("co_dis").textContent = coupon_dis_price;
        }
        else {
            console.log("단순 계산");
            coupon_dis_price = discountValue;
            document.getElementById("co_dis").textContent = coupon_dis_price;
        }
        calculateFinalTotal();
    }





    </script>
    <title>Payment</title>
</head>
<body>
    <input type="hidden" id="coupon_dis_Type">
    <input type="hidden" id="coupon_dis_Value">
    <!-- ${goods[0].price} -->
    <form method="post" action="${contextPath}/user/payDone.do">
        <input type="hidden" name="g_no" value="${goodsVO.g_no}"/>	
        <input type="hidden" name="company" value="${goodsVO.company}"/>
        <input type="hidden" name="price" value="${goodsVO.price}"/>
        
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
            <c:choose>
			<c:when test="${goodsList != null}">
                <c:forEach var="goods" items="${goodsList}">                
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
                <tr>
                    <td>체크인</td>
                    <td>${checkIn}</td>
                    <td>체크아웃</td>
                    <td>${checkOut}</td>
                </tr>
            </c:forEach>    
            </c:when>
            <c:otherwise>
                			
                <tr>
                    <td>업체명 :</td>
                    <td><b>${goodsVO.company}</b></td>
                </tr>

                <tr>
                    <td>숙소이름 :</td>
                    <td>${goodsVO.room}</td>
                </tr>

                <tr>
                    <td>가격</td>
                    <td>${goodsVO.price} 원</td>
                </tr>
                <tr>
                    <td>체크인</td>
                    <td>${checkIn}</td>
                    <td>체크아웃</td>
                    <td>${checkOut}</td>
                </tr>
			</c:otherwise>   
            </c:choose>
        </table>
    </div>


        <!-- 할인 수단 선택 -->
        <div class="box">
            <h3>할인 수단 선택</h3>
            <table>

                <tr>
                    <td>쿠폰</td>   
                    
                    <td>
                        <button style="background-color: white;" onclick="openPopupAndNavigate('${contextPath}/user/u_couponbox.do?u_id=${userVO.u_id}'); return false;">
                            <span style="color: black; text-decoration:none;">쿠폰함</span>
                        </button>
                    </td>
                    
                </tr>

                <tr aria-colspan="3">
                    <td>쿠폰번호</td>
                    <td>
                        <input type="text" id="couponCodeInput" name="couponeid" placeholder="AAAA-BBBB-CCCC-DDDD">
                        <input type="button" onclick="apply_cou(), total_dis()" value="적용"></button>
                    </td>
                </tr>

                <tr>
                    <td>쿠폰 할인금액</td>
                    <td><span id="co_dis">0</span></td>
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
                            <input type="text" class="numberInput" size="20" name="numberInput" onblur="checkMyPoint(), total_dis()" placeholder="숫자로 기재해주세요" oninput="checkInput(this, document.getElementById('pointErrorMessage'))"> 
                            <button type="button" class="al_use" onclick="al_use(), total_dis()" >모두 사용</button>
                        </form>
                    </td>
                </tr>

                <tr>
                    <td>잔여 포인트</td>
                    <td><span id="rest_point">0 Point</span></td>
                </tr>


                <tr>
                    <td>총 할인 금액</td>
                    <td><span id="total_dis">0</span></td> 
                </tr>
            </table>
        </div>

        
    </div>

    <div class="out2">
        <!-- 결제 금액 -->
        <div class="box">
            <h3>결제금액</h3>
            <c:forEach var="goods" items="${goods}">
                <p>가격 &nbsp;&nbsp;&nbsp;&nbsp;  ${goods.price} 원</p>
            </c:forEach>
            <p>할인금액 &nbsp;&nbsp;&nbsp;&nbsp; <span id="total_dis2">0</span></p>
            <hr>
            <c:forEach var="goods" items="${goods}">
                <p><b>총 결제 금액</b> &nbsp;&nbsp;&nbsp;&nbsp; <span id="finalTotal">${goods.price} 원</span></p>
            </c:forEach>
            <p id="pointDisplay">적립 포인트 &nbsp;&nbsp;&nbsp; <span id="pointValue">0</span> Point</p>
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

    //console.log(goodsPrice);
    const pointValue = parseInt(goodsPrice / 100); 
    //console.log(pointValue);
    
    if (pointValueElement) {
        pointValueElement.textContent = pointValue;
    } 
    else {
        console.log("pointValueElement not found"); 
    }
    

</script>
</html>
