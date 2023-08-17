<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이벤트</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: 40px auto;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .card {
            margin: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #3498db;
            border-color: #3498db;
        }
        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card" style="width: 18rem;">
            <img src="${contextPath}/resources/images/coupon1.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">10,000원 할인쿠폰</h5>
                <p class="card-text">이전 달 실적 100,000원 이상인 고객만 발급 가능</p>
                <a href="#" class="btn btn-primary">쿠폰받기</a>
            </div>
        </div>
        <div class="card" style="width: 18rem;">
            <img src="${contextPath}/resources/images/coupon2.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">7,000원 할인쿠폰</h5>
                <p class="card-text">신규회원 전용 쿠폰</p>
                <a href="#" class="btn btn-primary">쿠폰받기</a>
            </div>
        </div>
        <div class="card" style="width: 18rem;">
            <img src="${contextPath}/resources/images/coupon3.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">1,000원 할인쿠폰</h5>
                <p class="card-text">행사쿠폰</p>
                <a href="#" class="btn btn-primary">쿠폰받기</a>
            </div>
        </div>
    </div>
</body>
</html>
