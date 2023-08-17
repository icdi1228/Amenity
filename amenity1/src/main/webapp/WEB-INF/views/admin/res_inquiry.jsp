<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
    <style>
        #relative{
  position:relative;
}
#absolute{
  position:absolute;
}
.div1{
  width:1500px;
  height:200px;
  background-color:white;
}
.inner1{
  width:1000px;
  height:50px;
  left:10%;
  bottom:5%;
  background-color:gray;
}
.div2{
  width:1500px;
  height:300px;
  background-color:white;
}
.inner2{
  width:1000px;
  height:100px;
  left:10%;
  top:10%;
  background-color:gray;
}
table tr{
    border:3px solid black;
}
table tr td{
  border: 1px solid black;
}
    </style>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script type="text/javascript">
</script>

</head>
    <body>
        <div class="div1" id="relative">
            <div class="inner1" id="absolute">
              <form>
                <select name="res">
                  <option value="1">아이디</option>
                  <option value="1">회원</option>
                  <option value="1">비회원</option>
                  <option value="1">고객명</option>
                  <option value="1">예약형태</option>
                  <option value="1">객실번호</option>
                  <option value="1">업체명</option>
                  <option value="1">상태</option>
                </select>
                <input type="text">
                체크인
                <input type="date">
                체크아웃
                <input type="date">
                <input type="submit" value="검색">
               </form>
            </div>
          </div>
          <div class="div2" id="relative">
            <div class="inner2" id="absolute">
            <table>
              <tr>
                <td>예약번호</td>
                <td>아이디</td>
                <td>회원/비회원</td>
                <td>고객명</td>
                <td>예약형태</td>
                <td>객실번호</td>
                <td>업체명</td>
                <td>상태</td>
              </tr>
              <tr>
                <td>{resNO}</td>
                <td>{id}</td>
                <td>{loginstate}</td>
                <td>{name}</td>
                <td>{resForm}</td>
                <td>{roomNO}</td>
                <td>{company}</td>
                <td>{paymentState}</td>
              </tr>
            </table>
            </div>
          </div>
    </body>
</html>
