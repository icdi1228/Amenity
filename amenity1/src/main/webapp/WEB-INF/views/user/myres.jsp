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

    .left-section {
      flex: 1;
      padding-right: 20px;
    }

    .right-section {
      flex: 2;
    }
  </style>
</head>
<body>
  <div class="section">
    <div class="left-section">
      <img class="card-image" src="${contextPath}/resources/images/h1.jpg" alt="호텔 이미지">
    </div>
    <div class="right-section">
      <h2 class="section-title">예약중인 내역</h2>
      <div class="card">
        <div class="card-content">
          <div class="card-subtitle"><b>B호텔 스위트룸</b></div>
          <div class="card-text"><b>예약자명 : 김법규</b></div>
          <div class="card-text">기간: 23.09.07 17:50 ~ 23.09.10 10:30</div>
          <div class="card-text">결제상태 : 결제대기</div>
          <a class="btn-primary" href="#">취소하기</a>
        </div>
      </div>
    </div>
  </div>

  <div class="section">
    <div class="left-section">
      <img class="card-image" src="${contextPath}/resources/images/h2.jpg" alt="호텔 이미지">
    </div>
    <div class="right-section">
      <h2 class="section-title">취소/환불 내역</h2>
      <div class="card">
        <div class="card-content">
          <div class="card-subtitle"><b>ABC호텔 디럭스</b></div>
          <div class="card-text"><b>예약자명 : 김법규</b></div>
          <div class="card-text">기간: 23.09.09 18:30 ~ 23.09.11 12:30</div>
          <div class="card-text">결제상태 : 처리중</div>
          <a class="btn-primary" href="#">문의하기</a>
        </div>
      </div>
    </div>
  </div>

  <div class="section">
    <div class="left-section">
      <img class="card-image" src="${contextPath}/resources/images/h2.jpg" alt="호텔 이미지">
    </div>
    <div class="right-section">
      <h2 class="section-title">구매완료 내역</h2>
      <div class="card">
        <div class="card-content">
          <div class="card-subtitle"><b>ABC호텔 디럭스</b></div>
          <div class="card-text"><b>예약자명 : 김법규</b></div>
          <div class="card-text">기간: 23.09.09 18:30 ~ 23.09.11 12:30</div>
          <div class="card-text">결제상태 : 처리완료</div>
          <a class="btn-primary" href="#">리뷰작성</a>
        </div>
      </div>
    </div>
  </div>

  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
