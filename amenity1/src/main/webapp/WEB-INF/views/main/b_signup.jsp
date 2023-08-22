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
  
  


  function combineEmail() {
    var email1 = document.getElementsByName("email1")[0].value;
    var email2 = document.getElementsByName("email2")[0].value;
    var email = email1 + "@" + email2;

    document.getElementById("email").value = email;

    return true;
  }

  function checkID() {
    var bno = $("input[name='b_no']").val();

    if (bno == "") {
        alert("아이디를 입력해주세요.");
        return false;
    }

    $.ajax({
        type: "POST",
        url: "${contextPath}/main/idCheck",
        data: { b_no: bno }, // 변수 이름을 'b_no'로 변경하고, 값을 bno로 설정
        success: function(cnt) {
            if (cnt > 0) {
                alert("이미 사용 중인 아이디입니다. 다른 아이디를 선택해주세요.");
            } else {
                alert("사용 가능한 아이디입니다.");
            }
        },
        error: function(request, status, error) {
            alert("서버에 문제가 발생했습니다. 다시 시도해주세요.");
        }
    });
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
      console.log("data : " +  data);
      checkInput.attr('disabled',false);
      code = data;
      alert('인증번호가 전송되었습니다.')
    }			
  }); 
}; 

$('#Check-Email-Btn').click(function () {
  const inputCode = $(this).val();
  const $resultMsg = $('#Check-Email-Input'); // 알림창 만들어야함 ! span 으로 비번 알림창 처럼

  if(inputCode === code){
    $resultMsg.html('인증번호가 일치합니다.');
    $resultMsg.css('color','blue');
    $('#Check-Email-Btn').attr('disabled',true);
    $('#email1').attr('readonly',true);
    $('#email2').attr('readonly',true);
    $('#email2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
    $('#email2').attr('onChange', 'this.selectedIndex = this.initialSelect');
  }else{
    $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
    $resultMsg.css('color','red');
  }
});

function combineBno() {
  var b_no1 = document.getElementsByName("b_no1")[0].value;
  var b_no2 = document.getElementsByName("b_no2")[0].value;
  var b_no3 = document.getElementsByName("b_no3")[0].value;
  var b_no = b_no1 + "-" + b_no2 + "-" + b_no3;
  console.log(b_no);
  document.getElementById("b_no").value = b_no;

  return true;
}



</script>
 <title>user_signup</title>
</head>
<body>
  <h1 style="text-align:center">사업자 회원가입</h1>
  <form class="form" name="business_signup" method="post" action="${contextPath}/main/businessSignup.do" enctype="multipart/form-data" onsubmit="return combineEmail() && combineBno();">
    <table border="0" align="center">
      <tr>
        <td align="right">사업자 등록 번호22</td>
        <td align="center">
          <div class="d-flex">
            <input type="text" class="form-control mr-2" style="width: 70px;" maxlength="10" name="b_no1">
            <span class="dash">-</span>
            <input type="text" class="form-control mx-2" style="width: 70px;" maxlength="10" name="b_no2">
            <span class="dash">-</span>
            <input type="text" class="form-control ml-2" style="width: 70px;" maxlength="10" name="b_no3">
            <input type="hidden" name="b_no" id="b_no">
          </div>				
        </td>
      </tr>

      <tr>
        <td align="right">비밀번호</td>
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
        <td align="right">계좌번호</td>
        <td align="center"><input type="text" style="width: 150px;" maxlength="16" name="account" /></td>
      </tr>

      <tr>
        <td align="right">이름</td>
        <td align="center"><input type="text" style="width: 150px;" name="name" /></td>
      </tr>
      <tr>
        <td align="right">주소</td>
        <td align="center"><input type="text" style="width: 150px;" name="addr" /></td>
      </tr>

      <tr>
        <td align="right">핸드폰 번호</td>
        <td align="center">
          <input type="text" style="width: 60px;" name="tel1" /> -
          <input type="text" style="width: 60px;" name="tel2" /> -
          <input type="text" style="width: 60px;" name="tel3" />
        </td>
      </tr>

      <tr>
        <td align="right">이메일</td>
        <td colspan="2">
          <input type="text" style="width: 80px;" name="email1" /> @ 
          <input type="text" style="width: 80px;" name="email2" />
          <input type="hidden" name="email" id="email">
          <select name="emailSelect" style="width: 100px;" onchange="changeEmailDomain()">
            <option value="custom" selected>직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
          </select>

          <button type="button" class="semail" id="Send-Email-Btn" onclick="SendEmail()">인증번호전송</button>
        </td>
      </tr>

      <tr>
        <td align="right">인증번호 확인</td>
        <td align="center">
          <input type="text" class="check-email-input" style="width: 100px;" size="7" maxlength="10" name="checkemail" />
        </td>
        <td>
          <button type="button" class="checkID" id="Check-Email-Btn">인증번호확인</button>
        </td>
      </tr>

      <tr>
        <td align="right"></td>
        <td align="left"><span id="sc"></span></td>
      </tr>

      <tr>
        <td colspan="3" align="center">
          <input type="submit" value="가입하기" style="width: 150px;" />
        </td>
      </tr>
    </table>
  </form>

</body>
</html>
