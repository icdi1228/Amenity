<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
    request.setCharacterEncoding("utf-8");



%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>그래프</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function backToList(obj) {
		obj.action="${contextPath}/main/main.do";
		obj.submit();
	}
	function fn_enable(obj){
		document.getElementById("upw").disabled=false;
        document.getElementById("upw").style.backgroundColor="white";
		document.getElementById("tel1").disabled=false;
        document.getElementById("tel1").style.backgroundColor="white";
        document.getElementById("tel2").disabled=false;
        document.getElementById("tel2").style.backgroundColor="white";
        document.getElementById("tel3").disabled=false;
        document.getElementById("tel3").style.backgroundColor="white";
		document.getElementById("unickname").disabled=false;
        document.getElementById("unickname").style.backgroundColor="white";
        document.getElementById("tr_btn_modify").style.display="inline-block";
        document.getElementById("tr_btn_modify").style.textAlign="center";
		document.getElementById("tr_btn_modify1").style.display="inline-block";
        document.getElementById("tr_btn_modify2").style.display="inline-block";
		document.getElementById("tr_btn").style.display="none";
	}

    function fn_disable(obj){
		document.getElementById("upw").disabled=true;
        document.getElementById("upw").style.backgroundColor="#f5f5f5";
		document.getElementById("tel1").disabled=true;
        document.getElementById("tel1").style.backgroundColor="#f5f5f5";
        document.getElementById("tel2").disabled=true;
        document.getElementById("tel2").style.backgroundColor="#f5f5f5";
        document.getElementById("tel3").disabled=true;
        document.getElementById("tel3").style.backgroundColor="#f5f5f5";
		document.getElementById("unickname").disabled=true;
        document.getElementById("unickname").style.backgroundColor="#f5f5f5";
		document.getElementById("tr_btn_modify1").style.display="none";
        document.getElementById("tr_btn_modify2").style.display="none";
		document.getElementById("tr_btn").style.display="inline-block";
        document.getElementById("tr_btn").style.textAlign="center";
	}


	function fn_modify_myInfo(obj) {
		obj.action="${contextPath}/user/updateInfo.do";
		obj.submit();
	}
</script>


        <style>
            body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
                    #relative{
            position:relative;
          }
          #absolute{
            position:absolute;
          }
          .out{
            width:1000px;
            height:700px;
           
          }
          .inner1{
            width:400px;
            height:400px;
           
            left:1%;
            top:1%;
          }
          .inner2{
            width:300px;
            height:300px;
            left:40%;
            top:1%;
           
          }
          .inner3{
            width:300px;
            height:200px;
            left:72%;
            top:1%;
          
          }
          .inner4{
            width:300px;
            height:200px;
            left:40%;
            top:50%;
           
          }
          .inner5{
            width:300px;
            height:300px;
            left:72%;
            top:50%;
        
          }
          .inner6{
            width:1000px;
            height:500px;
            left:1.5%;
            top:57%;
          
          }
          canvas {
            width: 100%;
            height: 100%;
        }

        #tr_btn_modify1,#tr_btn_modify2{
		display:none;
	}
    #tr_btn_modify{
        display:none;
    }
        


.container {
      
      justify-content: space-between;
      margin: 0 auto;
      padding: 20px;
      float:center;
    }
    
    .outter-div1, .outter-div2{
      background-color: #f5f5f5;
      border-radius: 10px;
      max-width:700px;      
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      text-align:center;
      margin: 0 10px;
    }
    
    .in3 {
      margin: 0;
    }
    .inner-div1 h4 {
      margin: 0;
    }
    .inner-div2, .inner-div3 {
      text-align: center;
    }
    .value {
      font-size: 24px;
      font-weight: bold;
      margin: 10px 0;
    }
    .inner-div5 img {
      max-width: 100px;
      height: auto;
    }
    
    .ares, .hd button {
      display: inline-block;
      padding: 8px 16px;
      border-radius: 5px;
      text-decoration: none;
      transition: background-color 0.3s;
    }
     .ares {
       margin-top:20px;
      background-color: #007bff;
      color: #fff;
      border:none;
    }
    .ares:hover, .hd button:hover, .edit-btn:hover {
      background-color: #0056b3;
    }
    th{
      padding:20px;
    }
    #tel1,#tel2,#tel3{
        width:70px;
    }
   
        </style>







    </head>
    <body>
            <section id="content1">

                <div class="container">
                  <div class="outter-div1">
                    <div class="inner-div1">
                      <div class="hd">
                        <h3 class="in3">내 정보</h3><br>
                        <form name="b_myPage" method="post" action="${contextPath}">
                        <table align="center" class="atb">
                          <tr align="center" class="atr">
                                    <th width="200"><b>아이디</b></th>
                                    <th width="300"><input style="border:none;background-color:#f5f5f5" type="text" name=u_id1" value="${userVO.u_id}" disabled/><input type="hidden" name="u_id" value="${userVO.u_id}"/></th>		
                            </tr>            
                          <tr align="center">
                                    <th width="150"><b>이름</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="name1" value="${userVO.name}" /><input type="hidden" name="name" value="${userVO.name}"/></th>	
                            </tr>
                            <tr align="center">
                              <th width="150"><b>닉네임</b></th>
                              <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="nickname" id="unickname" value="${userVO.nickname}" disabled/></th>		
                      </tr>
                          <tr align="center">
                                    <th width="150"><b>비밀 번호</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" id="upw" name="u_pw" value="${userVO.u_pw}" disabled/></th>		
                            </tr>
                          <tr align="center">
                                    <th width="150"><b>이메일</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="email1" value="${userVO.email}" /><input type="hidden" name="email" value="${userVO.email}"/></th>		
                            </tr>
                          <tr align="center">
                                    <th width="150"><b>전화 번호</b></th>
                                    <th width="400"><input style="border:none;background-color:#f5f5f5" type="text" name="tel1" id="tel1"  value="${userVO.tel1}" disabled />-<input style="border:none;background-color:#f5f5f5" type="text" name="tel2" id="tel2" value="${userVO.tel2}" disabled />-<input style="border:none;background-color:#f5f5f5" type="text" name="tel3" id="tel3" value="${userVO.tel3}" disabled/></th>		
                            </tr>            
                            <tr align="center">
                              <th width="150"><b>생년월일</b></th>
                              <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="birth"  value="${userVO.birth}" disabled/></th>		
                      </tr>
                          
                          <tr align="center">
                                    <th width="150"><b>가입일</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="credate"  value="${userVO.credate}" disabled/></th>		
                            </tr>

                            <!--추후 마일리지, 쿠폰함 생성 예정-->
                
                        </table>
                        <div id="tr_btn_modify">
                        <input id="tr_btn_modify1" class="ares" type="button" value="수정반영하기" onClick="fn_modify_myInfo(b_myPage)">
                        <input id="tr_btn_modify2" class="ares" type="button" value="취소" onClick="fn_disable(this.form)">
                        </div> 
                        <input id="tr_btn" type="button" class="ares" value="정보 수정" onClick="fn_enable(this.form)" />
                        </div>
                    </form>
            </section>
        
        </div>    




    
    </body>
</html>
