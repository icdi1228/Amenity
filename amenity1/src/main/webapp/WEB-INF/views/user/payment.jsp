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
        #w2w2{
            background-color:black;
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
        input.value = 0;
    } 
    else {
        return true;
    }
}

window.onload = function(){
    var finalTotalElement = document.getElementById("finalTotal");
    var pointValue = document.getElementById("pointValue");
    var rest_point = document.getElementById("rest_point");
    var ft_price = document.getElementById("ftprice");
    var tft_price = document.getElementById("tftprice");
    
    var userPoint = '${userVO.mileage}';

    var totalPrice = 0;

    if('${payMap}' != null && '${payList}' == '' ){
        totalPrice = '${payMap.price}' * '${payMap.dt_gap}' ;
    }
    else if('${payList}' != null ){
        <c:forEach var="pay" items="${payList}">
            totalPrice += parseInt('${pay.price * pay.dt_gap}');
        </c:forEach>
    }

    var point =  totalPrice/100 ;

    if (finalTotalElement) {
        finalTotalElement.textContent = totalPrice ;
    }

    if (pointValue) {
        pointValue.textContent = point ;
    }

    if (rest_point) {
        rest_point.textContent = userPoint ;
    }


    ft_price.textContent = parseInt(totalPrice);
    tft_price.value = parseInt(totalPrice);

};


// 모두사용 버튼
function al_use(){
    var userPoint = '${userVO.mileage}';  
    var totalPrice = 0;
    var cou_disprice = parseInt(document.getElementById("co_dis").textContent); 
    var numberInput = document.querySelector(".numberInput");
    
    if('${payMap}' != null && '${payList}' == '' ){
        totalPrice = '${payMap.price}' * '${payMap.dt_gap}' ;
    }

    else if('${payList}' != null ){
        <c:forEach var="pay" items="${payList}">
            totalPrice += parseInt('${pay.price * pay.dt_gap}');
        </c:forEach>
    }

    if (userPoint >= (totalPrice-cou_disprice)) {
        numberInput.value = (totalPrice-cou_disprice);
        var remainingPoint = userPoint - (totalPrice-cou_disprice);
        var restPointElement = document.getElementById("rest_point");

        if(restPointElement) {
            restPointElement.textContent = remainingPoint ;
        }
    }

    if ((totalPrice-cou_disprice) > userPoint) {
        numberInput.value = userPoint;
        var remainingPoint = userPoint - userPoint;
        var restPointElement = document.getElementById("rest_point");

        if(restPointElement) {
            restPointElement.textContent = remainingPoint ;
        }
    }
    checkMyPoint();
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
    var cou_disprice = parseInt(document.getElementById("co_dis").textContent);
    var usePoint = document.getElementById("mile_point");

    if (isNaN(cou_disprice)) {
        cou_disprice = 0;
    } 
    if (isNaN(parseInt(numberInput.value))) {
        numberInput.value = "0"; 
    }

    if('${payMap}' != null && '${payList}' == '' ){
        totalPrice = '${payMap.price}' * '${payMap.dt_gap}' ;
    }

    else if('${payList}' != null ){
        <c:forEach var="pay" items="${payList}">
            totalPrice += parseInt('${pay.price * pay.dt_gap}');
        </c:forEach>
    }

    var m_point = totalPrice-cou_disprice;

    if (parseInt(numberInput.value) > userPoint) {
        numberInput.value =  userPoint;
        if(parseInt(numberInput.value) > totalPrice){
            numberInput.value = totalPrice; 
        }  
    }

    if(parseInt(numberInput.value) > totalPrice){
        numberInput.value = totalPrice;  
    }

    if(parseInt(numberInput.value) >  m_point ){
        numberInput.value =  m_point;  
    }

    checkInput(numberInput, document.getElementById("pointErrorMessage"));
    var restPointElement = document.getElementById("rest_point");
    var remainingPoint = parseInt(userPoint) - parseInt(numberInput.value);

    if (isNaN(remainingPoint)) {
        remainingPoint = 0;
    }

    if (restPointElement) {

        restPointElement.textContent = remainingPoint ;
    }

    usePoint.value = parseInt(numberInput.value);

}
    
