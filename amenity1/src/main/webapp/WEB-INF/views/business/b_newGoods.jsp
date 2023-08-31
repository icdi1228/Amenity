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
      padding: 20px;
      display: inline-block;
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
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
  function fn_addFile(){
        $("#d_file").append("<br><input type='file' name='sub_img' onchange='readURL(this);'/>");
    }
</script>

<title>newGoods</title>
</head>
<body>
	<h1 style="text-align: center">새로운 객실 등록</h1>
	<form class="form" name="newGoods" method="post" action="${contextPath}/business/addNewGoods.do"enctype="multipart/form-data">
		<table border="0" align="center">
			<div>
				<tr>
					<td align="right">사업자 등록 번호</td>
					<td align="center">
						<div class="d-flex">
							<input type="text" class="form-control mr-2"
								style="width: 200px;" maxlength="20" name="b_no"
								value="${businessVO.b_no}" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td>사업장 선택</td>
					<td><select name=company>
							<option>사업장을 선택하세요</option>
							<c:if test="${!empty myCompanyList}">
								<c:forEach items="${myCompanyList}" var="myCompanyList">
									<option value="${myCompanyList}">${myCompanyList}</option>
								</c:forEach>
							</c:if>
							<c:if test="${empty myCompanyList}">
								<option value="">사용 가능한 사업장이 없습니다.</option>
							</c:if>
					</select></td>
				</tr>
            
                <tr>
                    <td>객실</td>
                    <td><input type="text" name="room"></td>
                </tr>

                <tr>
                    <td>숙박 가격</td>
                    <td><input type="text" name="price" /></td>
                </tr>
					
                <tr>
                    <td>대실 가격</td>
                    <td><input type="text" name="timeprice" /></td>
                </tr>
                <tr>
                  <td>기준 인원</td>
                  <td><input type="text" name="stdper" /></td>
                </tr>
                <tr>
                    <td>대표 이미지</td>
                    <td><input type="file" name="main_img" onchange="readURL(this);" /></td>
                </tr>
                <tr>
                  <td align="right">이미지파일 첨부:</td>
                  <td>
                      <div id="d_file">
                          <input type="file" name="sub_img" onchange="readURL(this);" />
                      </div>
                  </td>
                  <td><img id="preview" src="#" width=200 height=200 /></td>
                  <td align="right">이미지파일 첨부</td>
                  <td align="left"><input type="button" value="파일추가"
                      onClick="fn_addFile()" /></td>
                </tr>

                <tr>
                    <td align="right">상세 설명</td>
                    <td align="center"><input type="textarea" maxlength="1000"
                        name="detail" style="height:300px; width:300px;"/></td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><input type="submit"
                        value="등록하기" style="width: 150px;" /></td>
                </tr>
            </div>
		</table>
	</form>
</body>
</html>
