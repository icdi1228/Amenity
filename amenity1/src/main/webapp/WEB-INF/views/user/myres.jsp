<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메인 페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
    }

    .section {
      margin: 20px;
      padding: 10px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      display: flex;
      align-items: center;
    }

    .section-title {
      font-size: 1.5rem;
      margin-bottom: 10px;
    }

    .card {
      margin-bottom: 20px;
      display: flex;
      align-items: center;
    }

    .card-image {
      width: 300px; /* 원하는 가로 크기로 설정해주세요 */
      height: 210px; /* 원하는 세로 크기로 설정해주세요 */
      object-fit: cover;
      border-radius: 10px 0 0 10px;
    }

    .card-content {
      padding: 20px;
      flex: 1;
    }

    .card-subtitle {
      font-size: 1rem;
      color: #666;
      margin-bottom: 5px;
    }

    .card-text {
      font-size: 0.9rem;
      margin-bottom: 10px;
    }

    .btn-primary {
      background-color: #007bff;
      border: none;
      border-radius: 5px;
      padding: 5px 10px;
      color: #fff;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 0.9rem;
      cursor: pointer;
    }

    .btn-primary2 {
      background-color: #ff000de8;
      border: none;
      border-radius: 5px;
      padding: 5px 10px;
      color: #fff;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 0.9rem;
      cursor: pointer;
    }

    .left-section {
      flex: 1;
      padding-right: 20px;
    }

    .right-section {
      flex: 2;
    }

    .button-box{
      display:inline-block;
      text-align: center;
      margin:10px;
    }

  </style>
</head>
<body>
  <h2 class="section-title">나의 예약 내역</h2>
  <c:forEach var="myRes" items="${myRes}" varStatus="status">
  <div class="section">
    
    <div class="left-section">
      <img class="card-image" src="${contextPath}/business/mainDownload.do?main_img=${gmain_imgs[status.index]}&amp;room=${myRes.room}" alt="이미지">
    </div>
    
    <div class="right-section">
      
      
      <div class="card">
        <div class="card-content">
          <div class="card-subtitle"><b>${myRes.company}</b></div>
          <div class="card-text"><b>예약자명 : ${myRes.name}</b></div>
          <div class="card-text">기간 : ${myRes.checkIn} ~ ${myRes.checkOut}</div>
          <div class="card-text">금액 : ${myRes.price}</div>
          <div class="card-text">구매형태 : ${myRes.resform}</div>
          <div class="card-text">예약일자 : ${myRes.resDate}</div>
          <div class="button-box">
          <a class="btn-primary" href="#">리뷰작성</a>
          <a class="btn-primary2" href="#">예약취소</a>
        </div>
        </div>
      </div>
    
    </div>
  
  </div>
</c:forEach>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
