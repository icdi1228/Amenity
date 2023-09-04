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
<script>

    function check_delete(c_no){
        console.log("b_no : " + c_no );

        if (confirm("정말 \"" + c_no + "\" 을 삭제하시겠습니까?")) {
            location.href = "${contextPath}/admin/b_companyInfo.do?c_no=" + c_no;
        } 
        else {    
            return false;
        }
    }

</script>
<!-- 페이징 선언부분 -->
    <c:set var="totalItems" value="${totalCompanies}" /> 
    <c:set var="itemsPerPage" value="10" />
    <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
    <c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />

</head>
<body>

<div class="container mt-4">

    <div class="d-flex justify-content-center">
        <form class="form-inline" action="${contextPath}/admin/CompanyListSearch.do" method="get">
            <select name="search" class="form-control mr-2">
                <option value="all">전체</option>
                <option value="b_no">사업자 번호</option>
                <option value="category">항목</option>
                <option value="grade">별점</option>
            </select>
            <input type="text" name="value" class="form-control mr-2">
            <input type="submit" value="검색" class="btn btn-primary">
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>사업자 번호</th>
                    <th>업체명</th>
                    <th>항목</th>
                    <th>별점</th>
                    <th>주소</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
              <c:forEach var="company" items="${companies}" >
                  <tr>
                      <td>${company.c_no}</td>
                      <td>${company.b_no}</td>
                      <td>${company.company}</td>
                      <td>${company.category}</td>
                      <td>${company.grade}</td>
                      <td>${company.location} ${company.locationdetail}</td>
                      <td class="text-center"><a method="post" href="${contextPath}/admin/a_modCompanyList.do?c_no=${company.c_no}" class="btn btn-primary btn-sm">수정</a></td>
                      <td class="text-center"><a method="get" onclick="check_delete('${company.c_no}')" class="btn btn-danger btn-sm">삭제</a></td>
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