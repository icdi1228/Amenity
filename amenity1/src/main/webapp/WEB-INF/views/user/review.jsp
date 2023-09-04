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
<title>리뷰쓰기 창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function backToList(obj){
		obj.action="${contextPath}/user/myRes.do";
		obj.submit();
	}
</script>

<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
       .rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd}
.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { color: #fffb00 !important;  } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #fffb00 !important;  } 


</style>

</head>
<body>
<h1 style="text-align:center">리뷰작성</h1>
	<form name="articleForm" method="post" action="${contextPath}/user/writeReview.do">
	<table border="0" align="center">
	<tr>
		<td align="right">닉네임</td>
		<td colspan=2 align="left">
		<input type="text" size="20" maxlength="100" name="nickname" value="${userVO.nickname}" readonly/>		 
        <input type="hidden" name="u_id" value="${userVO.u_id}" />
		<input type="hidden" name="resNO" value="${resNO}" />
		</td>
	</tr>
    <tr>
		<td align="right">별점 </td>
		<td><fieldset class="rate">
            <input type="radio" id="rating10" name="grade" value="10"><label for="rating10" title="5점"></label>
            <input type="radio" id="rating9" name="grade" value="9"><label class="half" for="rating9" title="4.5점"></label>
            <input type="radio" id="rating8" name="grade" value="8"><label for="rating8" title="4점"></label>
            <input type="radio" id="rating7" name="grade" value="7"><label class="half" for="rating7" title="3.5점"></label>
            <input type="radio" id="rating6" name="grade" value="6"><label for="rating6" title="3점"></label>
            <input type="radio" id="rating5" name="grade" value="5"><label class="half" for="rating5" title="2.5점"></label>
            <input type="radio" id="rating4" name="grade" value="4"><label for="rating4" title="2점"></label>
            <input type="radio" id="rating3" name="grade" value="3"><label class="half" for="rating3" title="1.5점"></label>
            <input type="radio" id="rating2" name="grade" value="2"><label for="rating2" title="1점"></label>
            <input type="radio" id="rating1" name="grade" value="1"><label class="half" for="rating1" title="0.5점"></label>

        </fieldset></td>
	</tr>
	<tr>
		<td align="right">제목: </td>
		<td colspan="2"><input type="text" size="67" maxlength="500" name="title"/></td>
	</tr>
	<tr>
		<td align="right" valign="top"><br>내용: </td>
		<td colspan=2><textarea name="content" rows="10" cols="65" maxlength="1000"></textarea>
	</tr>
	<tr>
		<td align="right"></td>
		<td colspan="2">
			<input type="submit" value="리뷰등록"/>
			<input type=button value="취소" onClick="backToList(this.form)"/>
		</td>
	</tr>
	</table>
	</form>
</body>
</html>
