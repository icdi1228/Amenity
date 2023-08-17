<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>            
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
	  var suggestions = ["서울", "대전", "부산"];
	
	  $("#name").on("focus", function() {
		var $input = $(this);
		var $suggestionList = $("<div id='suggestion-list'></div>");
		$suggestionList.css({
		  position: "absolute",
		  border: "1px solid #ccc",
		  backgroundColor: "#fff",
		  width: $input.width(),
		  left: $input.offset().left,
		  top: $input.offset().top + $input.height() + 5
		});
	
		suggestions.forEach(function(suggestion) {
		  var $item = $("<div class='suggestion-item'></div>");
		  $item.text(suggestion);
		  $item.css({
			padding: "5px",
			cursor: "pointer"
		  });
	
		  $item.on("click", function() {
			$input.val(suggestion);
			$suggestionList.remove();
		  });
	
		  $suggestionList.append($item);
		});
	
		$("body").append($suggestionList);
	  });
	
	  $("#name").on("blur", function() {
		setTimeout(function() {
		  $("#suggestion-list").remove();
		}, 100);
	  });
	});
	</script>
	
<meta charset="UTF-8">
<title>헤더</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
	body{
		background-color: #f7f7f8;
	}
table { display: inline;}
.logo img { width: 200px; height: 100px; float: left; }
.searchbar img { width: 60%; height: 100px; float:left; }
.login a { width: 100px; }
.btn-outline-success { display: inline-block; font-size: 10px;}
.log { text-decoration: none; color: black; }

.dsize{
	width:400px;
}
.line{
	line-height: 1%;
}
.d1{
	display: flex;
}
.first{
	padding-left: 20%;
}
#name{
	margin:1px;
}

</style>
</head>
<body>
	
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		<div class="first">
		</div>
		<div class="container-fluid" >
		<a href="${contextPath}/main/main.do">
			<img src="${contextPath}/resources/images/logo.png">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		
		<form class="d-flex" role="search">
		  <input class="form-control me-2" id="name" type="search" placeholder="Search" aria-label="Search" autocomplete="off">
		  <input class="form-control me-2" type="date" placeholder="Search" aria-label="Search">
		  <input class="form-control me-2" type="date" placeholder="Search" aria-label="Search">	
		  <button class="btn btn-outline-success" type="submit">Search</button>
		</form>
		<div>
			<div class="dsize">
			<a href="${contextPath}/user/notice.do" class="line">
				<img src="${contextPath}/resources/images/CS1.png">
			</a>
			<a href="${contextPath}/user/cart.do" class="line">
				<img src="${contextPath}/resour	ces/images/cart1.png">
			</a>
			<a href="${contextPath}/user/myInfo.do" class="line">
				<img src="${contextPath}/resources/images/mypage1.png">
			</a>
		</div>
		<div>
			<c:choose>
				<c:when test="${isLogOn == true && userVO != null}">
					<p>환영합니다. ${userVO.nickname} 님! </p>
					<a href="${contextPath}/main/logout.do"><p>로그아웃</p></a>
				</c:when>
				<c:otherwise>
					<a  class="log" href="${contextPath}/main/account.do"><p>로그인/회원가입</p></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
		</div>
		</div>
		
	  </nav>
</body>
</html>