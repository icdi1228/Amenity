<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("UTF-8");%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b_reservationList</title>

<style>
    table { 
        border-collapse: collapse;
        width: 100%;
    }

    th, tr, td { 
        height: 50px;
        padding: 10px;
        border-bottom: 2px solid rgb(37, 88, 184);
    }

    a {
        text-decoration:none
    }
</style>

</head>

<body>
	<section>
		<form name="b_reservationList" method="post" enctype="multipart/form-data">
			<div>
				<h1>예약현황 조회</h1>
					<tr>
					<td>조회할 사업장 선택</td>
						<td>
						<select name="company">
							<option value="">사업장을 선택하세요</option>
								<c:if test="${!empty myCompanyInfo}">
								<c:forEach items="${myCompanyInfo}" var="myCompanyInfo">
									<option value="${myCompanyInfo}">${myCompanyInfo}</option>
								<table id="goodsTable">
							<thead>
								<tr>
									<th>No</th>
									<th>예약자 아이디</th>
									<th>예약자명</th>
									<th>체크인 시간</th>
									<th>체크아웃 시간</th>
									<th>예약 날짜</th>
									<th>예약form</th>
									<th>가격</th>
									<th>웨이</th>
									<th>결제상태</th>
								</tr>
							</thead>
							<tbody>
							 	<c:if test="${!empty myGoodsList}">
							 	<c:set var="count" value="1" />
								<c:forEach items="${myGoodsList}" var="myGoodsList">
									<tr>
										<td>${count}</td>
										<td>${myGoodsList.company}</td>
										<td>${myGoodsList.room}</td>
										<td>${myGoodsList.price}</td>
										<td>${myGoodsList.timeprice}</td>
										<td>${myGoodsList.stdper}</td>
										<td>${myGoodsList.detail}</td>
										<td><a href="${contextPath}/business/b_modGoodsInList.do?g_no=${myGoodsList.g_no}">수정</a></td>
										<td><a href="${contextPath}/business/deleteGoodsInList.do?g_no=${myGoodsList.g_no}">삭제</a></td>
									</tr>
						        <c:set var="count" value="${count + 1}" />
								</c:forEach>
								</c:if>
								<c:if test="${empty myGoodsList}"> 
									<tr>
										<td colspan="9" align="center">등록된 상품이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
							</table>
								</c:forEach>
								</c:if>
								<c:if test="${empty myCompanyInfo}">
									<option value="">사용 가능한 사업장이 없습니다.</option>
								</c:if>
						</select>
							
			</div>
		</form>
	</section>
</body>
</html>