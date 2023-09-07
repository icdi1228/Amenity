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
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <title>user_signup</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      color: #333;
      margin: 0;
      padding: 20px;
  }
    .ulogin1 {
      white-space: nowrap;
      background: #fff;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      width: 700px;
      margin: auto;
    }

    a {
      text-decoration: none;
    }

    table {
      padding: 50px;
    }

    .sub {
      display: inline-block;
      text-align: center;
      margin: 20px;
      
    }
    .sub a{
      margin:10px;
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



    .easylogin {
      text-align: center;
      padding: 0;
    }

    .button-container {
      margin-bottom:20px;
    }

    .login-link {
    
      margin:10px;
      text-decoration: none;

    }

    .login-link img {
      vertical-align: middle;
      width: 200px;
      height: 50px;
      margin-top:10px;
    }



table tr td{
  padding:10px;
  
}
.btn-primary{
  width:100px;
  height:100px;
  margin-bottom:20px;
  padding:0;
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
<h1 id="hhhhh" style="text-align:center">일반 회원로그인</h1>
<br>
  
<form name="user_signup" method="post" action="${contextPath}/main/u_signIn.do" onsubmit="savePreviousPageURL()">
    <table border="0" align="center">
      <tr>
					<td align="right"> 아이디</td>
        <td align="left"><input class="form-control mr-2"  type="text" size="20" maxlength="10"  name="u_id">
          <td colspan="3" rowspan="3"><input type="submit" class="btn btn-primary mr-2" value="로그인" /></td>
          
			</tr>
			<tr>
				<td align="right">비밀번호</td>
				<td align="left"><input class="form-control mr-2"  type="password" size="20" maxlength="10"  name="u_pw"/> </td>
        <td></td>
		</tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
    </tr>
            
     </tr>
    </table>

  <div class="box1">
    <div class="sub">
			   
			 <a class="mr-2" href="${contextPath}/main/ufind_id.do">아이디 찾기</a>
        <a class="mr-2" href="${contextPath}/main/ufind_pwd.do">  비밀번호 찾기</a>
      <a href="#">  회원가입</a>
    </div>
	 		<br>
	  <div class="apis">
      
     

      <div class="button-container">
        <p class="easylogin">간편로그인</p>
        <a href="javascript:void(0)" class="login-link kakao-link" onclick="kakaoLogin();">
          <img height="50px" src="${contextPath}/resources/images/kakao_login.png"/>
        </a>
<br>
        <a id="naverIdLogin_loginButton" href="javascript:void(0)" class="login-link naver-link">
          <img height="50px" src="${contextPath}/resources/images/btnG_naver.png">
        </a>


      </div>

    </div>
    
  </div>

    <div class="d-flex justify-content-center">
	     
    <input type="button" class="btn btn-secondary" value="돌아가기"onClick="backToList(this.form)" />
    </div>


  </form>
  <form name="kakaoForm" id="kakaoForm" method = "post" action="/user/setSnsInfo.do">
    <input type="hidden" name="email" id="kakaoEmail" />
    <input type="hidden" name="id" id="kakaoId" />
    <input type="hidden" name="nickname" id="kakaoNickname" />
    <input type="hidden" name="flag" id="flag" value="kakao" />
  </form>

  <form name="naverForm" id="naverForm" method = "post" action="/user/setSnsInfo.do">
    <input type="hidden" name="email" id="naverEmail" />
    <input type="hidden" name="id" id="naverId" />
    <input type="hidden" name="nickname" id="naverNickname" />
    <input type="hidden" name="flag" id="flag" value="naver" />
  </form>
</div>

  

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
          naverLogout();
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
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
  var naverLogin = new naver.LoginWithNaverId(
    {
      clientId: "ewX2AZ8OrQC21OL_xYbc", 
      callbackUrl: "http://localhost:8080/main/u_login.do", 
      isPopup: false,
      callbackHandle: true
    }
  );	
      
  naverLogin.init();
    
  window.addEventListener('load', function(){
	naverLogin.getLoginStatus(function (status) {
		if(status) {
			var data = {
        id:naverLogin.user.getId(), 
        email:naverLogin.user.getEmail(), 
        nickname:naverLogin.user.getNickName()
      }
      
      $.ajax({
  		        type : 'POST',
		          url : '/user/NaverLoginPro.do',
		          data : data,
		          dataType : 'json',

		          success : function(data){

      			  if(data.JavaData == "YES"){
                location.href = '/main/main.do'
			        }
              else if(data.JavaData == "register"){
  				      $("#naverEmail").val(naverLogin.user.getEmail());
				        $("#naverId").val(naverLogin.user.getId());
                $("#naverNickname").val(naverLogin.user.getNickName());
          
				        $("#naverForm").submit();
    			    }
              else{
  				      alert("로그인에 실패했습니다");
			        }
      		  },
		        error: function(xhr, status, error){
              alert("로그인에 실패했습니다."+ error);
		        }
	        });

		} 
    else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


function naverLogout() {
    naverLogin.getLoginStatus(function(status) {
        if (status) {
            naverLogin.logout(); 

            openPopUp();
            setTimeout(function() {
                closePopUp();
				location.reload();
            }, 1000);
        } else {
            console.log("이미 로그아웃 상태입니다.");
        }
    });
}

</script>

</html>
