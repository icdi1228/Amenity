<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  
</head>
<style>
body {
  font-family: 'Roboto', sans-serif;
  background-color: #f4f4f4;
  color: #333;
  margin: 0;
  padding: 20px;
}


.container {
  max-width: 90%;
  margin: 0 auto;
  background-color: #fff;
  height: auto;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  position:relative;
  min-height: 520px;
  overflow: auto;
}

.head {
  text-align:center;
}

.res-info {
  border:1px solid grey;
  border-radius: 5px;
  width:90%;
  height:380px;
  position:absolute;
  left:50%;
  transform:translateX(-50%);
}

.img-box {
  width:25%;
  height:190px;
  float:left;
  padding-left:1%;
}

.img-box img {
  width:90%;
  height:95%;
  float:left;
  margin-left:5%;
  margin-top:10%;

}

.text-box {
  height:200px;
  width:72%;
  margin-left:1%;
  border: 1px solide red;
  float: left;
}

p {
  display:flex;
  justify-content: space-between;
}

.text-box {
  float:left;
}

hr {
  float:left;
  width:100%;
}

.price {
  float:right;
  margin-right:10%;
  text-align:center;
}

.item-spacing {
    height: 390px; 
}

</style>

<body>
  <div class="container">
    <div class="head">
      <h2>예약이 완료되었습니다.</h2>
      <h4>이메일로 결제 정보를 발송했습니다!</h4>
      <h2>결제상품 정보</h2>
    </div>

    <c:choose>
      <c:when test="${resList.size() > 0}">
        <c:forEach var="res" items="${resList}">
            
          <div class="res-info"> 
            
            <div class="img-box">
              <img src="${contextPath}/resources/images/incheon.png" alt="방 이미지" width="300" height="300">
            </div>

            <div class="text-box">
              <b style="font-size: 20px;">${res.company}</b><br>
              <br><br>
              예약번호 : ${res.resNO} <br>
              예약자 : ${res.name} <br>
              <b>투숙기간 : ${res.checkIn} | ${res.checkInTime} ~ ${res.checkOut} | ${res.checkOutTime}  </b> <br>
            </div>

          </div>

          <div class="item-spacing"></div> 

        </c:forEach><br>

        <div class="price">
          <b style="font-size: 16px;">금  액 : <c:out value="${resList[0].price}" > </c:out> 원 </b>
        </div>
      </c:when>        
        
      <c:otherwise>
        <div class="img-box">
          <img src="${contextPath}/resources/images/incheon.png" alt="방 이미지" width="300" height="300">
        </div>   
      
        <div class="text-box">
          <b style="font-size: 20px;">${resVO.company} </b> <br><br><br>
            예약번호 : ${resVO.resNO} <br>
            예약자 : ${resVO.name} <br>
            <b>투숙기간 : ${resVO.checkIn} | ${resVO.checkInTime} ~ ${resVO.checkOut} | ${resVO.checkOutTime} </b> <br> <!-- 수정: 날짜 변수로 대체 -->
        </div>

        <div>
          <hr>
        </div>

        <div class="price">
          <b style="font-size: 16px;">금  액 : <span id="totalPrice">${resVO.price * resVO.dt_gap}</span> </b>
        </div>
      
      </c:otherwise>
    </c:choose>
  </div>
    <!--<a href="${contextPath}/main/main.do">메인페이지로 이동하기</a>-->
</body>
</html>