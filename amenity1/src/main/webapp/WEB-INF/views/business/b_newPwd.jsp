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
      max-width: 700px;
      margin: auto;
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    td {
      padding: 10px;
    }
    .form td input[type="text"],
    .form td input[type="password"],
    .form td input[type="date"],
    .form td select {
      width: 100%;
      height: 30px;
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
      font-size: 14px;
    }
    .btn:hover, .sendmail:hover, .checkID:hover {
      background-color: #666;
    }
    select {
      width: 100%;
      height: 30px;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    #tel, #email1, #email2, #chemail, .check-email-input {
      width: 100px;
      height: 30px;
      padding: 5px;
    }
    .semail {
      background-color: #555;
      border: none;
      color: #f4f4f4;
      padding: 5px 10px;
      cursor: pointer;
      border-radius: 5px;
      margin-top: 6px;
      font-size: 14px;
      float: right;
    }
    #same {
      font-size: 14px;
      margin-top: 5px;
    }
    .dash {
      margin: 0 5px;
      align-self: center;
    }
    .check-email-input {
      width: 250px;
      height: 30px;
      padding: 5px;
      margin-top: 5px;
    }
    #Check-Email-Btn {
      background-color: #555;
      border: none;
      color: #f4f4f4;
      padding: 5px 10px;
      cursor: pointer;
      border-radius: 5px;
      font-size: 14px;
      margin-left:20px;
    }
    #Check-Email-Btn:disabled {
      background-color: #ccc;
      cursor: not-allowed;
    }
    #Check-Email-Input {
      font-size: 14px;
      margin-top: 5px;
    }
    .color-blue {
      color: blue;
    }
    .color-red {
      color: red;
    }


</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"> 
  function backToList(obj){
    obj.action="${contextPath}/main/acount.do";
    obj.submit();
  }
  
  

// 사업자 등록번호 합치기
  function combineBno() {
  var b_no1 = document.getElementsByName("b_no1")[0].value;
  var b_no2 = document.getElementsByName("b_no2")[0].value;
  var b_no3 = document.getElementsByName("b_no3")[0].value;
  var b_no = b_no1 + "-" + b_no2 + "-" + b_no3;
  console.log(b_no);
  document.getElementById("b_no").value = b_no;

  return true;
}




// 비밀번호 검사
function checkpw(){
  var p1 = document.getElementById('pw1').value;
  var p2 = document.getElementById('pw2').value;

  if (p1.length < 6 || p1.length > 16) {
      document.getElementById('same').innerHTML='다시 작성해 주세요.';
      document.getElementById('same').style.color='grey';
      return false;

      p1=p2='';
      document.getElementById('same').innerHTML='';
    }
    if(p1 != "" || p2 != "") {
        if(p1 == p2) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.color='blue';
            return true;
        }
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color='red';
            return false;
        }
    }
}

// 화면 load 시 실행
$(document).ready(function(){
  $('#same').html('비밀번호는 6글자 이상 입니다.');
  $('#same').css('color', 'grey');
});



</script>
 <title>user_signup</title>
</head>
<body>
  <h1 style="text-align:center"> 비밀번호 재설정</h1>
  <form class="form" name="business_newpw" id="business_newPw" method="post" action="${contextPath}/business/b_updatePwd.do" enctype="multipart/form-data">
    <table border="0" align="center">



<tr>
    <input type="hidden" name="b_no" value="${b_no}"/>
    <td align="right">새 비밀번호</td>
    <td align="center"><input type="password" class="pw" id="pw1" maxlength="16" name="b_pw" onchange="checkpw()" /> </td>
</tr>

  <tr>
    <td align="right">비밀번호 확인</td>
    <td align="center"><input type="password" class="pw" id="pw2" maxlength="16" name="pwd2" onchange="checkpw()" /></td>
  </tr>
  <tr>
    <td align="right"></td>
    <td align="center"><span id="same"></span></td>
  </tr>

  <tr>
    <td colspan="3" align="center">
      <input type="submit" value="변경하기" style="width: 150px;" />
    </td>
  </tr>

  <tr>
    <td colspan="3" align="center">
      <input type="button" value="취소" style="width: 150px;" />
    </td>
  </tr>


    </table>
  </form>








  

</body>
</html>























  
  