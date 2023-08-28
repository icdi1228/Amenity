<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
  <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

table {
    border-collapse: collapse;
    width: 100%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}
td, th {
    padding: 10px;
    border: 1px solid #ddd;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}
td:nth-child(odd){
  width:200px;
}
td:nth-child(even){
  width:700px;
}
tr:hover {
    background-color: #f5f5f5;
}

tr:first-child {
    background-color: #e6e6e6;
    color: black;
}

.cls2 {
    text-align: center;
    font-size: 20px;
    margin: 20px 0;
}

a.cls1, a.no-uline, a.sel-page {
    color: #3498db;
    text-decoration: none;
    padding: 5px;
}

a.cls1:hover, a.no-uline:hover, a.sel-page:hover {
    text-decoration: underline;
}

a.sel-page {
    color: red;
    font-weight: bold;
}

div.cls2 {
    text-align: center;
    margin-top: 20px;
}

a.cls1 {
    display: inline-block;
    background-color: #3498db;
    color: white;
    padding: 10px 20px;
    text-align: center;
    border-radius: 5px;
    margin: 20px 0;
}

a.cls1:hover {
    background-color: #2980b9;
}
  </style>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
  <table align="center" width="80%">
    <tr>
      <td>공지</td>
      <td>제목</td>
    </tr>
    <tr>
      <td>알림</td>
      <td>[공지] 국민카드 무이자 할부 안내</td>
    </tr>
    <tr>
      <td>알림</td>
      <td>[공지] 공지사항</td>
    </tr>
    <tr>
      <td>알림</td>
      <td>[공지] 홈페이지 점검 안내</td>
    </tr>
    <tr>
      <td>알림</td>
      <td>[공지] 하나카드 결제 무이자 할부 안내</td>
    </tr>
    <tr>
      <td>알림</td>
      <td>[공지] 알려드립니다... </td>
    </tr>
    <tr>
      <td>알림</td>
      <td>[공지] 이벤트 종료 안내</td>
    </tr>
  </table>
  <div class="cls2">
      <!-- 페이지네이션 부분 -->
  </div>
  
</body>

</html>