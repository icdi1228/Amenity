<!DOCTYPE html>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<html> 
<head>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
  </head>
  <body>
    <h1>ㅎㅇ</h1>
    <h1>imp_uid : ${imp_uid}</h1>
    <h1>merchant_uid : ${merchant_uid}</h1>
    <h1>상품명 : ${name}</h1>
    <h1>주소 : ${buyer_addr}</h1>
    <h1>buyer_email : ${buyer_email}</h1>
    <h1>구매자 이름 : ${buyer_name}</h1>
    <h1>금액 : ${pay}</h1>
    <h1>체크인 : ${checkin}</h1>
    <h1>체크아웃 : ${checkout}</h1> 
    <h1>전ㅇ화번호: ${buyer_tel}</h1>
  
  </body>
</html>
