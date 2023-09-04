<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
    <meta charset="UTF-8">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript"> 
        function backToList(obj){
            obj.action="${contextPath}/main/account.do";
            obj.submit();
        }

        function combineBno() {
  var b_no1 = document.getElementsByName("b_no1")[0].value;
  var b_no2 = document.getElementsByName("b_no2")[0].value;
  var b_no3 = document.getElementsByName("b_no3")[0].value;
  var b_no = b_no1 + "-" + b_no2 + "-" + b_no3;

  document.getElementById("b_no").value = b_no;

  return true;
}

    </script>
    <style>
        .login-container {
            max-width: 400px;
            margin: auto;
        }
        .dash {
            margin: 0 5px;
            align-self: center;
        }
    </style>
    <title>사업자 로그인</title>

</head>



<body class="bg-light">

<div class="container login-container">
    <h1 class="text-center my-5">기업 회원로그인</h1>
    <form name="b_signIn" method="post" action="${contextPath}/business/b_signIn.do" onsubmit="return combineBno();">
        <div class="form-group">
            <label>사업자등록번호</label>
            <div class="d-flex">
                <input type="text" class="form-control mr-2" size="6" maxlength="10" name="b_no1">
                <span class="dash">-</span>
                <input type="text" class="form-control mx-2" size="6" maxlength="10" name="b_no2">
                <span class="dash">-</span>
                <input type="text" class="form-control ml-2" size="6" maxlength="10" name="b_no3">
                <input type="hidden" name="b_no" id="b_no">
            </div>
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" class="form-control" size="10" maxlength="10" name="b_pw">
        </div>
        <div class="d-flex justify-content-between my-3">
            <a href="${contextPath}/main/bfind_pwd.do" class="mr-2">비밀번호 찾기</a>
            <a href="${contextPath}/main/b_signup.do">회원가입</a>
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-primary mr-2" value="로그인"/>
            <input type="button" class="btn btn-secondary" value="돌아가기" onClick="backToList(this.form)" />
        </div>
    </form>
</div>
</body>
</html>
