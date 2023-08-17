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
    </div>
    
    <c:forEach items="${reservationList}" var="reservation">
      <div class="res-info">
        <div class="img-box">
          <img src="${contextPath}/resources/images/incheon.png" alt="방 이미지" width="300" height="300">
        </div>
      
        <div class="text-box">
          <b style="font-size: 20px;">ABC호텔 {business.name} </b> <br>
          <b style="font-size: 14px;">디럭스룸 {goods.name}</b> <br><br>
          예약번호 : {goods_res_num} <br>
          예약자 : {user.name} <br>
          <b>투숙기간 : {} ~ {} </b> <br>
          옵션 : {goods.option} <br>
          주소 : {business.address} <br>
        </div>
      
        <div>
          <hr>
        </div>
  
        <div class="price">
          <b style="font-size: 14px;">상품가격 : {goods.price} </b> <br><br>
          <b style="font-size: 14px;">세금 : {(goods.price)/10} </b> <br><br>
          <b style="font-size: 16px;">총 결제금액 : {total_price} </b>
        </div>
      
      </div>
    </c:forEach>  

    <div class="res-info">
      <div class="img-box">
        <img src="${contextPath}/resources/images/incheon.png" alt="방 이미지" width="300" height="300">
      </div>
    
      <div class="text-box">
        <b style="font-size: 20px;">ABC호텔 {business.name} </b> <br>
        <b style="font-size: 14px;">디럭스룸 {goods.name}</b> <br><br>
        예약번호 : {goods_res_num} <br>
        예약자 : {user.name} <br>
        <b>투숙기간 : {} ~ {} </b> <br>
        옵션 : {goods.option} <br>
        주소 : {business.address} <br>
      </div>
    
      <div>
        <hr>
      </div>

      <div class="price">
        <b style="font-size: 14px;">상품가격 : {goods.price} </b> <br><br>
        <b style="font-size: 14px;">세금 : {(goods.price)/10} </b> <br><br>
        <b style="font-size: 16px;">총 결제금액 : {total_price} </b>
      </div>
    
    </div>
    
      

    
  </div>

</body>
</html>