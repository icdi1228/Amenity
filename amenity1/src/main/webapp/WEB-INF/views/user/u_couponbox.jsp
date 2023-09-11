<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰함</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
     function useCoupon(couponCode,discountType,discountValue) {
        window.opener.setCouponCode(couponCode,discountType,discountValue); 
        window.close(); 
    }
</script>
<style>  
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    table {
        width: 100%;
        max-width: 500px;
        margin: 0 auto;
        border-collapse: collapse;
        background-color: #fff;
        border: 1px solid #ddd;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        border-bottom: 1px solid #ddd;
    }

    td {
        border-bottom: 1px solid #ddd;
    }

    button {
        padding: 5px 10px;
        background-color: #007BFF;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <c:forEach var="mycoupon" items="${mycoupon}" >
    <table>
        
            <tr>
                <td>쿠폰번호 : </td>
                <td>${mycoupon.couponCode}</td>
            </tr>
<!--
            <tr>
                <td>쿠폰이름 : </td>
                <td>${mycoupon.couponName}</td>
            </tr>

            <tr>
                <td>쿠폰내용 : </td>
                <td>${mycoupon.description}</td>
            </tr>
-->
            <!-- 할인 방식 / 값 물어보고 만들어야할듯 -->

            <input type="hidden" value="${mycoupon.discountType}">
            <input type="hidden" value="${mycoupon.discountValue}">

            <tr>
                <td>만료일 : </td>
                <td>${mycoupon.expiryDate}</td>
            </tr>

            <tr>
                <td>이것저것    </td>
                <td>꾸미는건 어려워</td>
            </tr>

            <tr>
                <!--<button type="button" id="useCouponBtn" onclick="useCoupon('${mycoupon.couponCode}')"> 사용하기 </button>-->
                <td>
                    <button type="button" id="useCouponBtn" onclick="useCoupon('${mycoupon.couponCode}','${mycoupon.discountType}','${mycoupon.discountValue}')"> 사용하기 </button>
                </td>
            </tr>


    </table>
</c:forEach>

</body>
</html>
