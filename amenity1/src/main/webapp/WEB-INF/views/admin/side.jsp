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
		<a href="${contextPath}/admin/notice.do" class="list-group-item list-group-item-action list-group-item-dark">고객센터</a>
		<a href="${contextPath}/admin/notice.do" class="list-group-item list-group-item-action list-group-item-light">공지사항</a>
		<a href="${contextPath}/admin/qna.do" class="list-group-item list-group-item-action list-group-item-light">문의내역</a>
		<a href="${contextPath}/admin/res_inquiry.do" class="list-group-item list-group-item-action list-group-item-light">예약확인</a>
		<a href="${contextPath}/admin/userList.do" class="list-group-item list-group-item-action list-group-item-dark">마이페이지</a>
		<a href="${contextPath}/admin/userList.do" class="list-group-item list-group-item-action list-group-item-light">회원관리</a>
		<a href="${contextPath}/admin/businessList.do" class="list-group-item list-group-item-action list-group-item-light">기업 관리</a>
		<a href="${contextPath}/admin/companyList.do" class="list-group-item list-group-item-action list-group-item-light">사업장 관리</a>
		<a href="${contextPath}/admin/goodsList.do" class="list-group-item list-group-item-action list-group-item-light">상품 관리</a>
		<a href="${contextPath}/admin/couponPublish.do" class="list-group-item list-group-item-action list-group-item-light">쿠폰관리</a>
	  </div>
</body>
</html>