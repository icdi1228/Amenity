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
    <script>
        $(document).ready(function() {
            $(".btn-coupon-receive").click(function(e) {
                e.preventDefault();
                
                var href = $(this).attr("href");
                
                $.ajax({
                    type: "GET",
                    url: href,
                    success: function(response) {
                        alert('쿠폰을 받았습니다.');
                    },
                    error: function(error) {
                        alert('쿠폰을 받는 데 실패했습니다. 중복된 쿠폰이 있는지 확인 후 다시 시도해 주세요.');
                    }
                });
            });
        });
        </script>
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
        .container {
            max-width: 1200px;
            margin: 40px auto;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <c:forEach var="coupon" items="${coupons}" varStatus="status">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="${contextPath}/user/couponDownload.do?imageName=${coupon.imagename}&amp;couponCode=${coupon.couponCode}" class="card-img-top" alt="쿠폰이미지반복">
                        <div class="card-body">
                            <h5 class="card-title">${coupon.couponName}</h5>
                            <p class="card-text">${coupon.description}</p>
                            <c:choose>
                                <c:when test="${coupon.discountType eq 'PERCENTAGE'}">${coupon.discountValue} %</c:when>
                                <c:otherwise>- ${coupon.discountValue}</c:otherwise>
                            </c:choose>
                            <p class="card-text">${coupon.expiryDate}</p>
                            <a href="${contextPath}/user/couponReceive.do?u_id=${userVO.u_id}&amp;expiryDate=${coupon.expiryDate}&amp;couponCode=${coupon.couponCode}&amp;discountType=${coupon.discountType}&amp;discountValue=${coupon.discountValue}&amp;imagename=${coupon.imagename}" class="btn btn-primary btn-coupon-receive">쿠폰받기</a>
                        </div>
                    </div>
                </div>
                <c:if test="${status.index % 3 == 2}">
                    </div><div class="row">
                </c:if>
            </c:forEach>
        </div>
    </div>
    
</body>
</html>
