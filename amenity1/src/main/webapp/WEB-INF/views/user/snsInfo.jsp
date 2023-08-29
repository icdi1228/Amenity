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
    body {
      font-family: Arial, sans-serif;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 10px;
      width: 400px;
      border-bottom: 1px solid #ddd;
      text-align: center;
    }

    .text {
      text-align: right;
    }

    th {
      background-color: #f2f2f2;
    }

    #idCheck {
      width: 67%;
      padding: 10px;
      font-size: 20px;
    }

    #tel {
      width: 20%;
      padding: 10px;
      font-size: 15px;
      text-align: center;
    }

    .pw {
      width: 67%;
      padding: 10px;
      font-size: 20px;
    }
    
    .name {
      width: 67%;
      padding: 10px;
      font-size: 20px;
    }

    .birth {
      width: 67%;
      padding: 10px;
      font-size: 20px;
    }

    input[type="button"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    input[type="button"]:hover {
      background-color: #45a049;
    }

    #dupliButton {
      float:left;
      height: 50px;
    }

    #same {
      float: left;
    }
 </style>
 <script>
  $(document).ready(function(){
    $('#same').html('비밀번호는 6글자 이상 입니다.');
    $('#same').css('color', 'grey');
  });

  // 비밀번호 검사
  function checkpw(){
    var p1 = $('#pw1').val();
    var p2 = $('#pw2').val();

    if (p1.length < 6 || p1.length > 16) {
      $('#same').html('다시 작성해 주세요.');
      $('#pw1').css('color', 'grey');
      return false;

      p1=p2='';
      document.getElementById('same').innerHTML='';
    }
    if(p1 != "" || p2 != "") {
        if(p1 == p2) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.color='blue';
            $("#u_pw").val(p1); 
            return true;
        }
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color='red';
            return false;
        }
    }
  }
</script>
</head>
<body>
  <form name="userRegisterForm" id="userRegisterForm" method="POST">
    
    <input type="hidden"  id="email" name="email" value="${email}"/>
    <input type="hidden"  id="snsid" name="snsid"  value="${id}">
    <input type="hidden"  id="flag" name="flag"  value="${flag}">
    <input type="hidden"  id="nickname" name="nickname"  value="${nickname}">
    
    <table>
      <thead>
        <tr>
          <th colspan="4">신규 가입 추가 정보 설정</th>
        </tr>
      </thead>
      <tbody>
        
        <tr>
          <td class="text"> 아이디</td>
          <td >
            <input type="text" id="idCheck" name="idCheck">
            <input type="hidden" id="u_id" name="u_id">
          </td>
          <td><button id="dupliButton" type="button" onclick="checkId()">중복체크</button></td>
        </tr>

        <tr>
          <td class="text"> 비밀번호</td>
          <td >
            <input type="password" class="pw" id="pw1" name="pw1" onchange="checkpw()" />
            <input type="hidden" id="u_pw" name="u_pw">
          </td>
          <td></td>
        </tr>

        <tr> 
          <td class="text"> 비밀번호 확인</td>
          <td>
            <input type="password" class="pw" id="pw2" name="pw2" onchange="checkpw()" />
          </td>
          <td><span id="same"></span></td>
        </tr>



        <tr>
          <td class="text">이름</td>
          <td align="center">
            <input type="text" class="name" name="name" />
          </td>
          <td></td>
        </tr>


        <tr>
          <td class="text">생년월일</td>
          <td align="center">
            <input type="date" class="birth" name="birth" />
          </td>
          <td></td>
        </tr>



        <tr>
          <td class="text">전화번호</td>
          
          <td align="center">
            <input type="text" class="tel1" name="tel1" id="tel"/> - <input type="text" class="tel2" name="tel2" id="tel" /> - <input type="text" class="tel3" name="tel3" id="tel" />
          </td>

          <td></td>
        </tr>

        <tr>
          <td></td>
          <td><input type="button" id="regiButton" onclick="register()" value="회원가입" /></td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </form>  

</body>
<script>
  function checkId(){
    var idCheck = $("#idCheck").val();
    var userId = $("#u_id").val();
    var regExp =  /^[가-힣|a-z|A-Z|0-9|]+$/;

    if(idCheck == null || idCheck == ""){
      alert("아이디을 입력 해주세요");
      return false;
    }
    if(!regExp.test(idCheck)){
      alert("아이디은 한글, 영어, 숫자만 4 ~10자리로 입력 가능합니다.");
      return false;
    }

    $.ajax({
      type : 'POST',
      url: "/main/idCheck",
      data : {u_id:idCheck },
      success : function(cnt){

        if (cnt > 0) {
          alert("이미 존재하는 아이디 입니다.");
          $("#idCheck").val("");
        } 
        else {
          alert("사용 가능한 아이디입니다.");   
          $("#u_id").val(idCheck); 
        }
      },

      error: function(xhr, status, error){
        alert("에러" + error);
      }

    });
  }
  
  function serializeObject(form) {
      var data = {};
      form.serializeArray().forEach(function(item) {
        data[item.name] = item.value;
      });
      return data;
    }

  
  function register(){
    var registerData = serializeObject($("form[name=userRegisterForm]"));
    var name = $(".name").val();
    var tel1 = $(".tel1").val();
    var tel2 = $(".tel2").val();
    var tel3 = $(".tel3").val();
    var pw1 = $("#pw1").val();
    var pw2 = $("#pw2").val();



    if(registerData.u_id == null || registerData.u_id == ""){
      alert("아이디 중복 체크를 진행 해주세요");
      return false;
    }

    if(pw1 == null || pw1 == ""){
      alert(" 비밀번호를 입력해 주세요 ");
      return false;
    }
    else if (pw2 == null || pw2 == ""){
      alert(" 비밀번호 확인란을 작성해주세요 ");
      return false;
    }

    if(name == null || name == ""){
      alert(" 이름을 입력해주세요");
      $(".name").focus();
      return false;
    }

    if(tel1 == null || tel1 == ""){
      alert(" 전화번호 앞자리를 입력해주세요");
      $(".tel").focus();
      return false;
      
      if(tel2 == null || tel2 == ""){
        alert(" 가운데 전화번호를 입력해주세요");
        $(".tel").focus();
        return false;

        if(tel3 == null || tel3 == ""){
          alert(" 전화번호 끝자리를 입력해주세요");
          $(".tel").focus();
          return false;
        }  
      }
    }
    
    if(name == null || name == ""){
      alert(" 이름을 입력해주세요");
      $(".name").focus();
      return false;
    }

    
    $.ajax({
      type : 'POST',
      url : '/user/SnsRegisterPro.do',
      data : registerData,
      dataType : 'json',
      success : function(data){
        if(data.JavaData == "YES"){
          alert("가입되었습니다.");
          location.href = '/main/main.do'
        }
        else{
          alert("2. 가입에 실패했습니다.");
        }
      },
      error: function(xhr, status, error){
        alert("1. 가입에 실패했습니다."+ error);
      }
    });
  }
  </script>

</html>
