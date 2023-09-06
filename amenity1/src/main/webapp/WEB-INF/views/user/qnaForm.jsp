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
<title>회원 문의 작성</title>
<style>
	body {
	  font-family: 'Arial', sans-serif;
	  background-color: #f5f5f5;
	  margin: 0;
	  padding: 0;
	}
  
	h1 {
	  text-align: center;
	  color: #333;
	  margin-top: 30px;
	}
  
	.container {
	  max-width: 800px;
	  margin: 0 auto;
	  background-color: #fff;
	  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	  padding: 20px;
	  border-radius: 5px;
	}
  
	.form-group {
	  margin-bottom: 20px;
	}
  
	label {
	  display: block;
	  margin-bottom: 5px;
	  font-weight: bold;
	}
  
	input[type="text"],
	input[type="submit"],
	textarea {
	  width: 100%;
	  padding: 10px;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	  font-size: 16px;
	}
  
	input[type="button"] {
	  background-color: grey;
	  color: #fff;
	  cursor: pointer;
	  border: none;
	  padding: 10px 20px;
	}

	input[type="submit"] {
	  background-color: #0056b3;
	  color: #fff;
	  cursor: pointer;
	  border: none;
	  padding: 10px 20px;
	}
  
	input[type="button"]:hover {
	  background-color: #0056b3;
	}

	input[type="submit"]:hover {
	  background-color: skyblue;
	}

	img#preview {
	  max-width: 100%;
	  max-height: 200px;
	  margin-top: 10px;
	}
  
	#d_file input[type="file"] {
	  margin-top: 10px;
	}
  
	textarea {
	  resize: vertical;
	}
  
	.btn-group {
	  text-align: center;
	}

	#i_name, #i_title {
		text-align: center;
	}

	#d_file {
		align-items: center;
	}

  </style>
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
		obj.action="${contextPath}/admin/notice.do";
		obj.submit();
	}
	function fn_addFile(){
        $("#d_file").append("<br><input type='file' name='imageFileNames' onchange='readURL(this);'/>");
    }
	
	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_content").disabled=false;
		document.getElementById("i_imageFileName").disabled=false;
		document.getElementById("tr_btn_modify").style.display="block";
		document.getElementById("tr_btn").style.display="none";
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

	<div class="container">
		<h1>문의 작성</h1>
		<form name="articleForm" method="post" action="${contextPath}/user/writeQna.do" enctype="multipart/form-data">
		  <div class="form-group">
			<label for="i_name">작성자</label>
			<input type="text" id="i_name" size="10" maxlength="100" value="${userVO.name}" readonly/>
		  </div>
		  <div class="form-group">
			<label for="i_title">글제목</label>
			<input type="text" id="i_title" size="60" maxlength="500" name="title"/>
		  </div>
		  <div class="form-group">
			<label for="i_content">글내용</label>
			<textarea id="i_content" name="content" rows="10" cols="65" maxlength="4000"></textarea>
		  </div>
		  <div class="form-group">
			<label for="i_image">이미지 첨부</label>
			<img id="preview" src="#" alt="Image Preview"/><br><br>
			
			<div id="d_file">
			  <input type="file" name="imageFileNames" onchange="readURL(this);"/><br><br>
			</div>

			<input type="button" value="파일추가" onClick="fn_addFile()"/>
		  </div>
		  <div class="btn-group">
			<input type="button" value="목록보기" onClick="backToList(this.form)"/> &nbsp;&nbsp;&nbsp;
			<input type="submit" value="글 쓰 기"/>
		  </div>
		</form>
	  </div>
</body>
</html>
