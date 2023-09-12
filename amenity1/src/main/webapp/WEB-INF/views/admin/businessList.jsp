<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    function check_delete(b_no){
        console.log("b_no : " + b_no );

        if (confirm("정말 \"" + b_no + "\" 을 삭제하시겠습니까?")) {
            location.href = "${contextPath}/admin/b_deleteInfo.do?b_no=" + b_no;
        } 
        else {    
            return false;
        }
    }

</script>
    <c:set var="totalItems" value="${totalBusinesses}" /> 
    <c:set var="itemsPerPage" value="10" />
    <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
    <c:set var="totalPages" value="${Math.floor((totalItems + itemsPerPage - 1) / itemsPerPage)}" />

</head>
<body>

<div class="container mt-4">
    <h2>기업 목록</h2><br>

    <div class="d-flex justify-content-center">
        <form class="form-inline" action="${contextPath}/admin/businessListSearch.do" method="get">
            <select name="search" class="form-control mr-2">
                <option value="all">전체</option>
                <option value="b_no">사업자 번호</option>
                <option value="name">대표자</option>
                <option value="email">이메일</option>
                <option value="account">등록계좌</option>
            </select>
            <input type="text" name="value" class="form-control mr-2">
            <input type="submit" value="검색" class="btn btn-primary">
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th width="13%">사업자 번호</th>
                    <th width="12%">전화번호</th>
                    <th width="8%">대표자</th>
                    <th width="28%">주소</th>
                    <th width="15%">등록계좌</th>
                    <th width="10%">가입일자</th>
                    <th width="7%">수정</th>
                    <th width="7%">삭제</th>
                </tr>
            </thead>
            <tbody>
              <c:forEach items="${businesses}" var="business">
                  <tr>
                      <td>${business.b_no}</td>
                      <td>${business.tel1}-${business.tel2}-${business.tel3}</td>
                      <td>${business.name}</td>
                      <td>${business.addr}</td>
                      <td>${business.account}</td>
                      <td>${business.credate}</td>
                      <td class="text-center"><a method="post" href="${contextPath}/admin/a_modBusinessList.do?b_no=${business.b_no}" class="btn btn-primary btn-sm">수정</a></td>
                      <td class="text-center"><a method="get" onclick="check_delete('${business.b_no}')" class="btn btn-danger btn-sm">삭제</a></td>
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