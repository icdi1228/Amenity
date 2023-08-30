<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
 <style>
 a{
	text-decoration: none;
 }
	 
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
	<div class="list-group">
		<a href="${contextPath}/business/b_notice.do" class="list-group-item list-group-item-action list-group-item-dark">고객센터</a>
		<a href="${contextPath}/business/b_notice.do" class="list-group-item list-group-item-action list-group-item-light">공지사항</a>
		<a href="${contextPath}/business/res_inquiry.do" class="list-group-item list-group-item-action list-group-item-light">예약확인</a>
		<a href="${contextPath}/business/b_Info1.do" class="list-group-item list-group-item-action list-group-item-dark">마이페이지</a>
		<a href="${contextPath}/business/b_Info1.do" class="list-group-item list-group-item-action list-group-item-light">내 정보</a>
		<a href="${contextPath}/business/b_companyList.do" class="list-group-item list-group-item-action list-group-item-light">업체관리</a>
		<a href="${contextPath}/business/b_goodsList.do" class="list-group-item list-group-item-action list-group-item-light">상품관리</a>
		<a href="${contextPath}/business/b_newCompany.do" class="list-group-item list-group-item-action list-group-item-light">업체추가</a>
		<a href="${contextPath}/business/b_newGoods.do" class="list-group-item list-group-item-action list-group-item-light">상품추가</a>
	  </div>
</body>
</html>