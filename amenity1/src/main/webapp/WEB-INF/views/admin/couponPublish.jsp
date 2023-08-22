<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠폰생성</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header">쿠폰생성</div>
                <div class="card-body">
                    <form action="${contextPath}/admin/createCoupon" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="couponCode">쿠폰 코드:</label>
                            <input type="text" class="form-control" id="couponCode" name="couponCode" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="couponName">쿠폰이름 :</label>
                            <input type="text" class="form-control" id="couponName" name="couponName" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="discription">설명 :</label>
                            <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label for="imagename">쿠폰이미지 :</label>
                            <input type="file" class="form-control" id="imagename" name="imagename" required>
                        </div>

                        <div class="form-group">
                            <label for="discountType">할인방법:</label>
                            <select class="form-control" id="discountType" name="discountType">
                                <option value="amount">값</option>
                                <option value="percentage">%</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="discountValue">할인률:</label>
                            <input type="number" class="form-control" id="discountValue" name="discountValue" min="0" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="expiryDate">쿠폰 만료일:</label>
                            <input type="date" class="form-control" id="expiryDate" name="expiryDate" required>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Create Coupon</button>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
