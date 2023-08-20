<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.Date" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        function backToList(obj){
            obj.action = "${contextPath}/admin/notice.do";
            obj.submit();
        }

        function enableEdit(){
            document.querySelectorAll(".editable").forEach(el => el.removeAttribute('disabled'));
            document.querySelector("#btn-group-view").style.display = "none";
            document.querySelector("#btn-group-edit").style.display = "block";
        }

        // ... [기존의 JS 함수들]

    </script>
</head>
<body class="bg-light">

<div class="container mt-5">
    <form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data" class="border p-4 bg-white">
        <!-- Article Number, Author ID, and Title in one line -->
<!-- Article Number and Author ID in one line -->
<div class="row mb-3">
    <!-- Article Number -->
    <div class="col-md-6">
        <label for="articleNO" class="form-label">글번호</label>
        <input type="text" class="form-control editable" id="articleNO" value="${notice.articleNO}" disabled>
        <input type="hidden" name="articleNO" value="${notice.articleNO}">
    </div>

    <!-- Author ID -->
    <div class="col-md-6">
        <label for="authorID" class="form-label">작성자 아이디</label>
        <input type="text" class="form-control" id="authorID" value="${notice.u_id}" disabled>
    </div>
</div>

<!-- Title and Date in one line -->
<div class="row mb-3">
    <!-- Title -->
    <div class="col-md-6">
        <label for="title" class="form-label">제목</label>
        <input type="text" class="form-control editable" id="title" name="title" value="${notice.title}" disabled>
    </div>

    <!-- Date -->
    <div class="col-md-6">
        <label for="date" class="form-label">등록일자</label>
        <input type="text" class="form-control" id="date" value="${notice.writedate}" disabled>
    </div>
</div>
 
        <!-- Content -->
        <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea class="form-control editable" id="content" rows="5" name="content" disabled>${notice.content}</textarea>
        </div>
        
        <!-- Image -->
        <c:if test="${not empty notice.image && notice.image != 'null'}">
            <div class="mb-3">
                <label for="image" class="form-label">이미지</label>
                <input type="file" class="form-control editable" id="image" name="image" disabled onchange="readURL(this);">
                <input type="hidden" name="originalFileName" value="${article.image}"/>
                <img src="${contextPath}/download.do?imageFileName=${notice.imageFileName}&amp;articleNO=${notice.articleNO}" id="preview" class="img-fluid mt-2">
            </div>
        </c:if>

        

        <!-- Buttons -->
        <div id="btn-group-view" class="text-center mt-4">
            <button type="button" class="btn btn-primary" onClick="enableEdit()">수정하기</button>
            <button type="button" class="btn btn-danger" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">삭제하기</button>
            <button type="button" class="btn btn-secondary" onClick="backToList(this.form)">리스트로 돌아가기</button>
            <button type="button" class="btn btn-info" onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})">답글쓰기</button>
        </div>

        <div id="btn-group-edit" class="text-center mt-4" style="display:none;">
            <button type="submit" class="btn btn-success">수정반영하기</button>
            <button type="button" class="btn btn-secondary" onClick="backToList(this.form)">취소</button>
        </div>
    </form>
</div>

<!-- Bootstrap 5 JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
