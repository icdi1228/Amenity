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

 <title>newCompany</title>
</head>
<body>
  <h1 style="text-align:center">새 업체 등록하기</h1>
  <form class="form" name="newCompany" method="post" action="${contextPath}/business/addNewCompany.do" enctype="multipart/form-data" >
    <table border="0" align="center">
      <tr>
        <td align="right">사업자 등록 번호</td>
        <td align="center">
          <div class="d-flex">
            <input type="text" class="form-control mr-2" style="width: 200px;" maxlength="20" name="b_no" value="${businessVO.b_no}" readonly>            
          </div>				
        </td>
      </tr>
      <tr>
        <td align="right">업체명</td>
        <td align="center"><input type="text" name="company"/> </td>
      </tr>

      <tr>
        <td align="right">업체 종류</td>
        <td colspan="2">
          <input type="text" style="width: 80px;" name="category" />                    
          <select name="categorySelect" style="width: 100px;" onchange="changeCategory()">
            <option value="custom" selected>종류를 선택해주세요.</option>
            <option value="Hotel">Hotel</option>
            <option value="Motel">Motel</option>
            <option value="Pention">Pention</option>
            <option value="PoolVilla">Pool Villa</option>
            <option value="Camping">Camping</option>
          </select>
        </td>
      </tr>
      <tr>
        <td align="right">주소</td>
        <td align="center"><input type="text" name="location" /></td>
      </tr>

      <tr>
        <td align="right">대표 이미지</td>
        <td align="center"><input type="file" name="main_img" /> </td>
      </tr>

      <tr>
        <td align="right">상세 이미지</td>
        <td align="center"><input type="file" name="sub_img" /></td>
      </tr>

      <tr>
        <td align="right">상세 설명</td>
        <td align="center"><input type="textarea" maxlength="1000" name="detail" /></td>
      </tr>
      
      
 
      <tr>
        <td colspan="3" align="center">
          <input type="submit" value="등록하기" style="width: 150px;" />
        </td>
      </tr>
    </table>
  </form>

</body>
</html>
