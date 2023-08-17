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

    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript"> 
        function backToList(obj) {
            obj.action="${contextPath}/main/product.do";
            obj.submit();
        }
    </script>
    <title>Payment</title>
</head>
<body>
    <form action="${contextPath}/user/payComplete.do">
    <div class="out">
        <!-- 예약자 정보 -->
        <div class="box">
            <h3>예약자 정보</h3>
            <table>
                <tr>
                    <td>이름</td>
                    <td>최현진</td>
                </tr>
                <tr>
                    <td>휴대폰번호</td>
                    <td>010-1234-1324</td>
                </tr>
            </table>
        </div>

        <!-- 할인 수단 선택 -->
        <div class="box">
            <h3>할인수단선택</h3>
            <table>
                <tr>
                    <td></td>
                    <td>100,000원</td>
                </tr>
                <tr>
                    <td><a href="">쿠폰 7장</a></td>
                    <td>- 3000원</td>
                </tr>
                <tr>
                    <td><a href="">포인트 1000 P</a></td>
                    <td>0 P</td>
                </tr>
                <tr>
                    <td>총액</td>
                    <td>97,000 원</td>
                </tr>
            </table>
        </div>

        <!-- 숙소 정보 -->
        <div class="box">
            <h3>숙소 정보</h3>
            <table>
                <tr>
                    <td>숙소이름 :</td>
                    <td>ABC호텔</td>
                </tr>
                <tr>
                    <td>객실번호</td>
                    <td>디럭스</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="out2">
        <!-- 결제 금액 -->
        <div class="box">
            <h3>결제금액</h3>
            <p>상품 금액 100,000원</p>
            <p>할인금액 3000원</p>
            <p>포인트 970P</p>
            <hr>
            <strong>총 결제 금액</strong> 97,000원
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
</html>
