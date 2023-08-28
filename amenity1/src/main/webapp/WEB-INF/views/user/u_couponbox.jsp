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
    .table {
        border:1px solid black;
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

            <tr>
                <td>이미지 : </td>
                <td>몰?루</td>
            </tr>

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
                <button type="button" id="useCouponBtn" onclick="useCoupon('${mycoupon.couponCode}','${mycoupon.discountType}','${mycoupon.discountValue}')"> 사용하기 </button>
            </tr>


    </table>
</c:forEach>

</body>
</html>