// 총 할인 금액 
function total_dis() {
    var cou_disprice = parseInt(document.getElementById("co_dis").textContent);        
    var numberInput = parseInt(document.querySelector(".numberInput").value);

    if(isNaN(cou_disprice)){
        cou_disprice = 0;
    }
    if(isNaN(numberInput)){
        numberInput = 0;
    }

    var total_dis = cou_disprice + numberInput ; 
    var totalDisElement = document.getElementById("total_dis");   

    if (totalDisElement) {
        totalDisElement.textContent = total_dis ; 
    }

    calculateFinalTotal()
}


// 총 결제금액
function calculateFinalTotal() {
    var totalPrice = 0;

    if('${payMap}' != null && '${payList}' == '' ){
        totalPrice = '${payMap.price}' * '${payMap.dt_gap}' ;
    }

    else if('${payList}' != null ){
        <c:forEach var="pay" items="${payList}">
            totalPrice += parseInt('${pay.price * pay.dt_gap}');
        </c:forEach>
    }

    var cou_disprice = parseInt(document.getElementById("co_dis").textContent);
    var numberInput = parseInt(document.querySelector(".numberInput").value);
    
    if (isNaN(numberInput)) {
        numberInput = 0;
    }
    if (isNaN(cou_disprice)) {
        cou_disprice = 0;
    }


    var totalDiscount = cou_disprice + numberInput;
    var finalTotal = totalPrice - totalDiscount;

    var finalTotalElement = document.getElementById("finalTotal");

    if (finalTotalElement) {
        finalTotalElement.textContent = finalTotal ;
    }
}

function setCouponCode(couponCode,discountType,discountValue) {
    document.getElementById("couponCodeInput").value = couponCode;
    document.getElementById("couponCode").value = couponCode;
    document.getElementById("coupon_dis_Type").value = discountType;
    document.getElementById("coupon_dis_Value").value = discountValue;
}

// 적용 버튼 클릭 
function apply_cou() {
    var discountType =  document.getElementById("coupon_dis_Type").value;
    var discountValue = document.getElementById("coupon_dis_Value").value;
    var totalPrice = 0;
    var coupon_dis_price = 0; 
    
    if('${payMap}' != null && '${payList}' == '' ){
        totalPrice = '${payMap.price}' * '${payMap.dt_gap}' ;
    }

    else if('${payList}' != null ){
        <c:forEach var="pay" items="${payList}">
            totalPrice += parseInt('${pay.price * pay.dt_gap}');
        </c:forEach>
    }

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
    checkMyPoint()
    calculateFinalTotal();
}

</script>   
<title>Payment</title>
</head>
<body>
<input type="hidden" id="coupon_dis_Type">
<input type="hidden" id="coupon_dis_Value">

