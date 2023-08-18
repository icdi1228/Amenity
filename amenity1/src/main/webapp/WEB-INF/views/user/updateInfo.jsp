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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
  body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      color: #333;
      margin: 0;
      padding: 20px;
  }
  .form {
      background: #fff;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      width: 700px;
      margin: auto;
  }
  table {
      width: 100%;
  }
  td {
      padding: 5px;
  }
  input[type="text"], input[type="password"], input[type="date"], select {
      width: 100%;
      padding: 5px;
      margin: 5px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
  }
  .btn, .sendmail, .checkID {
      background-color: #555;
      border: none;
      color: #f4f4f4;
      padding: 5px 10px;
      cursor: pointer;
      border-radius: 5px;
      margin-left: 5px;
  }
  .btn:hover, .sendmail:hover, .checkID:hover {
      background-color: #666;
  }
  #tel, #mail {
      width: auto;
      height: 36px;
  }
</style>
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

  function checkPassword() {
    var pw1 = document.getElementsByName("u_pw")[0].value;
    var pw2 = document.getElementsByName("pwd2")[0].value;
    if(pw1 != pw2) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    return true;
  }

</script>

<script>
  function changeEmailDomain() {
    var emailSelect = document.getElementsByName("emailSelect")[0];
    var email2 = document.getElementsByName("email2")[0];

    if(emailSelect.value === "custom") {
        email2.readOnly = false;
        email2.value = "";
    } else {
        email2.readOnly = true;
        email2.value = emailSelect.value;
    }
}

</script>
 <title>user_signup</title>
</head>
<body>
<h1 style="text-align:center">일반 회원가입</h1>
  <form class="form" name="user_signup" method="post" action="${contextPath}/main/userSignup.do" enctype="multipart/form-data" onsubmit="return combineEmail() && checkPassword();">
    <table border="0" align="center">
      <tr>
        <td align="right">이름</td>
        <td colspan="2"><input type="text" size="10" name="name" /></td>
      </tr>
      <tr>
        <td align="right">닉네임</td>
        <td colspan="2"><input type="text" size="10" name="nickname" /></td>
      </tr>
      <tr>
        <td align="right">생년월일</td>
        <td colspan="2"><input type="date" size="10" name="birth" /></td>
      </tr>
      <tr>
        <td align="right">비밀번호</td>
        <td colspan=2 align="left"><input type="password" size="20" maxlength="10" name="u_pw"/> </td>
      </tr>
      <tr>
        <td align="right">비밀번호 확인</td>
        <td colspan=2 align="left"><input type="password" size="20" maxlength="10" name="pwd2"/> </td>
      </tr>
      <tr>
        <td align="right">주소</td>
        <td colspan="2"><input type="text" size="10" name="name" /></td>
      </tr>
      <tr>
        <td align="right">이메일</td>
        <td colspan="2">
            <input type="text" size="4" name="email1" id="mail"/> @ 
            <input type="text" size="5" name="email2" id="mail" readonly />
            <select name="emailSelect" id="mail" onchange="changeEmailDomain()">
                <option value="naver.com">naver.com</option>
                <option value="nate.com">nate.com</option>
                <option value="google.com">google.com</option>
                <option value="custom">직접입력</option>
            </select>
        </td>
        <input type="hidden" name="email" id="email" />
      </tr>
          <tr>
            <td align="right"><button class="sendmail">인증번호 전송</button></td>
            <td colspan="2"><input type="text" size="10" name="" /></td>
          </tr>
        <tr>
		<td align="right">핸드폰 번호</td>
		<td>
			<input type="text" size="3" name="tel1" id="tel"/> -
			<input type="text" size="3" name="tel2" id="tel" /> -
			<input type="text" size="3" name="tel3" id="tel" />
		</td>
	</tr>
      <tr>
        <td align="right"> </td>
        <td colspan="2">
			<input type="button" value="돌아가기" onClick="backToList(this.form)" style="width: 150px;", style="height: 150px;"/>
			<input type="submit" value="가입하기" style="width: 150px;", style="height: 150px;" />
		</td>
      </tr>
    </table>
  </form>
</body>
</html>
