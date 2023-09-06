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
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
      width:300px;
  }

  .form td input[type="text"], .form td input[type="password"], .form td input[type="date"], .form td select{
      width: 200px;
      height: 25px;
      padding: 5px;
      margin: 5px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
  }

   .sendmail, .checkID {
      background-color: #555;
      border: none;
      color: #f4f4f4;
      padding: 5px 5px;
      cursor: pointer;
      border-radius: 5px;
      margin-left: 5px;
      float:left;
      width: 90px;
      height:30px;
      font-size:12px;
  }


#same {
  font-size: 15px;
}

select {
    width: 100%;
    height:100%;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;

}

 .sendmail:hover, .checkID:hover {
      background-color: #666;
  }

  #tel {
      width: 60px;
      height: 25px;
  }

  #email1 ,#email2 {
    width: 100px;
    height: 25px;
  }

  #chemail {
    padding-right: 3px;
    width: 115px;
    height: 30px;
  }

  .semail {
   background-color: #555;
      border: none;
      color: #f4f4f4;
      padding: 5px 5px;
      cursor: pointer;
      border-radius: 5px;
      margin-top:6px;
      float:right;
      width: 100px;
      height:30px;
      font-size:12px;
}



</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"> 

// 화면 load 시 실행
$(document).ready(function(){
  $('#same').html('비밀번호는 6글자 이상 입니다.');
  $('#same').css('color', 'grey');
  const sEmail = document.getElementById('Send-Email-Btn'); 
  sEmail.disabled = true;
});

  
  var cnt=1;
  function fn_addFile(){
    $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
    cnt++;
  }  

  
  function combineEmail() {
    var email1 = document.getElementsByName("email1")[0].value;
    var email2 = document.getElementsByName("email2")[0].value;
    var email = email1 + "@" + email2;

    document.getElementById("email").value = email;
    return true;
  }
  

  function checkID() {
    var userId = $("input[name='u_id']").val();

    if (userId == "") {
        alert("아이디를 입력해주세요.");
        return false;
    }

    $.ajax({
        type: "POST",
        url: "${contextPath}/main/idCheck",
        data: { u_id: userId }, // 변수 이름을 'u_id'로 변경하고, 값을 userId로 설정
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
				alert('인증번호가 전송되었습니다.')
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
 <title>user_signup</title>
</head>
<body>
 
  <form class="form" name="user_signup" method="post" action="${contextPath}/main/u_addsignup.do" enctype="multipart/form-data" onsubmit="return combineEmail()">
    <h1 style="text-align:center">일반 회원가입</h1>
    <table border="0" align="center">
		<tr>
			<td align="right">아이디</td>
			<td align="center">
				<input type="text" size="20" maxlength="10" name="u_id" required/>
			</td>
			<td>
				<button type="button" class="checkID" onclick="checkID()">중복확인</button>
			</td>
		</tr>

      <tr>
        <td align="right">비밀번호</td>
        <td align="center"><input type="password" class="pw" id="pw1" maxlength="16" name="u_pw" onchange="checkpw()" required/> </td>
      </tr>

      <tr>
        <td align="right">비밀번호 확인</td>
        <td align="center"><input type="password" class="pw" id="pw2" maxlength="16" name="pwd2" onchange="checkpw()" required/></td>
      </tr>
        
      <tr>
        <td align="right"></td>
        <td align="center"><span id="same"></span></td>
      </tr>

      <tr>
        <td align="right">이름</td>
        <td align="center"><input type="text" name="signname" required/></td>
      </tr>
      <tr>
        <td align="right">닉네임</td>
        <td align="center"><input type="text" name="nickname" required/></td>
      </tr>
      <tr>
        <td align="right">생년월일</td>
        <td align="center"><input type="date" name="birth" required/></td>
      </tr>

      <tr>
		    <td align="right">핸드폰 번호</td>
		    <td align="center">
			    <input type="text" name="tel1" id="tel" required/> -
			    <input type="text" name="tel2" id="tel" required/> -
			    <input type="text" name="tel3" id="tel" required/>
		    </td>
	    </tr>
      
  <tr>
			<td align="right">이메일</td>
			<td colspan="2">
				<input type="text" name="email1" id="email1" oninput="enableSendEmailButton()" required/> @ 
        <input type="text" name="email2" id="email2" oninput="enableSendEmailButton()" required/>
        <input type="hidden" class="email" name="email" id="email"/>
        <select name="emailSelect" id="chemail" onchange="changeEmailDomain(); enableSendEmailButton();">
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
          <input type="text" class="Check-Email-Input" size="20" maxlength="10" name="checkemail" id="Check-Email-Input" />
      </td>
      <td>
          <button type="button" class="checkID" id="Check-Email-Btn" onclick="checknum()">인증번호확인</button>
      </td>
    </tr>
  
  <tr>
      <td align="right"></td>
      <td align="center"><span id="sc" name="cn"></span></td>
  </tr>

      
      <tr>
        <td colspan="3" align="center">
			    <input class="btn btn-primary mr-2" type="submit" value="가입하기"/>
		    </td>
      </tr>
    </table>
  </form>

</body>
</html>
