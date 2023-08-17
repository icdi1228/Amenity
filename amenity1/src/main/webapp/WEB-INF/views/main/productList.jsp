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
    <title>제품목록출력</title>
    <style>
        .product-list {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            padding: 20px;
        }

        .product-card {
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 70%; /* Adjust the width as needed */
            box-sizing: border-box;
            transition: transform 0.2s ease-in-out;
            display: flex;
            justify-content: space-between; /* Align items at opposite ends */
            align-items: center;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            max-width: 30%;
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

        .booking-link {
            text-align: center;
            margin-top: 10px;
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
    </style>
</head>
<body>
<div class="product-list">
    <c:forEach var="goods" items="${goodsList}">
        <div class="product-card">
            <div class="product-details">
                <h3>${goods.company}</h3>
                <p><b>객실명</b> : ${goods.room}</p>
                <p><b>가격</b> : ${goods.price} ₩</p>
                <p><b>주소</b> : ${goods.location}</p>
                <p><b>평점</b> : ${goods.grade} 점</p>
                <p><b>객실정보</b> : ${goods.detail}</p>
                <div class="booking-link">
                    <a class="resButton" href="${contextPath}/user/product.do?${goods.company}">예약하러가기</a>
                </div>
            </div>
            <img src="${contextPath}/resources/images/h1.jpg" alt="" />
        </div>
    </c:forEach>
</div>
</body>
</html>