<form method="post" action="${contextPath}/user/payDone.do">
    <!-- 쿠폰 , 마일리지 여기다 둠-->
    <input type="hidden" id="couponCode" name="couponCode" value="">
    <input type="hidden" id="mile_point" name="mile_point" value="">
        
    <div class="out">
        <!-- 예약자 정보 -->
        <div class="box">
            <h3>예약자 정보</h3>
            <table>
                <tr>
                    <td>이름</td>
                    <td id="name">${userVO.name}</td>
                </tr>
                <tr>
                    <td>휴대폰번호</td>
                    <td id="tel">${userVO.tel1}-${userVO.tel2}-${userVO.tel3} </td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td id="uid">${userVO.u_id}</td>
                </tr>
            </table>
        </div>

        <!-- 숙소 정보 -->
        <div class="box">
            <h3>숙소 정보</h3> 
            <table>
                <c:choose>
			        <c:when test="${payList != null}">
                        <c:forEach var="pay" items="${payList}">                
                            <tr>
                                <td>업체명 :</td>
                                <td id="company"><b>${pay.company}</b></td>
                            </tr>
                    
                            <tr>
                                <td>숙소이름 :</td>
                                <td id="room">${pay.room}</td>
                            </tr>

                            <tr>
                                <td>체크인</td>
                                <td>${pay.checkIn}</td>
                                <td>체크아웃</td>
                                <td>${pay.checkOut}</td>
                            </tr>
                
                            <tr>
                                <td>숙박 형태 : </td>
                                <td >${pay.resform}</td>
                                <td>기  간 : </td>
                                <td>${pay.dt_gap} 박 ${pay.dt_gap+1} 일</td>
                                <td><input type="hidden" value="${pay.dt_gap}"></td>
                            </tr>

                            <tr>
                                <td>가  격 : </td>
                                <td>${pay.price} 원</td>
                                <td>총가격 : </td>
                                <td>${pay.price * pay.dt_gap} 원</td>
                                <td><input type="hidden" class="t_price" value="${pay.price * pay.dt_gap}"></td>
                            </tr>

                            <c:if test="${pay.resform != '숙박'}">
                                <tr>
                                    <td>입실시간</td>
                                    <td>${pay.checkInTime}</td>
                                    <td>퇴실시간</td>
                                    <td>${pay.checkOutTime}</td>
                                </tr>
                            </c:if>

                            <c:if test="${payList.size() > 1}">
                                <tr>
                                    <td id="w2w2" colspan="4"></td>
                                    <td></td>
                                </tr>
                            </c:if>
                        </c:forEach>    
                    </c:when>

                    <c:otherwise>
                        <input type="hidden" name="g_no" value="${goodsVO.g_no}"/>	
                        <input type="hidden" name="company" value="${goodsVO.company}"/>
                        <input type="hidden" name="price" value=""/>			
                        <input type="hidden" name="checkInTime" value="${payMap.checkInTime}"/>			
                        <input type="hidden" name="checkOutTime" value="${payMap.checkOutTime}"/>			


                        <script>
                            var priceValue = parseInt("${goodsVO.price}") * parseInt("${payMap.dt_gap}");
                            document.querySelector('input[name="price"]').value = priceValue;
                        </script>

                        <tr>
                            <td>업체명 :</td>
                            <td id="company" ><b>${goodsVO.company}</b></td>
                        </tr>

                        <tr>
                            <td>숙소이름 :</td>
                            <td id="room" >${goodsVO.room}</td>
                        </tr>

                        <tr>
                            <td>체크인</td>
                            <td id="chkin">${payMap.checkIn}</td>
                            <input type="hidden" name="checkIn" value="${payMap.checkIn}">
                            <td>체크아웃</td>
                            <td id="chkout">${payMap.checkOut}</td>
                            <input type="hidden" name="checkOut" value="${payMap.checkOut}">
                        </tr>
                        
                        <tr>
                            <td>숙박형태 : </td>
                            <td>${payMap.resform}</td>
                            <td>기간 : </td>
                            <td>${payMap.dt_gap}박 ${payMap.dt_gap+1} 일</td>
                        </tr>

                        <tr>
                            <td>가격 : </td>
                            <!--대실일 경우와 숙박일경우 가격 숙박일경우(가격 x 숙박일수)-->
                    
                            <c:choose>
                                <c:when test="${payMap.resform == '대실'}">
                                    <td class="price" id="price">${goodsVO.price} 원</td>
                                </c:when>

                                <c:otherwise>
                                    <td class="price" id="price">${goodsVO.price}</span>원</td>
                                </c:otherwise>
                            </c:choose>

                            <td>총가격 : </td>
                            <td>${payMap.price * payMap.dt_gap} 원</td>
                        </tr>

                        <c:if test="${payMap.resform != '숙박'}">
                            <tr>
                                <td>입실시간</td>
                                <td><input align="center" type="datetime" name="checkInTime" value="${payMap.checkInTime}"></td>
                                <td>퇴실시간</td>
                                <td><input align="center" type="datetime" name="checkOutTime" value="${payMap.checkOutTime}"></td>
                            </tr>
                        </c:if>
                
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
                        <input type="text" id="couponCodeInput" name="couponeid" placeholder="AAAA-BBBB-CCCC-DDDD" readonly="readonly">
                        <input type="button" onclick="apply_cou(), total_dis()" value="적용"></button>
                    </td>
                </tr>

                <tr>
                    <td>쿠폰 할인금액</td>
                    <td><span id="co_dis">0</span>원</td>
                </tr>

                <tr>
                    <td> 내 포인트 </td>
                    <td> ${userVO.mileage} Point </td>
                </tr>

                <tr>
                    <td> 사용할 포인트 </td>
                    <td>
                        <form method="post">
                            <input type="text" class="numberInput" size="20" name="numberInput" onblur="checkMyPoint(), total_dis()" placeholder="숫자로 기재해주세요" oninput="checkInput(this, document.getElementById('pointErrorMessage'))"> 
                            <button type="button" class="al_use" onclick="al_use(), total_dis()" >모두 사용</button>
                        </form>
                    </td>
                </tr>

                <tr>
                    <td>잔여 포인트</td>
                    <td><span id="rest_point"></span> &nbsp; Point</td>
                </tr>

                <tr>
                    <td>총 할인 금액</td>
                    <td><span id="total_dis">0</span> 원</td> 
                </tr>
            </table>
        </div>
    </div>

    <div class="out2">
        <!-- 결제 금액 -->
        <div class="box">
            <h3>결제금액</h3><br>
            <p><b>총 금액</b>&nbsp;&nbsp;&nbsp;
            <span id="ftprice"></span> &nbsp;원</p>
            <input type="hidden" id="tftprice" name="price" value="">
            <p><b>총 결제 금액</b>&nbsp;&nbsp;&nbsp;
            <span id="finalTotal"></span> &nbsp;원</p>
            <p id="pointDisplay">적립 포인트 &nbsp;&nbsp;&nbsp; <span id="pointValue">0</span> &nbsp; Point</p>
        </div>

        <!-- 결제 수단 선택 -->
        <div class="box">
            <h4>결제 수단 선택</h4>
            <table>
                <tbody>
                    <tr>
                        <td><input type="radio" name="pay" value="kakao"/><img src="#" alt="">카카오페이</td>
                        <td><input type="radio" name="pay" value="danal"/><img src="#" alt="">다날 결제</td>
                    </tr>

                    <tr>
                        <td><input type="radio" name="pay" value="toss"/><img src="#" alt="">토스페이</td>
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
                        <!-- 조건부 렌더링 -->
                        <!-- test 값이 success인 경우에만 다음으로 버튼을 보여줍니다 -->
                        <input type="submit" class="btn" value="다음으로" id="nextButton" style="display: none;" />
                        <!-- test 값이 success가 아닌 경우에만 결제하기 버튼을 보여줍니다 -->
                        <input type="button" class="btn" value="결제하기" id="paymentButton" style="display: none;" onclick="handlePayment()"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>

