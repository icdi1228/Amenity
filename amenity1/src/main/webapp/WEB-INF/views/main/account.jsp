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
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <style>
    .outter-div{
      width:1000px;
      text-align:center;
      margin-left:100px;
    }
    .outter-div .inner-div{
      display: inline-block;
      margin:20px;
      

      background-color: #f2f2f2;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width:300px;
            box-sizing: border-box;
            transition: transform 0.2s ease-in-out;
    }

  </style>
</head>

<body>
    
  <div class="outter-div">
    <h1 class="center">Amenity 로그인 / 회원가입</h1>
    <br><br><br>
        <div class="inner-div">
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
        <div class="inner-div">
          <h2 class="center">사업자로그인</h2>
           <br><br>
          <div class="center">
            <div class="btn-group">
              <a href="${contextPath}/main/b_login.do" class="btn btn-primary">로그인</a>
            </div>
          </div>
        </div>
        <br>
        <div class="inner-div">
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
        <div class="inner-div">
          <h2 class="center">사업자 회원가입</h2>
           <br><br>
          <div class="center">
            <div class="btn-group">
              <a href="${contextPath}/main/b_signup.do" class="btn btn-primary">회원가입</a>
            </div>
          </div>
        </div>
      </td>
    </tr>
  </div>
  </table>
  
</body>
</html>