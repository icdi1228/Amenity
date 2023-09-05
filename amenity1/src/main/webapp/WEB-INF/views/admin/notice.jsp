<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글보기</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    .table-responsive {
         margin-top: 20px;
    }
</style>
<script>
    function check_delete(articleNO){
            console.log("articleNO : " + articleNO );
    
            if (confirm("정말 \"" + articleNO + "\" 번 공지를 삭제하시겠습니까?")) {
                location.href = "${contextPath}/admin/deleteNotice.do?articleNO=" + articleNO;
            } 
            else {    
                return false;
            }
        }
</script>

    <c:set var="totalItems" value="${totalNotice}" /> 
    <c:set var="itemsPerPage" value="10" />
    <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
    <c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />

</head>
<body>

<div class="container mt-4">
    <h2>공지사항</h2><br>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th width="10%">번 호</th>
                    <th width="40%">제 목</th>
                    <th width="30%">작성일</th>
                    <th width="10%">수정</th>
                    <th width="10%">삭제</th>
                </tr>

            </thead>

            <tbody>

            <c:choose>
                <c:when test="${empty noticeList}">
                    <tr>
                        <td colspan="6">등록된 글이 없습니다.</td>
                    </tr>
                </c:when>

                <c:otherwise>
                    <c:forEach var="notice" items="${noticeList}">
                        <tr>
                            <td>${notice.articleNO}</td>
                            <td>
                                <a class="cls1"href="${contextPath}/admin/viewNotice.do?articleNO=${notice.articleNO}">${notice.title}</a>
                            </td>
                            <td>${notice.writedate}</td>
                            <td class="text-center"><a method="post" href="${contextPath}/admin/viewNotice.do?articleNO=${notice.articleNO}" class="btn btn-primary btn-sm">수정</a></td>
                            <td class="text-center"><a method="get" onclick="check_delete('${notice.articleNO}')" class="btn btn-danger btn-sm">삭제</a></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

          </tbody>
          
        </table>

        <br><br>
        <a href="${contextPath }/admin/noticeForm.do"><input type="button" value="글쓰기"></a>

        <div class="d-flex justify-content-center mt-3">
          <ul class="pagination">

              <c:if test="${currentPage > 1}">
                  <li class="page-item">
                      <a class="page-link" href="?page=${currentPage - 1}">이전</a>
                  </li>
              </c:if>
      

              <c:forEach begin="1" end="${totalPages}" var="page">
                  <li class="page-item ${page == currentPage ? 'active' : ''}">
                      <a class="page-link" href="?page=${page}">${page}</a>
                  </li>
              </c:forEach>
      

              <c:if test="${currentPage < totalPages}">
                  <li class="page-item">
                      <a class="page-link" href="?page=${currentPage + 1}">다음</a>
                  </li>
              </c:if>
          </ul>
      </div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html> 