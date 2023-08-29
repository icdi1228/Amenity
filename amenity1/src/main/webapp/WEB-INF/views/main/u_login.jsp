<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 


<html>
<head>
  <meta charset="UTF-8">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <title>user_signup</title>
  <style>
    .ulogin1 {
      white-space: nowrap;
    }

    a {
      text-decoration: none;
      font-weight: bold;
      color: #333;
    }

    table {
      padding: 50px;
    }

    .sub {
      display: inline-block;
      text-align: center;
      margin: 10px;
    }

    .apis {
      display: inline-block;
      text-align: center;
      padding: 30px;
    }

    .apis input {
      margin: 20px;
      padding: 15px;
      width: 100px;
      height: 100px;
    }

    .box1 {
      text-align: center;
      display: block;
      width: 100%;
      height: 300px;
    }

    .buttons {
      text-align: center;
    }

    .buttons input {
      width: 200px;
      height: 60px;
     
      color: white;
      border-radius: 3px;
      font-size: 1.5em;
      border: none;
      margin: 10px;
      cursor: pointer;
    }


    .easylogin {
      text-align: center;
      padding: 0;
    }

    .button-container {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 20px;
    }

    .login-link {
      display: flex;
      align-items: center;
      padding: 15px;
      border-radius: 3px;
      cursor: pointer;
      margin: 0 10px;
      text-decoration: none;
      color: #333;
    }

    .login-link img {
      vertical-align: middle;
      margin-right: 10px;
      width: 170px;
      height: 50px;
    }

.buttons input {
  /* ... (이전 스타일들) ... */
  background-color: #007bff;
  transition: background-color 0.3s;
}

.buttons input:hover {
  background-color: #0056b3;
}

.back-button {
  /* ... (이전 스타일들) ... */
  background-color: #0056b3;
  
  color: #333;
  transition: background-color 0.3s, color 0.3s;
}

.back-button:hover {
  background-color: #ccc;
  color: #fff;
}
  </style>

 </style>
 <script>
  // 이전 페이지 URL을 세션 스토리지에 저장하는 함수
  function savePreviousPageURL() {
    var previousURL = document.referrer;
    sessionStorage.setItem("previousPageURL", previousURL);
  }
</script>
</head>
<body>
  <div class="ulogin1">
<h1 style="text-align:center">일반 회원로그인</h1>
  
<form name="user_signup" method="post" action="${contextPath}/main/u_signIn.do" onsubmit="savePreviousPageURL()">
    <table border="0" align="center">
      <tr>
					<td align="right"> 아이디</td>
        <td align="left"><input type="text" size="10" maxlength="10"  name="u_id">
          
			</tr>
			<tr>
				<td align="right">비밀번호</td>
				<td colspan=2  align="left"><input type="password" size="10" maxlength="10"  name="u_pw"/> </td>
		</tr>
            
     </tr>
    </table>

  <div class="box1">
    <div class="sub">
			   
			 <a href="${contextPath}/main/ufind_id.do">아이디 찾기</a> |
        <a href="${contextPath}/main/ufind_pwd.do">비밀번호 찾기</a> |
      <a href="#">회원가입</a>
    </div>
	 		<br>
	  <div class="apis">
      
      <p class="easylogin"><a href="#">간편로그인(민간인증서) </a></p><br>

      <div class="button-container">
        <a href="javascript:void(0)" class="login-link kakao-link" onclick="kakaoLogin();">
          <img height="50px" src="${contextPath}/resources/images/kakao_login.png"/>
        </a>

        <a href="#" class="login-link naver-link">
          <img src="${contextPath}/resources/images/btnG_naver.png" alt="네이버 아이콘">
        </a>

        <a href="#" class="login-link google-link">
          <img src="${contextPath}/resources/images/btn_google_signin_dark_normal_web.png" alt="구글 아이콘">
        </a>

      </div>

    </div>
    
  </div>

    <div class="buttons">
	  <input type="submit" value="로그인" />   
    <input type="button" value="돌아가기"onClick="backToList(this.form)" />
    </div>
    
    <ul>
      <li onclick="kakaoLogin();">
          <a href="javascript:void(0)">
              <span>카카오 로그인</span>
          </a>
      </li>
      <li onclick="kakaoLogout();">
          <a href="javascript:void(0)">
              <span>카카오 로그아웃</span>
          </a>
      </li>
    </ul>

  </form>
</div>

  <form name="kakaoForm" id="kakaoForm" method = "post" action="/user/setSnsInfo.do">
    <input type="hidden" name="email" id="kakaoEmail" />
    <input type="hidden" name="id" id="kakaoId" />
    <input type="hidden" name="nickname" id="kakaoNickname" />

    <input type="hidden" name="flag" id="flag" value="kakao" />
  </form>

</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('09a69607021c18fcbf7d4dfe667b60bf'); 
console.log(Kakao.isInitialized()); // sdk초기화여부판단



//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',

          success: function (response) {
            KakaoLoginPro(response),
        	  console.log(response)
          },

          fail: function (error) {
            console.log(error)
          },

        })
      },

      fail: function (error) {
        console.log(error)
      },
    })
  }

//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  


  function KakaoLoginPro(response){
	  var data = {id:response.id, email:response.kakao_account.email, nickname:response.kakao_account.profile.nickname }
    
	  $.ajax({
  		type : 'POST',
		  url : '/user/kakaoLoginPro.do',
		  data : data,
		  dataType : 'json',

		  success : function(data){
  			console.log(data)
        
			  if(data.JavaData == "YES"){
  				alert("로그인되었습니다.");
				  location.href = '/main/main.do'
			  }
        else if(data.JavaData == "register"){
  				$("#kakaoEmail").val(response.kakao_account.email);
				  $("#kakaoId").val(response.id);
          $("#kakaoNickname").val(response.kakao_account.profile.nickname);
          
				  $("#kakaoForm").submit();

			  }
        else{
  				alert("로그인에 실패했습니다22");
			  }
      
		  },

		  error: function(xhr, status, error){
        alert("로그인에 실패했습니다11."+ error);
		  }
	  });
  }

</script> 

</html>
