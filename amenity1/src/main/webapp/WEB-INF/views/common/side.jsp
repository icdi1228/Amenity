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
		<a href="#" class="list-group-item list-group-item-action list-group-item-dark">고객센터</a>
		<a href="${contextPath}/user/notice.do" class="list-group-item list-group-item-action list-group-item-light">공지사항</a>
		<a href="${contextPath}/user/myQuestion.do" class="list-group-item list-group-item-action list-group-item-light">내 문의내역</a>
		<a href="${contextPath}/user/event.do" class="list-group-item list-group-item-action list-group-item-light">이벤트</a>
		<a href="${contextPath}/user/myInfo.do" class="list-group-item list-group-item-action list-group-item-dark">마이페이지</a>
		<a href="${contextPath}/user/myInfo.do" class="list-group-item list-group-item-action list-group-item-light">내정보</a>
		<a href="#" class="list-group-item list-group-item-action list-group-item-light">예약내역</a>
	  </div>
</body>
</html>