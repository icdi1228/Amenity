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
<title>b_companyLisy</title>

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
		<form name="b_companyList" method="post" enctype="multipart/form-data">
			<div>
				<h1>사업자 업체목록</h1>
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>등록한 업체</th>
							<th>카테고리</th>
							<th>상세설명</th>
							<th>장소</th>
							<th>등급</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
					 	<c:if test="${!empty myCompanyList}">
					 	<c:set var="count" value="1" />
						<c:forEach items="${myCompanyList}" var="company">
							<tr>
								<td>${count}</td>
								<td>${company.company}</td>
								<td>${company.category}</td>
								<td>${company.detail}</td>
								<td>${company.location}</td>
								<td>${company.grade}</td>
								<td><a href="${contextPath}/business/b_modCompanyInList.do?company=${company.company}">수정</a></td>
								<td><a href="${contextPath}/business/deleteCompanyInList.do?c_no=${company.c_no}">삭제</a></td>
							</tr>
				        <c:set var="count" value="${count + 1}" />
						</c:forEach>
						</c:if>
						<c:if test="${empty myCompanyList}">
							<tr>
								<td colspan="8" align="center">등록된 사업장이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</form>
	</section>
</body>
</html>