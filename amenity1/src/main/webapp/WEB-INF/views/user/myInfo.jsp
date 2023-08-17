<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

.container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.outter-div1, .outter-div2 {
  background-color: #f5f5f5;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  flex: 1;
  margin: 0 10px;
}

.inner-div1 {
  border-right: 1px solid #ddd;
  padding-right: 20px;
  margin-right: 20px;
  text-align: left;
}

.hd {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.in3 {
  margin: 0;
}

.inner-div1 h4 {
  margin: 0;
}

.inner-div2, .inner-div3, .inner-div4, .inner-div5, .inner-div6 {
  text-align: center;
}

.inner-div2 h3, .inner-div3 h3, .inner-div4 h2 {
  margin: 0;
}

.value {
  font-size: 24px;
  font-weight: bold;
  margin: 10px 0;
}

.inner-div5 img {
  max-width: 100px;
  height: auto;
}

.inline {
  display: inline-block;
  margin: 0;
  color: #666;
}

.ares {
  display: inline-block;
  padding: 8px 16px;
  background-color: #007bff;
  color: #fff;
  border-radius: 5px;
  text-decoration: none;
  transition: background-color 0.3s;
}

.ares:hover {
  background-color: #0056b3;
}
.hd button {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 8px 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.hd button:hover {
  background-color: #0056b3;
}
.edit-btn {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 8px 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.edit-btn:hover {
  background-color: #0056b3;
}

.nickname, .u-id, .email, .mileage, .coupon, .company, .location, .grade, .options, .reserve-btn {
 text-align:left;
}


</style>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <div class="outter-div1">
      <div class="inner-div1">
        <section class="hd">
          <h3 class="in3">내 정보</h3>
          <button class="edit-btn">정보 수정</button>
        </section>
        <section>
          <h4>닉네임</h4>
          <p class="nickname">${userVO.nickname}</p>
        </section>
        <section>
          <h4>아이디</h4>
          <p class="u-id">${userVO.u_id}</p>
        </section>
        <section>
          <h4>이메일</h4>
          <p class="email">${userVO.email}</p>
        </section>
      </div>
      <div class="inner-div2">
        <h4>적립금</h4>
        <p class="mileage">${userVO.mileage}</p>
      </div>
      <div class="inner-div3">
        <h4>쿠폰</h4>
        <p class="coupon">${userVO.coupon}</p>
      </div>
    </div>
    <div class="outter-div2">
      <div class="inner-div4">
        <h3 class="out2">Book Mark</h3>
      </div>
      <div class="inner-div5">
        <a><img class="imsize" src="${contextPath}/resources/images/h1.jpg"></a>
      </div>
      <div class="inner-div6">
        <h3 class="company">덕배네</h3>
        <p class="location inline">위치: 서울특별시 강남구</p>
        <p class="grade inline">평점: 4</p>
        <br><br><br><br>
        <p class="options inline">옵션: 1번방 </p>
        <div class="ininner2"></div>
        <a class="reserve-btn">예약하기</a>
      </div>
    </div>
  </div>
</body>


</html>