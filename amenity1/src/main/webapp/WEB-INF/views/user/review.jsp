<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰작성</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            width: 60%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"], input[type="button"] {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: #ffffff;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #0056b3;
        }
        .rate {
            display: inline-block;
            border: 0;
            margin-right: 15px;
        }
        .rate > input {
            display: none;
        }
        .rate > label {
            float: right;
            color: #ddd;
        }
        .rate > label:before {
            display: inline-block;
            font-size: 2rem;
            padding: .3rem .2rem;
            margin: 0;
            cursor: pointer;
            font-family: FontAwesome;
            content: "\f005 ";
        }
        .rate .half:before {
            content: "\f089 ";
            position: absolute;
            padding-right: 0;
        }
        .rate input:checked ~ label, 
        .rate label:hover, .rate label:hover ~ label {
            color: #efff16 !important;
        }
        .rate input:checked + .rate label:hover,
        .rate input input:checked ~ label:hover,
        .rate input:checked ~ .rate label:hover ~ label,
        .rate label:hover ~ input:checked ~ label {
            color: #efff16 !important;
        }
    </style>
</head>
<body>
<h1>리뷰작성</h1>
<form name="reviewForm" method="post" action="${contextPath}/user/writeReview.do" enctype="multipart/form-data">
    <table>
        <tr>
            <td align="right">작성자: </td>
            <td colspan="2"><input type="text" size="20" maxlength="100" value="${user.nickname}" readonly /></td>
        </tr>
        <tr>
            <td align="right">제목: </td>
            <td colspan="2"><input type="text" size="67" maxlength="500" name="title" /></td>
        </tr>
        <tr>
            <td align="right" valign="top">리뷰내용: </td>
            <td colspan="2"><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
        </tr>
        <tr>
            <td align="right" valign="top">별점: </td>
            <td colspan="2">
                <fieldset class="rate">
                    <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                    <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                    <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                    <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                    <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                    <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                    <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                    <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                    <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                    <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
                </fieldset>
            </td>
        </tr>
        
        <tr>
            <td align="center"></td>
            <td colspan="2">
                <input type="submit" value="리뷰작성" />
                <input type="button" value="돌아가기" onClick="backToList(this.form)" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>
