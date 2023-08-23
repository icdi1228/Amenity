<!DOCTYPE html>
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
    /* 추가된 스타일 */
    .verification-code-container {
      display: none;
    }
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"> 
  function backToList(obj){
    obj.action="${contextPath}/main/acount.do";
    obj.submit();
  }

  // 이메일 합치기
  function combineEmail() {
    var email1 = document.getElementsByName("email1")[0].value;
    var email2 = document.getElementsByName("email2")[0].value;
    var email = email1 + "@" + email2;

    document.getElementById("email").value = email;

    return true;
  }

  // 이메일 뒷 형식 수정함 
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

  // 인증번호 전송 버튼 클릭시 실행
  function SendEmail() {
    const email = $('#email1').val() + "@" + $('#email2').val(); // 이메일 합치고
    console.log('완성된 이메일 : ' + email); // 잘합쳐졌나 체크하고
    const checkInput = $('.check-email-input') // 인증번호 입력하는곳  
    
    $.ajax({
      type : 'get',
      url: "${contextPath}/user/sendEmail.do?email=" + email,
      success : function (data) {
        //console.log("data : " +  data);
        checkInput.attr('disabled',false);
        code = data;
        alert('인증번호가 전송되었습니다.');
        
        // 인증번호 입력란 표시
        $('.verification-code-container').show();
        
       
      }			
    });
  }; 

  // 인증번호와 작성값 비교
  function checknum() {
    const inputCode = $('#Check-Email-Input').val(); // 인증번호 작성한곳
    const resultMsg = $('#sc'); // 알림영역

    if (inputCode === code) {
      resultMsg.html('인증번호가 일치합니다.');
      resultMsg.css('color', 'blue');

      $('#Check-Email-Btn').attr('disabled', true);
      $('#email1').attr('readonly', true);
      $('#email2').attr('readonly', true); 
      $('#chemail').attr('readonly', true);  // 비활성화

      $('#chemail').attr('onFocus', 'this.initialSelect = this.selectedIndex');
      $('#chemail').attr('onChange', 'this.selectedIndex = this.initialSelect');
       // 버튼 활성화
       $('#submit-button').prop('disabled', false);
      return true;
    } 
    else {
      resultMsg.html('다시 확인해주세요!');
      resultMsg.css('color', 'red');
      return false;
    }
  }

  function enableSendEmailButton() {
    const email1 = $('#email1').val();
    const email2 = $('#email2').val();
    const emailSelect = $('#chemail').val(); 

    const sendEmailButton = document.getElementById('Send-Email-Btn'); 

    if (emailSelect === 'custom') {
      sendEmailButton.disabled = !(email1 && email2);
    } 
    else {
      sendEmailButton.disabled = !(email1 && email2);
    }
  }

</script>
 <title>user_findpwd</title>
</head>
<body>
  <h1 style="text-align:center">사용자 비밀번호 찾기</h1>
  <form class="form" name="user_findpwd" method="post" action="${contextPath}/user/userFindPwd.do" enctype="multipart/form-data" onsubmit="return combineEmail() && combineBno();">
    <table border="0" align="center">
      <tr>
        <td align="right">아이디</td>
        <td align="center">
          <div class="d-flex">
            <input type="text" class="form-control mr-2" style="width: 100px;" maxlength="10" name="u_id">
          </div>				
        </td>
      </tr>

      <tr>
        <td align="right">이름</td>
        <td align="center"><input type="text" style="width: 150px;" name="name" /></td>
      </tr>

      <tr>
        <td align="right">이메일</td>
        <td colspan="2">
          <input type="text" style="width: 80px;" name="email1" id="email1" oninput="enableSendEmailButton()" /> @ 
          <input type="text" style="width: 80px;" name="email2" id="email2" oninput="enableSendEmailButton()" />
          <input type="hidden" class="email" name="email" id="email">
          <select name="emailSelect" style="width: 100px;" id="chemail" onchange="changeEmailDomain(); enableSendEmailButton();">
            <option value="custom" selected>직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
          </select>

          <button type="button" class="semail" id="Send-Email-Btn" onclick="SendEmail()">인증번호전송</button>
        </td>
      </tr>

      <!-- 추가된 부분: 인증번호 입력란과 메시지 -->
      <tr class="verification-code-container">
        <td align="right">인증번호 확인</td>
        <td align="center">
          <input type="text" class="check-email-input" style="width: 100px;" size="7" maxlength="10" name="checkemail" id="Check-Email-Input" />
        </td>
        <td>
          <button type="button" class="checkID" id="Check-Email-Btn" onclick="checknum()">인증번호확인</button>
        </td>
      </tr>

      <tr>
        <td align="right"></td>
        <td align="left"><span id="sc"></span></td>
      </tr>

      <!-- 버튼 비활성화/활성화 -->
      <tr>
        <td colspan="3" align="center">
          <input type="submit" value="비밀번호 재설정" style="width: 150px" id="submit-button" disabled />
        </td>
      </tr>
    </table>
  </form>
</body>
</html>
