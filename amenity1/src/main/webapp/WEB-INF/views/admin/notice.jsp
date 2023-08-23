<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
  request.setCharacterEncoding("UTF-8");
%>
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

tr:hover {
    background-color: #f5f5f5;
}

tr:first-child {
    background-color: lightgreen;
    color: white;
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
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<c:set var = "noticeList" value="${noticeList }"/>
<c:set var = "totArticles" value="${articlesMap.totArticles }"/>
<c:set var = "section" value="${articlesMap.section }"/>
<c:set var = "pageNum" value="${articlesMap.pageNum }"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자 공지 페이지</title>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <style>
            .no-uline{text-decoration:none;}
	        .sel-page{text-decoration:none; color:red;}
	        .cls1{text-decoration:none;}
	        .cls2{text-align:center; font-size:30px;}
        </style>
    </head>
    <body>
        <table align="center" border="1" width="80%">
            <tr height="10" align="center" bgcolor="lightgreen">
            <td>글번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>작성일</td>
            </tr>
            <c:choose>
                <c:when test="${empty noticeList}">
                    <tr height="10">
                        <td colspan="4">
                            <p align="center">
                                <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
                            </p>
                        </td>
                    </tr>
                    </c:when>
                    <c:when test="${!empty noticeList}">
                        <c:forEach var="notice" items="${noticeList}" varStatus="articleNum">
                            <tr align="center">
                                <td width="5%">${notice.articleNO}</td>
                                <td width="10%">${notice.u_id }</td>
                                <td align="left" width="35%">	
                                    <span style="padding-right:30px"></span>
                                        <a class="cls1"
                                        href="${contextPath}/admin/viewNotice.do?articleNO=${notice.articleNO}">${notice.title }</a>
                                    </td>
                                    <td width="10%"><fmt:formatDate value="${notice.writedate}"/></td>
                            </tr>
                            </c:forEach>	
                    </c:when>
            </c:choose>
        </table>
        <div class="cls2">
            <c:if test="${totArticles != null }">
                <c:choose>
                    <c:when test="${totArticles >100 }"> <!-- 글 개수가 100 초과인 경우 -->
                        <c:forEach var="page" begin="1" end="10" step="1">
                            <c:if test="${section >1 && page==1 }">
                              <a class="no-uline" href="${contextPath}/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10+1}">&nbsp; pre</a>
                            </c:if>
                            <a class="no-uline" href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
                            <c:if test="${page == 10 }">
                                <a class="no-uline" href="${contextPath}/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
                            </c:if>	  
                        </c:forEach>
                    </c:when>
                    <c:when test="${totArticles == 100 }"> <!-- 등록된 글 개수가 100개인 경우 -->
                        <c:forEach var="page" begin="1" end="10" step="1">
                           <a class="no-uline" href="#">${page }</a>
                        </c:forEach>
                    </c:when>
                    
                    <c:when test="${totArticles < 100 }">  <!-- 등록된 글 개수가 100개 미만인 경우 -->
                        <c:forEach var="page" begin="1" end="${totArticles/10 + 1}" step="1">
                        <c:choose>
                            <c:when test="${page == pageNum }">
                                <a class="sel-page" href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
                            </c:when>
                            <c:otherwise>
                                <a class="no-uline" href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
                            </c:otherwise>
                        </c:choose>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:if>
        </div>
        
				<a class="cls1" href="${contextPath }/admin/noticeForm.do"><p class="cls2">글쓰기</p></a>
		
    </body>
</html>