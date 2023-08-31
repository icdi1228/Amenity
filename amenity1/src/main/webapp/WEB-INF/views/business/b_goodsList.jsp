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
<title>b_goodsList</title>

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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {

function handleCompanySelect() {
    var selectedValue = $("select[name='company']").val();
    var tableBody = $("#goodsTable tbody"); // ID를 통해 테이블 바디 요소 선택
    
    tableBody.empty(); // 테이블 내용 초기화
    
    // 선택된 회사에 해당하는 상품들만 필터링하여 테이블에 추가
    $.each(myGoodsList, function(index, item) {
        if (item.company === selectedValue) {
            var row = $("<tr>");
            $("<td>").text(index + 1).appendTo(row);
            $("<td>").text(item.company).appendTo(row);
            $("<td>").text(item.room).appendTo(row);
            $("<td>").text(item.price).appendTo(row);
            $("<td>").text(item.timeprice).appendTo(row);
            $("<td>").text(item.stdper).appendTo(row);
            $("<td>").text(item.detail).appendTo(row);
            $("<td>").html('<a href="${contextPath}/business/b_modGoodsInList.do?g_no=' + item.g_no + '">수정</a>').appendTo(row);
            $("<td>").html('<a href="${contextPath}/business/deleteGoodsInList.do?g_no=' + item.g_no + '">삭제</a>').appendTo(row);
            row.appendTo(tableBody);
        }
    });
    
    // 테이블 보이도록 설정
    $("#goodsTable").show(); // ID를 통해 테이블 요소 선택
}
</script>
</head>

<body>
	<section>
		<form name="b_goodsList" method="post" enctype="multipart/form-data">
			<div>
				<h1>사업장 등록상품 목록</h1>
					<tr>
					<td>조회할 사업장 선택</td>
						<td>
						<select name="company" onchange="handleCompanySelect()">
							<option value="">사업장을 선택하세요</option>
								<c:if test="${!empty myCompanyList}">
								<c:forEach items="${myCompanyList}" var="myCompanyList">
									<option value="${myCompanyList}">${myCompanyList}</option>
								</c:forEach>
								</c:if>
								<c:if test="${empty myCompanyList}">
									<option value="">사용 가능한 사업장이 없습니다.</option>
								</c:if>
						</select>
							<table id="goodsTable" style="display:none;">
							<thead>
								<tr>
									<th>No</th>
									<th>사업장명</th>
									<th>객실번호</th>
									<th>숙박 이용료</th>
									<th>대실 이용료</th>
									<th>투숙인원</th>
									<th>세부</th>
									<th>수정</th>
									<th>삭제</th>
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
			</div>
		</form>
	</section>
</body>
</html>