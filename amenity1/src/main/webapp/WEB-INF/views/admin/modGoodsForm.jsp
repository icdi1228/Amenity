<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
	width: 100%;
	height: 80%;
	margin: auto;
}

td {
	margin-bottom: 5px;
}

td.td1 {
	height: 45px;
}

.td1 {
	padding: 5px;
	width: 21%;
}

.td2 {
	padding: 5px;
	width: 60%;
}

input[type="text"] {
	text-align: center;
    width: 100%;
    box-shadow: 5px;
    padding: 5px;
}

#de_content {
	width: 100%;
	height: 250px;
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"> </script>
<title>goodsModForm</title>
</head>
<body>

	<form class="form" name="gdinfo" method="post" action="${contextPath}/admin/g_InfoUpdate.do"
		enctype="multipart/form-data" onsubmit="return combineEmail()">

		<h1 style="text-align: center">상품정보 수정</h1>
		<h4 style="text-align: right">관리자 수정모드</h4>
		<table border="0" align="center">
			<tr>
				<td class="td1" align="right">번 호</td>
				<td class="td2" align="center">
					<input class="test" type="text" size="20" maxlength="10" name="g_no" value="${goodsVO.g_no}" readonly="readonly" />
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">업체명</td>
				<td class="td2" align="center">
          			<input type="text" name="company" value="${goodsVO.company}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">상품명</td>
				<td class="td2" align="center">
          			<input type="text" name="room" value="${goodsVO.room}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">설명</td>
				<td class="td2" align="center">
					<textarea id="de_content" name="detail" rows="4">${goodsVO.detail}</textarea>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">가격</td>
				<td class="td2" align="center">
          			<input type="text" name="price" value="${goodsVO.price}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">대실가격</td>
				<td class="td2" align="center">
          			<input type="text" name="timeprice" value="${goodsVO.timeprice}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">인원</td>
				<td class="td2" align="center">
          			<input type="text" name="stdper" value="${goodsVO.stdper}"/>
				</td>
			</tr>

			<tr>
				<td><br></td>
				<td><br></td>
			</tr>

			<tr>
				<td align="center"></td>
				<td align="center">
					<button type="button" style="width: 150px; height: 30px;" onclick="location.href='${contextPath}/admin/goodsList.do'">뒤로가기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" style="width: 150px; height: 30px;">수정하기</button>
				<td>				
			</tr>
		</table>

	</form>
</body>
</html>
