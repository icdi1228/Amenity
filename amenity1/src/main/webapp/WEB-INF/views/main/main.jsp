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
  .main{
    height: 1600px;
  }

.blank {
  height: 50px;
} 

.outter-div1{
  padding-top:50px;
  padding-bottom:150px;
  position:relative;
}
#outter-div{
  position: relative;
}
#inner-div{
  position: relative;
}
#absolute{
  position:absolute;
}
.imsize{
  width: 100px;
  height: 100px;
}
.imdiv1{
  position:absolute;
  width:150px;
  height: 150px;
  left:10%;
}
.imdiv2{
  position:absolute;
  width:150px;
  height: 150px;
  left:33%;
}
.imdiv3{
  position:absolute;
  width:150px;
  height: 150px;
  right:33%;
}
.imdiv4{
  position:absolute;
  width:150px;
  height: 150px;
  right:10%;
}
.inner-div2{
  width:1500px;
  height: 800px;
  padding-left: 0px;
  margin-left: -60px;
}

.imsize2{
  width:400px;
  height:300px;
}
.divh1{
  position:absolute;
}

#center {
  text-align: center;
}

.divh2{
  position:absolute;
  top:5%;
  left:2%;
}
.outter-div2{
  padding-top:400px;
  padding-bottom:150px;
  position:relative;
}

.carousel-item img {
  width: 80%;
  height: 400px;
}

.aimg {
  width: 100px;
  height: 100px;
}


* {
  margin:0; 
  padding:0;
}

li{
  list-style:none;
}

.slide_wrapper {
  position: relative;
  width:990px;
  margin:0 auto;
  height:300px;
  overflow:hidden;
}

.slides {
  position:absolute;
  left:0; 
  top:0;
  transition:left 0.5s ease-out;
}

.slides li:not(:last-child) {
  float:left;
  margin-right:30px;
}

.controls {
  text-align: center;
  margin-top: 50px;
}

.prev, .next {
  padding: 10px;
  position: absolute;
  top: 35%;
  transform: translateY(-50%);
  border: none;
  cursor: pointer;
}
    
.prev {
  left: 120px; 
}
    
.next {
  right: 80px; 
}

.f_left {
  float:left;
}

.event_banner {
  width: 1300px;
  height: 200px;
  margin-left: 120px;
}

.event_banner img {
  width: 50%;
  height: 200px;
  border: 0.5px solid black;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
  color: black; 
}


</style>
<script>
  
window.addEventListener('load', function() {
    naverLogin.getLoginStatus(function(status) {
        if (status) {
            naverLogin.logout(); 

            openPopUp();
            setTimeout(function() {
                closePopUp();
				location.reload();
            }, 1000);
        } else {
        }
    });
});

</script>
<body>
  <div class="main">
  <div class="container">

    <div class="blank"></div>

		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="${contextPath}/resources/images/mainImg1.png" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="${contextPath}/resources/images/mainImg2.png" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="${contextPath}/resources/images/mainImg3.png" class="d-block w-100" alt="...">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <div class="blank"></div>

	</div>
  <div class="outter-div1">
    <div id="inner-div">
      <div class="imdiv1">
        <a href="${contextPath}/main/categorySearch.do?category=호텔"><img class="imsize" src="${contextPath}/resources/images/hotel.png"></a>
        <p><b>호텔</b></p>
      </div>
      <div class="imdiv2">
        <a href="${contextPath}/main/categorySearch.do?category=모텔"><img class="imsize" src="${contextPath}/resources/images/motel.png"></a>
        <p><b>모텔</b></p>
      </div>
      <div class="imdiv3">
        <a href="${contextPath}/main/categorySearch.do?category=캠핑"><img class="imsize" src="${contextPath}/resources/images/camping.png"></a>
        <p><b>캠핑</b></p>
      </div>
      <div class="imdiv4">
        <a href="${contextPath}/main/categorySearch.do?category=풀빌라"><img class="imsize" src="${contextPath}/resources/images/garden.png"></a>
        <p><b>풀빌라</b></p>
      </div>
    </div>
  </div>

  <div class="outter-div1" name="popular">

    <div class="inner-div2" id="absolute">
      <h5><b id="center">☆ 떠오르는 인기 여행지 ☆</b></h5>
      <b>추천 인기 여행지</b><br><br>
     
      <div>

        <div class="slide_wrapper" id="slide_wrapper">
          <ul class="slides">
            <li><img src="${contextPath}/resources/images/seoul.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/gyeonggi.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/incheon.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/seoul.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/seoul.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/seoul.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/seoul.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/seoul.png" alt="" width="300" height="300"></li>
            <li><img src="${contextPath}/resources/images/seoul.png" alt="" width="300" height="300"></li>
          </ul>   
        </div>
      
        <p class="controls">
          
          <button class="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>

          <button class="next">
            <span class="carousel-control-next-icon"></span>
          </button>

        </p>

      </div>  

      <div class="blank"></div>

      <div class="event_banner" id="absolute">
        <div id="carouselExampleIndicators" class="carousel slide carousel-dark slide">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>

          <div class="carousel-inner">
            
            <div class="carousel-item active">
              <img src="${contextPath}/resources/images/event.png" class="d-block w-100" alt="..." >
            </div>

            <div class="carousel-item">
              <img src="${contextPath}/resources/images/event.png" class="d-block w-100" alt="..." >
            </div>

            <div class="carousel-item">
              <img src="${contextPath}/resources/images/event.png" class="d-block w-100" alt="..." >
            </div>

          </div>
         
        </div>
      </div>


    </div>

  </div>




</div>

<script>
  var slides = document.querySelector('.slides'),
  slide = document.querySelectorAll('.slides li'),
  currentIdx = 0,
  slideCount = slide.length,
  prevBtn = document.querySelector('.prev'),
  slideWidth = 300,
  slideMargin = 30,

  nextBtn = document.querySelector('.next');

  slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin + 'px' ;

  function moveSlide(num) {

  slides.style.left = -num * 330 + 'px' ;
  currentIdx = num;
  }

  nextBtn.addEventListener('click', function(){
  if(currentIdx < slideCount - 3){
  moveSlide(currentIdx + 1);
  console.log(currentIdx);
  }
  else {
  moveSlide(0);
  }
  });
                     
  prevBtn.addEventListener('click', function(){
  if(currentIdx > 0){
  moveSlide(currentIdx - 1);
  }
  else {
  moveSlide(slideCount - 3);
  }
  });                        

</script>
</body>
</html>