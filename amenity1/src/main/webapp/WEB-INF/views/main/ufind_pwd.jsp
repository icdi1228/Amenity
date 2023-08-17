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
<script type="text/javascript"> 
  function backToList(obj){
    obj.action="${contextPath}/std/listStudents.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  

</script>
 <title>user_find_id</title>
</head>
<body>
<h1 style="text-align:left">비밀번호 찾기</h1>
<br>
<br>
<br>
  <form name="user_find_pwd" method="post"   action="${contextPath}#">

    <div class="use_phone">
      <h2>아이디</h2>  <input type="text" size="15"/> <br>
        <h2>이름</h2>  <input type="text" size="15"/> <br>
        <h2>휴대전화</h2> <input type="number" value="010" name="tel1" readonly/> &nbsp;-&nbsp; <input type="number" name="tel2"/> &nbsp;-&nbsp; <input type="number" name="tel3"/> <button bgcolor="orange">인증번호받기</button><br>
        <input type="number" value="인증번호 6자리 숫자입력" /> &nbsp;&nbsp; <button>인증번호 확인</button> 
    </div>

    <hr>
    <div class="use_mail">
      <h2>아이디</h2>  <input type="text" size="15"/> <br>
        <h2>이름</h2>  <input type="text" size="15"/> <br>
        <h2>휴대전화</h2> <input size="8" type="text" name="email"/> &nbsp;@ <input size="7" /> &nbsp;<button>인증번호받기</button> <br>
        <input type="number" value="인증번호 6자리 숫자입력" /> &nbsp;&nbsp; <button>인증번호 확인</button> 
    </div>
      <button type="submit">찾기</button>
      <button type="backToObj">이전</button>



    </form>
    </body>
</html>
