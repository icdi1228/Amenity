<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>user_signup</title>
</head>
<body>
    <h1 style="text-align:center">id 찾기 결과</h1>   
        <p>${result.u_id}</p>
</body>
</html>
