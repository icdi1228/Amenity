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
  width:350px;
  height:50px;
  left:35%;
  bottom:5%;
  background-color:gray;
}
.div2{
  width:1500px;
  height:300px;
  background-color:white;
}
.inner2{
  width:700px;
  height:100px;
  left:25%;
  top:5%;
  background-color:white;
}
table tr{
    border:3px solid black;
}
table tr td{
  border: 1px solid black;
}
.tdcolor1{
  background-color:blue;
  color:white;
}
.tdcolor2{
  background-color:red;
  color:white;
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
                <input type="submit" value="검색">
               </form>
            </div>
          </div>
          <div class="div2" id="relative">
            <div class="inner2" id="absolute">
            <table>
              <tr>
                <td>사업자번호</td>
                <td>비밀번호</td>
                <td>사업자명</td>
                <td>전화번호</td>
                <td>이메일</td>
                <td>주소</td>
                <td>수정</td>
                <td>삭제</td>
              </tr>
              <tr>
                <td>{no}</td>
                <td>{pw}</td>
                <td>{name}</td>
                <td>{tel}</td>
                <td>{email}</td>
                <td>{addr}</td>
                <td class="tdcolor1"><a>수정</a></td>
                <td class="tdcolor2"><a>삭제</a></td>
              </tr>
            </table>
            </div>
          </div>
    </body>
</html>
