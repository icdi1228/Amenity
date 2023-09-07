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

<style>
    #adminReply{
        margin-left:10%;
        width:80%;
        text-align:center;
        background-color: #f5f5f5;
border: 1px solid #ddd;
border-radius: 5px;
box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
padding:10px;
margin-top:100px;
margin-bottom:100px;
    }
    #rply{
        width:90%;
        height:200px;
        padding:20px;
    }
    #replyT1{
        height:100px;
        width:80%;
    }

    #replyT2{
        height:100px;
        margin-bottom:6px;
        width:100px;
    }

</style>
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
        <input type="text" class="form-control" id="articleNO" value="${notice.articleNO}" disabled>
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
    <c:if test="${not empty imageFileNames}">
        <div class="mb-3">
            <label for="image" class="form-label">이미지</label>
            <c:forEach items="${imageFileNames}" var="imageFileName">
                <img src="${contextPath}/admin/download.do?imageFileName=${imageFileName}&amp;articleNO=${notice.articleNO}" class="img-fluid mt-2">
            </c:forEach>
        </div>
    </c:if>


    <c:if test="${notice.recontent != null}">
        <div id="adminReply">
            <h2>관리자 답글</h2><br>
            <textarea id="rply" name="recontent" lengh="1000" readonly>${notice.recontent}</textarea>
    </div>

    </c:if>   

    


        

        <!-- Buttons -->
        <div id="btn-group-view" class="text-center mt-4">
            
            
                <c:if test="${notice.u_id == 'admin'}">
                    <button type="button" class="btn btn-primary" onClick="enableEdit()">수정하기</button>    
                </c:if>           
            <button type="button" class="btn btn-secondary" onClick="backToList(this.form)">리스트로 돌아가기</button>
        </div>

        <div id="btn-group-edit" class="text-center mt-4" style="display:none;">
            <button type="submit" class="btn btn-success">수정반영하기</button>
            <button type="button" class="btn btn-secondary" onClick="backToList(this.form)">취소</button>
        </div>
    </form>
    <c:if test="${notice.u_id != 'admin' && notice.recontent == null}">
        <form name="frmReply" method="post" action="${contextPath}/admin/addReply.do" enctype="multipart/form-data">
        <div id="adminReply">
            <h2>답글달기</h2><br>
            <input type="hidden" name="articleNO" value="${notice.articleNO}">
            <input id="replyT1" type="textarea" lengh="1000" id="rply" name="recontent">
            <input id="replyT2" type="submit" class="btn btn-primary" value="작성">
        </form>
    </div>

    </c:if>
</div>

<!-- Bootstrap 5 JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
