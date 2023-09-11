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
        .table-responsive {
            margin-top: 20px;
        }
    </style>

<!-- 페이징 선언부분 -->
<c:set var="totalItems" value="${totalRes}" /> 
<c:set var="itemsPerPage" value="10" />
<c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
<c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />
</head>
<body>

<div class="container mt-4">
    <!--
    <div class="d-flex justify-content-center">
        <form class="form-inline" action="${contextPath}/admin/resListSearch.do" method="get">
            <select name="search" class="form-control mr-2">
                <option value="all">전체</option>
                <option value="u_id">아이디</option>
                <option value="name">고객명</option>
                <option value="nickname">닉네임</option>
                <option value="resNO">예약번호</option>
            </select>
            <input type="text" name="value" class="form-control mr-2">
            <input type="submit" value="검색" class="btn btn-primary">
        </form>
    </div>
    -->

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>아이디</th>                    
                    <th>이  름</th>
                    <th>업체명</th>                    
                    <th>숙박형태</th>
                    <th>입실일자</th>
                    <th>퇴실일자</th>                    
                    <th>가  격</th>
                    <th>예약일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${resList}" var="res">
                    <tr>
                        <td>${res.resNO}</td>
                        <td>${res.u_id}</td>
                        <td>${res.name}</td>
                        <td>${res.company}</td>
                        <td>${res.resform}</td>
                        <td>${res.checkIn}</td>
                        <td>${res.checkOut}</td>
                        <td>${res.price}</td>
                        <td>${res.resdate}</td>
                    </tr>
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