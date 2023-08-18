<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function backToList(obj){
		obj.action="${contextPath}/board/listArticles.do";
		obj.submit();
	}
	var cnt = 1;
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"'/>");
		cnt++;
	}
	
	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_content").disabled=false;
		document.getElementById("i_imageFileName").disabled=false;
		document.getElementById("tr_btn_modify").style.display="block";
		document.getElementById("tr_btn").style.display="none";
	}
	function fn_modify_article(obj){
		obj.action="${contextPath}/board/modArticle.do";
		on.submit();
	}
	
	function fn_remove_article(url,articleNO){
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
		var articleNOInput = document.createElement("input");
		articleNOInput.setAttribute("type", "hidden");
		articleNOInput.setAttribute("name", "articleNO");
		articleNOInput.setAttribute("value", articleNO);
		
		form.appendChild(articleNOInput);
		document.body.appendChild(form);
		form.submit();
	}
</script>
</head>
<body>
<h1 style="text-align:center">새글 쓰기</h1>
	<form name="articleForm" method="post" action="${contextPath }/admin/addNewArticle.do" enctype="multipart/form-data">
	<table border="0" align="center">
	<tr>
		<td align="right">작성자</td>
		<td colspan=2 align="left">
		<input type="text" size="20" maxlength="100" value="${userVO.name}" readonly/>
		<input type="hidden" value="${userVO.u_id}"/> 
		</td>
	</tr>
	<tr>
		<td align="right">글제목: </td>
		<td colspan="2"><input type="text" size="67" maxlength="500" name="title"/></td>
	</tr>
	<tr>
		<td align="right" valign="top"><br>글내용: </td>
		<td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea>
	</tr>
	<tr>
		<td align="right">이미지파일 첨부: </td>
		<td><input type="file" name="imageFileName" onchange="readURL(this);"/></td>
		<td><img id="preview" src="#" width=200 height=200/></td>
		<td align="right">이미지파일 첨부</td>
		<td align="left"> <input type="button" value="파일추가" onClick="fn_addFile()"/></td>
	</tr>
	<tr>
		<td align="right"></td>
		<td colspan="2">
			<input type="submit" value="글쓰기"/>
			<input type=button value="목록보기" onClick="backToList(this.form)"/>
		</td>
	</tr>
	</table>
	</form>
</body>
</html>