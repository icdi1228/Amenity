<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <style>
.center{
      
      text-align:center;
    }
    .outter-div{
	position: relative;
    height: 500px;
    }
    .inner-div1 {
     float : left;
    top: 10%;
    left: 36%;
	  width : 200px;
	  height : 200px;
	  background-color:#EFFFF4;
	  position: absolute;
	  margin: -50px 0 0 -50px;
	}

.inner-div2 {
    float : left;
    top: 10%;
    right: 36%;
	  width : 200px;
	  height : 200px;
	  background-color: #EFFFF4;
	  position: absolute;
	  margin: -50px 0 0 -50px;
	}
.inner-div3 {
    float : left;
    bottom: 10%;  
    left: 36%;
	  width : 200px;
	  height : 200px;
	  background-color: #F9F4FF;
	  position: absolute;
	  margin: -50px 0 0 -50px;
	}
.inner-div4 {
     float : left;
    bottom: 10%;
    right: 36%;
	  width : 200px;
	  height : 200px;
	  background-color: #F9F4FF;
	  position: absolute;
	  margin: -50px 0 0 -50px;
	}
  </style>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
    <h1 class="center">Amenity 로그인 / 회원가입</h1>
    <br><br><br>
  <div class="outter-div">
        <div class="inner-div1">
          <h2 class="center">일반로그인</h2>
          <br><br>
          <div class="center">
            <div class="btn-group">
              <a href="${contextPath}/main/u_login.do" class="btn btn-primary">로그인</a>
            </div>
          </div>
        </div>
      </td>
      <td>
        <div class="inner-div2">
          <h2 class="center">사업자로그인</h2>
           <br><br>
          <div class="center">
            <div class="btn-group">
              <a href="${contextPath}/main/b_login.do" class="btn btn-primary">로그인</a>
            </div>
          </div>
        </div>
        <div class="inner-div3">
          <h2 class="center">일반 회원가입</h2>
          <br><br>
          <div class="center">
            <div class="btn-group">
              <a href="${contextPath}/main/u_signup.do" class="btn btn-primary">회원가입</a>
            </div>
          </div>
        </div>
      </td>
      <td>
        <div class="inner-div4">
          <h2 class="center">사업자 회원가입</h2>
           <br><br>
          <div class="center">
            <div class="btn-group">
              <a href="${contextPath}/main/b_login.do" class="btn btn-primary">회원가입</a>
            </div>
          </div>
        </div>
      </td>
    </tr>
  </div>
  </table>
  
</body>
</html>