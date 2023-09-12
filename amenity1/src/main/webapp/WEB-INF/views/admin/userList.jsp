<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글보기</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 추가 스타일 */
        .table-responsive {
            margin-top: 20px;
        }
    </style>
<!-- 페이징 선언부분 -->
    <c:set var="totalItems" value="${totalUsers}" /> 
    <c:set var="itemsPerPage" value="10" />
    <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
    <c:set var="totalPages" value="${Math.floor((totalItems + itemsPerPage - 1) / itemsPerPage)}" />

</head>
<script>

function check_delete(u_id){
        console.log("u_id : " + u_id );

        if (confirm("정말 \"" + u_id + "\" 을 삭제하시겠습니까?")) {
            location.href = "${contextPath}/admin/u_deleteInfo.do?u_id=" + u_id;
        } 
        else {    
            return false;
        }
    }
</script>
<body>

<div class="container mt-4">
    <h2>회원 목록</h2><br>

    <div class="d-flex justify-content-center">
        <form class="form-inline" action="${contextPath}/admin/userListSearch.do" method="get">
            <select name="search" class="form-control mr-2">
                <option value="all">전체</option>
                <option value="id">아이디</option>
                <option value="name">고객명</option>
                <option value="nickname">닉네임</option>
                <option value="email">이메일</option>
            </select>
            <input type="text" name="value" class="form-control mr-2">
            <input type="submit" value="검색" class="btn btn-primary">
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th width="18%">아이디</th>
                    <th width="12%">이름</th>
                    <th width="12%">닉네임</th>
                    <th width="20%">이메일</th>
                    <th width="12%">가입일</th>
                    <th width="8%">수정</th>
                    <th width="8%">삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user">
                    <c:if test="${user.auth ne 'admin'}">
                        <tr>
                            <td>${user.u_id}</td>
                            <td>${user.name}</td>
                            <td>${user.nickname}</td>
                            <td>${user.email}</td>
                            <td>${user.credate}</td>
                            <td class="text-center"><a method="post" href="${contextPath}/admin/a_modUserList.do?u_id=${user.u_id}" class="btn btn-primary btn-sm">수정</a></td>
                            <td class="text-center"><a method="get" onclick="check_delete('${user.u_id}')" class="btn btn-danger btn-sm">삭제</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>

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