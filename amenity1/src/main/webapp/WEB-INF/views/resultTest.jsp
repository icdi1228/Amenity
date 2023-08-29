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
    <h1>imp_uid : ${payMap.imp_uid}</h1>
    <h1>merchant_uid : ${payMap.merchant_uid}</h1>
    <h1>상품명 : ${payMap.name}</h1>
    <h1>주소 : ${payMap.buyer_addr}</h1>
    <h1>buyer_name : ${payMap.buyer_name}</h1>
  </body>
</html>
