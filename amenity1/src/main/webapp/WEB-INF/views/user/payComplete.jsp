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
  max-width: 900px;
  margin: 0 auto;
  background-color: #fff;
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
  height:380px;
  width:800px;
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


</style>

<body>
  <div class="container">
    <div class="head">
      <h2>예약이 완료되었습니다.</h2>
      <h4>이메일로 결제 정보를 발송했습니다!</h4>
      <h2>결제상품 정보</h2>
    </div>
    <div class="res-info">
      <div class="img-box">
        <img src="${contextPath}/resources/images/incheon.png" alt="방 이미지" width="300" height="300">
      </div>
      <c:choose>
        <c:when test="${resList == null || resVO != null}">
          <div class="text-box">
            <b style="font-size: 20px;">${resVO.company} </b> <br>
            <b style="font-size: 14px;">디럭스룸 </b> <br><br>
            예약번호 : ${resVO.resNO} <br>
            예약자 : ${resVO.name} <br>
            <b>투숙기간 :  ~  </b> <br> <!-- 수정: 날짜 변수로 대체 -->
          </div>
          <div>
            <hr>
          </div>
          <div class="price">
            <b style="font-size: 14px;">상품가격 : ${resVO.price} </b> <br><br>
            <b style="font-size: 14px;">세금 : ${(resVO.price)/10} </b> <br><br>
            <b style="font-size: 16px;">총 결제금액 : ${resVO.price} </b>
          </div>
        </c:when>
        <c:otherwise>
          <c:forEach var="res" items="${resList}">
            <div class="text-box">
              <b style="font-size: 20px;">${res.company} </b> <br>
              <b style="font-size: 14px;">디럭스룸 </b> <br><br>
              예약번호 : ${res.resNO} <br>
              예약자 : ${res.name} <br>
              <b>투숙기간 : ${} ~ ${} </b> <br> <!-- 수정: 날짜 변수로 대체 -->
            </div>
            <div>
              <hr>
            </div>
            <div class="price">
              <b style="font-size: 14px;">상품가격 : <span id="price">${res.price}</span> </b> <br><br>
              <b style="font-size: 14px;">할인금액 : <span id="disc">${res.price}</span> </b> <br><br>
              <b style="font-size: 16px;">총 결제금액 : <span id="totalPrice">${res.price}</span> </b>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
    <a href="${contextPath}/main/main.do">메인페이지로 이동하기</a>
  </div>
</body>
</html>