<script>
    const testValue = "success"; // 여기에 실제 test 값 할당
    
    // 조건에 따라 버튼을 보여주거나 숨기는 함수
    function toggleButtons() {
        const nextButton = document.getElementById("nextButton");
        const paymentButton = document.getElementById("paymentButton");
        
        if (testValue === "success") {
            nextButton.style.display = "none";
            paymentButton.style.display = "inline-block";
        } else {
            nextButton.style.display = "inline-block";
            paymentButton.style.display = "none";
            
        }
    }
    
    // 페이지 로드 시 조건에 따라 버튼 초기 설정
    toggleButtons();
</script>


    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- 결제 방식 선택 구현 -->
    <script>
    var IMP = window.IMP;
    IMP.init("imp45451010");

        function handlePayment() {
    const paymentOption = document.querySelector('input[name="pay"]:checked').value;

    switch(paymentOption) {
        case "kakao":
            requestKaKaOPay();
            break;
        case "toss":
            requestTossPay();
            break;
        case "naver":
            requestNaverPay();
            break;
        case "danal":
            requestDanal();
            break;
        default:
            console.error('Invalid payment option');
            break;
    }
}
    </script>

    <!-- 카카오페이 결제 로직 -->
    <script>
    
      function requestKaKaOPay() {
        var totalAmount = 0;
        var troomname = $("#room").text();
        var tcompany = $("#company").text();
        $(".price").each(function() {
        var priceValue = $(this).text(); 
        totalAmount += parseInt(priceValue);
        });
        var tbname = $("#name").text();
        var ttel = $("#tel").text();
        var tpay = 0;
        var tdiscount = $("#total_dis").text();
        var tid = $("#uid").text();

        if('${payMap}' != null && '${payList}' == '' ){
            tpay = '${payMap.price}' * '${payMap.dt_gap}' ;
        }

        else if('${payList}' != null ){
            <c:forEach var="pay" items="${payList}">
                tpay += parseInt('${pay.price * pay.dt_gap}');
            </c:forEach>
        }

        console.log("troomname : " + troomname)
        console.log("tcompany : " + tcompany)
        console.log("totalAmount : " + totalAmount)
        console.log("tbname : " + tbname)
        console.log("ttel : " + ttel)
        console.log("tpay : " + tpay)
        console.log("tdiscount : " + tdiscount)


        IMP.request_pay(
          {
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card",
            merchant_uid: "order_no_" + new Date().getTime(),
            name: troomname,    
            buyer_addr: tcompany,
            amount: tpay-tdiscount,
            buyer_name: tbname,
            buyer_tel: ttel,
            pay: tpay,
            discount: tdiscount,
            id: tid,
            pay_option: "KaKaOPay"
          },
          function (rsp) {
            if (rsp.success) {
            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            var msg = '[' + rsp.buyer_addr + '] '
            msg +=  rsp.name; + '\n'
            msg += "결제 완료";
            
            $.ajax({
            url: "${contextPath}/Tpay.do", 
            type: "POST",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify({
                "imp_uid": rsp.imp_uid,            // 결제 고유번호
                "merchant_uid": rsp.merchant_uid,  // 주문번호
                "pay_method": rsp.pay_method,      // 결제방법
                "name": rsp.name,                  // room name                 
                "amount": rsp.tamount,
                "buyer_name": rsp.buyer_name,
                "buyer_addr": rsp.buyer_addr,
                "buyer_tel": rsp.buyer_tel,
                "pay": tpay,
                "discount": tdiscount,
                "id": tid,
                "pay_option": "KaKaOPay"
            }),
            success: function(response) {
            // 여기에 성공 시의 코드를 작성합니다.
            alert(msg);
            console.log("Server responded with:", response);
            console.log("result", response.payResult);
            if (response.payResult === "success") {
                $("#nextButton").show();
                $("#paymentButton").hide();
            } else {
                $("#nextButton").hide();
                $("#paymentButton").show();
            }
            },
            error: function(error) {
            alert("서버 요청에 실패했습니다.");
            console.error("Error from server:", error);
            }
        })
        
        } else {
        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
        }
        });
      }
    </script>

     <!-- 토스 결제 로직 -->
     <script>
    
      function requestTossPay() {
        var totalAmount = 0;
        var troomname = $("#room").text();
        var tcompany = $("#company").text();

        $(".price").each(function() {
            var priceValue = $(this).text();
            totalAmount += parseInt(priceValue);
        });

        var tbname = $("#name").text();
        var ttel = $("#tel").text();
        var tpay = 0;
        var tdiscount = $("#total_dis").text();
        var tid = $("#uid").text();

        if('${payMap}' != null && '${payList}' == '' ){
            tpay = '${payMap.price}' * '${payMap.dt_gap}' ;
        }

        else if('${payList}' != null ){
            <c:forEach var="pay" items="${payList}">
                tpay += parseInt('${pay.price * pay.dt_gap}');
            </c:forEach>
        }
        
        console.log("troomname : " + troomname)
        console.log("tcompany : " + tcompany)
        console.log("totalAmount : " + totalAmount)
        console.log("tbname : " + tbname)
        console.log("ttel : " + ttel)
        console.log("tpay : " + tpay)
        console.log("tdiscount : " + tdiscount)

        IMP.request_pay(
          {
            pg: "tosspay.tosstest",
            pay_method: "card",
            merchant_uid: "order_no_" + new Date().getTime(),
            name: troomname,    
            buyer_addr: tcompany,
            amount: tpay-tdiscount,
            buyer_name: tbname,
            buyer_tel: ttel,
            pay: tpay-tdiscount,
            discount: tdiscount,
            id: tid,
            pay_option: "Toss"
            
          },

          function (rsp) {
            if (rsp.success) {
            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            //var msg = '[' + rsp.buyer_addr + '] '
            
            //msg +=  rsp.name; + '\n'
            //msg += "결제 완료";
            
            $.ajax({
            url: "${contextPath}/Tpay.do", 
            type: "POST",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify({
                "imp_uid": rsp.imp_uid,            // 결제 고유번호
                "merchant_uid": rsp.merchant_uid,  // 주문번호
                "pay_method": rsp.pay_method,      // 결제방법
                "name": rsp.name,                  // room name                 
                "amount": rsp.tamount,
                "buyer_name": rsp.buyer_name,
                "buyer_addr": rsp.buyer_addr,
                "buyer_tel": rsp.buyer_tel,
                "pay": tpay,
                "discount": tdiscount,
                "id": tid,
                "pay_option": "Toss"
            }),
            success: function(response) {
            // 여기에 성공 시의 코드를 작성합니다.
            //alert(msg);
            console.log("Server responded with:", response);
            console.log("result", response.payResult);

            console.log("rsp.tamount : " + rsp.tamount)
            console.log(" tpay : " +  tpay)

            if (response.payResult === "success") {
                $("#nextButton").show();
                $("#paymentButton").hide();
            } else {
                $("#nextButton").hide();
                $("#paymentButton").show();
            }
            },
            error: function(error) {
            alert("서버 요청에 실패했습니다.");
            console.error("Error from server:", error);
            }
        })
        
        } else {
        alert("결제에 실패하였습니다. ");
        }
        });
      }
    </script>

    <!-- 다날결제로직 -->
    <script>
    
        function requestDanal() {
          var totalAmount = 0;
          var troomname = $("#room").text();
          var tcompany = $("#company").text();
          $(".price").each(function() {
          var priceValue = $(this).text().replace(" 원", ""); // " 원" 문자열 제거
          totalAmount += parseInt(priceValue);
          });
          var tbname = $("#name").text();
          var ttel = $("#tel").text();
          var tpay = 0;
          var tdiscount = $("#total_dis").text().replace("원","");
          var tid = $("#uid").text();
  
          <c:forEach var="pay" items="${payList}">
              tpay += parseInt('${pay.price}');
          </c:forEach>
  
          console.log("troomname : " + troomname)
          console.log("tcompany : " + tcompany)
          console.log("totalAmount : " + totalAmount)
          console.log("tbname : " + tbname)
          console.log("ttel : " + ttel)
          console.log("tpay : " + tpay)
          console.log("tdiscount : " + tdiscount)
  
  
          IMP.request_pay(
            {
              pg: "danal",
              pay_method: "card",
              merchant_uid: "order_no_" + new Date().getTime(),
              name: troomname,    
              buyer_addr: tcompany,
              amount: tpay-tdiscount,
              buyer_name: tbname,
              buyer_tel: ttel,
              pay: tpay,
              discount: tdiscount,
              id: tid,
              pay_option: "다날소액결제"
            },
            function (rsp) {
              if (rsp.success) {
              // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
              // jQuery로 HTTP 요청
              var msg = '[' + rsp.buyer_addr + '] '
              msg +=  rsp.name; + '\n'
              msg += "결제 완료";
              
              $.ajax({
              url: "${contextPath}/Tpay.do", 
              type: "POST",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify({
                  "imp_uid": rsp.imp_uid,            // 결제 고유번호
                  "merchant_uid": rsp.merchant_uid,  // 주문번호
                  "pay_method": rsp.pay_method,      // 결제방법
                  "name": rsp.name,                  // room name                 
                  "amount": rsp.tamount,
                  "buyer_name": rsp.buyer_name,
                  "buyer_addr": rsp.buyer_addr,
                  "buyer_tel": rsp.buyer_tel,
                  "pay": tpay,
                  "discount": tdiscount,
                  "id": tid,
                  "pay_option": "다날소액결제"
              }),
              success: function(response) {
              // 여기에 성공 시의 코드를 작성합니다.
              alert(msg);
              console.log("Server responded with:", response);
              console.log("result", response.payResult);

              if (response.payResult === "success") {
                  $("#nextButton").show();
                  $("#paymentButton").hide();
              } else {
                  $("#nextButton").hide();
                  $("#paymentButton").show();
              }
              },
              error: function(error) {
              alert("서버 요청에 실패했습니다.");
              console.error("Error from server:", error);
              }
          })
          
          } else {
          alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
          }
          });
        }
      </script>
</body>

</html>
