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
td:nth-child(1){
  width:200px;
}
td:nth-child(2){
  width:700px;
}
td:nth-child(3){
  width:200px;
}
td:nth-child(4){
  width:200px;
}
td:nth-child(5){
  width:200px;
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
#adminN{
  background: rgba(252, 163, 163, 0.788);
  border:1px solid black;
}
#adminN td{
 
  border:1px solid black;
}
#asd td{
  border-bottom: 1px solid black;
}

<!--탭메뉴 스타일 등장-->
.main {
            min-width: 320px;
            max-width: 800px;
            padding: 50px;
            margin: 0 auto;
            background: #ffffff;}

        section {
            display: none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;}

        /*라디오버튼 숨김*/
          #tab1,#tab2 {
              display: none;}

        label {
            display: inline-block;
            margin: 0 0 -1px;
            padding: 15px 25px;
            font-weight: 600;
            text-align: left;
            color: #bbb;
            border: 1px solid transparent;}

        label:hover {
            color: #2e9cdf;
            cursor: pointer;}

        /*input 클릭시, label 스타일*/
        input:checked + label {
              color: #555;
              border: 1px solid #ddd;
              border-top: 2px solid #2e9cdf;
              border-bottom: 1px solid #ffffff;}

        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2 {
            display: block;}


  </style>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    <div class="main">

        <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
        <label for="tab1">회원 문의내역</label>
    
        <input id="tab2" type="radio" name="tabs">
        <label for="tab2">사업자 문의내역</label>
                

    
        <section id="content1">
          <!-- 회원 문의내역 -->
          <h1>사용자 문의 내역</h1>
          <table align="center" width="80%">
            
            <tr id="asd">
              <td>번호</td>
              <td>제목</td>
              <td>아이디</td>
              <td>문의상태</td>
              <td>작성일</td>
            </tr>
            <!-- 문의내역-->
            <c:forEach var="notice1" items="${noticeList1}">
              
                  <tr>
                    <td>${notice1.articleNO}</td>
                    <td><a href="${contextPath}/admin/viewNotice.do?articleNO=${notice1.articleNO}">${notice1.title}</a></td>
                    <td>${notice1.u_id}</td>
                    <c:choose>          
                      <c:when test="${notice1.recontent == null}">
                        <td>답변 대기중</td>
                      </c:when>
                      <c:otherwise>
                        <td>답변 완료</td>
                      </c:otherwise>
                      </c:choose>
                    <td>${notice1.writedate}</td>        
                  </tr>
              
            </c:forEach>
        
          </table>
        </section>
    
        <section id="content2">        
          <!-- 사업자 문의내역 -->
          <h1>사업자 문의 내역</h1>
          <table align="center" width="80%">
            
            <tr id="asd">
              <td>번호</td>
              <td>제목</td>
              <td>아이디</td>
              <td>문의상태</td>
              <td>작성일</td>
            </tr>
            <!-- 문의내역-->
            <c:forEach var="notice2" items="${noticeList2}">
              
                  <tr>
                    <td>${notice2.articleNO}</td>
                    <td><a href="${contextPath}/admin/viewNotice.do?articleNO=${notice2.articleNO}">${notice2.title}</a></td>
                    <td>${notice2.u_id}</td>
                    <c:choose>          
                      <c:when test="${notice2.recontent == null}">
                        <td>답변 대기중</td>
                      </c:when>
                      <c:otherwise>
                        <td>답변 완료</td>
                      </c:otherwise>
                      </c:choose>
                    <td>${notice2.writedate}</td>        
                  </tr>
              
            </c:forEach>
        
          </table>

        </section>
    </div>    








  

  

  <div class="cls2">
      <!-- 페이지네이션 부분 -->
  </div>
</body>

</html>