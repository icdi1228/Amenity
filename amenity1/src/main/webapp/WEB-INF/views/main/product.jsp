<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
    request.setCharacterEncoding("utf-8");

    String previousPageUrl = request.getHeader("referer"); // 이전 페이지의 URL을 가져옴
    session.setAttribute("previousPageUrl", previousPageUrl);

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>제품 상세목록</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  
<style>
  .room-reservation-card {
    display: flex;
    justify-content:left;
    align-items: right;
    margin-bottom: 20px;
    padding: 10px;
    max-width: 80%; /* 최대 너비 설정 */
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }

  .room-reservation-left {
    flex: 1;
    padding: 0 10px; /* 이미지와 텍스트 사이 간격 조절 */
    text-align: right; /* 텍스트 가운데 정렬 */
  }

  .room-reservation-image img {
    max-height: 200px; /* 이미지 높이 조절 */
    width: auto;
  }
  .room-reservation-image{
    margin-right: 1em;
  }

  .room-reservation-right {
    flex: 2;
    padding: 10px;
  }

  .room-reservation-right h3 {
    font-size: 1.5em; /* 제목 폰트 크기 조정 */
    margin: 0; /* 기본 마진 제거 */
    text-align:left;
  }

  .room-price, .room-detail {
    margin: 10px 0; /* 텍스트 간격 조정 */
  }

  .adc {
    background-color: #ddd;
  }

  .adc h4,p{
    margin : 15px;
  }

  .product-company {
    display: flex;
    flex-direction: column;
    align-items: left;
    gap: 20px;
    padding: 20px;
  }
    
  .product-de {
    display: flex;
    flex-direction: column;
    align-items: left;
    gap: 20px;
    padding: 20px;
  }

  .product-card {
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 100%;
    box-sizing: border-box;
    transition: transform 0.2s ease-in-out;
    display: flex;
  }

  .product-card .product-details {
    flex: 1;
    text-align: left;
    margin-left: 20px;
  }

    .product-card .product-details h3 {
      text-align: left;
      margin-top: 0;
      font-weight:bold;
      color:black;
      font-size:2em;

    }
    .product-card .product-details p{
      text-align: left;
      margin-top:10px;
    }

      .mainimg{
        width:50%;
        height:400px;
      }
  

      .booking-link {
          text-align: center;
          margin-top: 10px;
      }

       /* 모달 창 스타일 */
       .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }
        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            width: 80%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .miniModal-content {
            background-color: #fff;
            margin: 20% auto;
            padding: 20px;
            width: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .modal-content img {

            margin-right: 5px;
        }
        .close {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 20px;
            cursor: pointer;
        }

        .resmodal{
            display: none;
            position: fixed;
            left: 0%;
            top: 0%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }
        
  .carousel-wrapper {
    overflow: hidden;
    width: 90%;
    margin: auto;
  }

  .carousel-wrapper * {
    box-sizing: border-box;
  }

  .carousel {
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    transform-style: preserve-3d;
  } 

  .carousel_item {
    opacity: 0;
    position: absolute;
    top: 0;
    width: 500px !important;  /* 원하는 너비로 설정 */
    height: 350px !important; /* 원하는 높이로 설정 */
    object-fit: cover !important;
    margin: auto;
    padding: 1rem 4rem;
    z-index: 100;
    transition: transform 0.5s, opacity 0.5s, z-index 0.5s;
  }

.carousel_item.active {
  opacity: 1;
  position: relative;
  z-index: 900;
}

.carousel_item.prev,
.carousel_item.next {
  z-index: 800;
}

.carousel_item.prev {
  transform: translateX(-100%);
}

.carousel_item.next {
  transform: translateX(100%);
}

.carousel_button--prev,
.carousel_button--next {
  position: absolute;
  top: 50%;
  width: 3rem;
  height: 3rem;
  background-color: #fff;
  transform: translateY(-50%);
  border-radius: 50%;
  cursor: pointer;
  z-index: 1001;
  border: 1px solid black;
}

.carousel_button--prev {
  left: 0;
}

.carousel_button--next {
  right: 0;
}

.carousel_button--prev::after,
.carousel_button--next::after {
  content: ' ';
  position: absolute;
  width: 10px;
  height: 10px;
  top: 50%;
  left: 54%;
  border-right: 2px solid black;
  border-bottom: 2px solid black;
  transform: translate(-50%, -50%) rotate(135deg);
}

.carousel_button--next::after {
  left: 47%;
  transform: translate(-50%, -50%) rotate(-45deg);
}

<!--탭메뉴 스타일 등장-->
.main {
            min-width: 320px;
            max-width: 800px;
            padding: 50px;
            margin: 0 auto;
            background: #ffffff;}

        section {
            display: none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;}

        /*라디오버튼 숨김*/
          input[type="radio"] {
              display: none;}

        label {
            display: inline-block;
            margin: 0 0 -1px;
            padding: 15px 25px;
            font-weight: 600;
            text-align: left;
            color: #bbb;
            border: 1px solid transparent;}

        label:hover {
            color: #2e9cdf;
            cursor: pointer;}

        /*input 클릭시, label 스타일*/
        input:checked + label {
              color: #555;
              border: 1px solid #ddd;
              border-top: 2px solid #2e9cdf;
              border-bottom: 1px solid #ffffff;}

        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2,
        #tab3:checked ~ #content3 {
            display: block;}

.resButton {
  width:100%;
  height:100%;
  margin-top:10%;
}

.timeResButton{
  width:100%;
  height:100%;
  margin-top:10%;
}
/* 리뷰 카드 스타일 */
.reviewlist {
    margin: 20px 0;
}

.review-card {
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 100%;
    box-sizing: border-box;
    transition: transform 0.2s ease-in-out;
    display: flex;
}

.review-details {
    flex: 1;
    text-align: left;
    margin-left: 20px;
}

/* 별점 스타일 */
.rating {
    display: flex;
    align-items: center;
}

.star-rating {
    display: flex;
}

.star-image {
    width: 20px;
    height: 20px;
    fill: yellow;
    margin-right: 3px;
}

/* 리뷰 날짜 스타일 */
.review-date {
    color: #777;
    font-size: 12px;
    margin-top: 10px;
}

.room-info-container {
    display: flex;
    justify-content: space-between;
    align-items: start;
    padding: 10px;
    border: 1px solid #e1e1e1;
    border-radius: 5px;
    max-width: 800px;
    margin: 20px auto;
}

.info-content {
    display: flex;
    flex-direction: column;
    flex: 1; /* 버튼의 크기를 제외한 나머지 공간을 차지 */
}

.price-section {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}
.price{
  margin-right:7em;
  width:200px;
}
.price, .tprice {
    flex: 1;
    text-align: center;
}

.stdper, .detail {
    margin: 10px 0;
    text-align: left;
}

.btn-section {
    align-self: flex-end;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 10px;
    width: fit-content; /* 버튼의 크기만큼의 너비를 가짐 */
}

.resButton{
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #e74c3c;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.2s;
}

.resButton:hover{
    background-color: #d62c19;
}

.timeResButton{
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #e74c3c;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.2s;
}

.timeResButton:hover{
    background-color: #d62c19;
}

.button-container {
  display: flex;
}

.resDate{
  display: inline-block;
}
       
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//결제, 장바구니
/*
function fn_modify_Cart(obj) {
    console.log(obj);
		obj.action="${contextPath}/user/InCart.do";
		obj.submit();
    
	}

  function fn_modify_Pay(obj) {
    console.log(obj);
		obj.action="${contextPath}/user/payment.do";
		obj.submit();
    
	}
*/
</script>
<script>





  $(document).ready(function(){
    
    $(".mainimg").click(function(){
      $("#myModal").show(); // 모달 창 보이기
    });

    $(".close").click(function(){
      $("#myModal").hide(); // 모달 창 숨기기
    });

    // 모달 창 외부 클릭 감지
    $(document).click(function(event) {
      var target = $(event.target);
      if (!target.closest("#myModal .modal-content").length && !target.closest(".mainimg").length) {
        $("#myModal").hide();
      }
    });
  });

  (function () {
'use strict'

const get = (target) => {
return document.querySelector(target)
}

class Carousel {
constructor(carouselElement) {
this.carouselElement = carouselElement;
this.itemClassName = 'carousel_item';
this.items = this.carouselElement.querySelectorAll('.carousel_item')

this.totalItems = this.items.length
this.current = 0
this.isMoving = false
}

initCarousel() {
this.isMoving = false
this.items[0].classList.add('active')
this.items[1].classList.add('next')
this.items[this.totalItems-1].classList.add('prev')
}

disabledInteraction() {
this.isMoving = true
setTimeout(() => {
  this.isMoving = false
}, 500)
}

setEventListener() {
this.prevButton = this.carouselElement.querySelector('.carousel_button--prev')
this.nextButton = this.carouselElement.querySelector('.carousel_button--next')
this.prevButton.addEventListener('click', () => {
  this.movePrev()
})
this.nextButton.addEventListener('click', () => {
  this.moveNext()
})
}

moveCarouselTo() {
if(this.isMoving) return
this.disabledInteraction()
let prev = this.current - 1
let next = this.current + 1

if(this.current === 0) {
  prev = this.totalItems - 1
} else if(this.current == this.totalItems - 1) {
  next = 0
}

for (let i = 0; i < this.totalItems; i++) {
  if(i === this.current) {
    this.items[i].className = this.itemClassName + ' active'
  } else if ( i === prev ){
    this.items[i].className = this.itemClassName + ' prev'
  } else if ( i === next) {
    this.items[i].className = this.itemClassName + ' next'
  } else {
    this.items[i].className = this.itemClassName
  }
}
}


moveNext() {
if(this.isMoving) return
if (this.current === this.totalItems - 1) {
  this.current = 0
} else {
  this.current++
}
this.moveCarouselTo()
}

movePrev() {
if(this.isMoving) return
if(this.current === 0){
  this.current = this.totalItems - 1
} else{
  this.current--
}
this.moveCarouselTo()
}

}

document.addEventListener('DOMContentLoaded', () => {
const carouselElement = get('.carousel')
const carousel = new Carousel(carouselElement)

carousel.initCarousel()
carousel.setEventListener()
})

})()

    
  $(document).ready(function(){
    // 기존의 이미지 클릭 이벤트
    $(".mainimg").click(function(){
      $("#myModal").show();
    });

    $(".close").click(function(){
      $("#myModal").hide();
    });

    // 예약하기 버튼 클릭 이벤트
    $(".resButton").click(function(){
      var selectedRoom = $(this).attr("data");
      $("#selectedGno").val(selectedRoom); 
      $("#reservationModal").show();
    });

    $("#reservationModal .close").click(function(){
      $("#reservationModal").hide();
    });

    // 대실버튼 클릭 이벤트
    $(".timeResButton").click(function(){
      var selectedRoom = $(this).attr("data-room");
      $("#selectedRoom").val(selectedRoom); 
      $("#timeReservationModal").show();
    });

    $("#timeReservationModal .close").click(function(){
      $("#timeReservationModal").hide();
    });

    // 로그인 유무 버튼 
    $(".selButton").click(function(){
      $("#login_state").show();
    });

    $("#login_state .close").click(function(){
      $("#login_state").hide();
    });




    // 모달 창 외부 클릭 감지
    $(document).click(function(event) {
        var target = $(event.target);
        if (!target.closest("#myModal .modal-content").length && !target.closest(".mainimg").length) {
            $("#myModal").hide();
        }
        if (!target.closest("#reservationModal .modal-content").length && !target.closest(".resButton").length && !target.closest(".resDate").length) {
            $("#reservationModal").hide();
        }
        if (!target.closest("#timeReservationModal .modal-content").length && !target.closest(".timeResButton").length && !target.closest(".timeResDate").length) {
            $("#timeReservationModal").hide();
        }
        if (!target.closest("#login_state .modal-content").length && !target.closest(".resButton").length) {
            $("#login_state").hide();
        }

    });
});




 
</script>

</head>


<body>

  <div class="product-company">
    <div class="product-card">
      <c:forEach items="${main_imgs}" var="main_img">
          <img class="mainimg" src="${contextPath}/main/mainDownload.do?main_img=${main_img}&amp;company=${company.company}" alt="" />
      </c:forEach>
      <div class="product-details">
          <h3><b class="head" style="color: #f5ba18;">&nbsp;${company.category}</b>&nbsp;${company.company}</h3>
          <hr>        
          <p class="p-1"><b>평점</b>${company.grade} &nbsp; 

            <c:choose>
              <c:when test="${isbook == true}">
                <a href="javascript:void(0);" onclick="alert('이미 찜한 상품입니다!');">
                  <img id="bookmarkImage" src="${contextPath}/resources/images/bookmark_af.png" style="float: right;">
              </a>
              </c:when>
              <c:when test="${isbook == false}">
                <a href="javascript:void(0);" onclick="toggleBookmark('${company.c_no}', '${userVO.u_id}');">
                  <img id="bookmarkImage" src="${contextPath}/resources/images/bookmark_bf.png" style="float: right;">
              </a>
              </c:when>
            </c:choose>


          </p>
          <p class="p-2" style="color:rgb(59, 57, 57);">주소 : ${company.location}</p>
          <p class="p-3"><b>객실정보</b> : ${company.detail}</p>
  
          <div class="adc">
              <h4>관리자 한마디</h4>
              <p>기쁜마음으로 남녀노소 즐길 수 있는 공간입니다. 
                  -이창현 관리자 의 추천 -
              </p>
          </div>
      </div>
  </div>
  
  <script>
      function toggleBookmark(c_no, u_id) {
          $.ajax({
              type: 'GET',
              url: '${contextPath}/main/bookmarked.do',
              data: {
                  c_no: c_no,
                  u_id: u_id
              },
              success: function(response) {
                alert(response);
                var img = document.getElementById('bookmarkImage');
                img.src = '${contextPath}/resources/images/bookmark_af.png';
                location.reload();
                  
              },
              error: function(xhr, status, error) {
                  console.error(error);
              }
          });
      }
  </script>

 <script>
  /* *****************************숙박부분************************************* */
  function fn_modify_Cart(obj) {
      var checkInDateStr = document.querySelector('.resDate[name="checkIn"]').value;
      var checkOutDateStr = document.querySelector('.resDate[name="checkOut"]').value;
      
      var checkInDate = new Date(checkInDateStr);
      var checkOutDate = new Date(checkOutDateStr);
      var d_date = (checkOutDate - checkInDate) / (1000 * 60 * 60 * 24) + 1;

      alert("d_date : " + d_date);

      // user_product form 내의 hidden input에 예약 날짜 값을 설정
      document.querySelector('form[name="user_product"] input[name="checkIn"]').value = checkInDateStr;
      document.querySelector('form[name="user_product"] input[name="checkOut"]').value = checkOutDateStr;

      document.querySelector('form[name="user_product"] input[name="resform"]').value = '숙박';

      // 모달 닫기
      document.getElementById('reservationModal').style.display = 'none';

      obj.action="${contextPath}/user/InCart.do";
      obj.submit();
  }

  function fn_modify_Pay(obj) {
      var checkInDateStr = document.querySelector('.resDate[name="checkIn"]').value;
      var checkOutDateStr = document.querySelector('.resDate[name="checkOut"]').value;

      var checkInDate = new Date(checkInDateStr);
      var checkOutDate = new Date(checkOutDateStr);
      var d_date = (checkOutDate - checkInDate) / (1000 * 60 * 60 * 24) + 1;

      alert("d_date : " + d_date);

      // user_product form 내의 hidden input에 예약 날짜 값을 설정
      document.querySelector('form[name="user_product"] input[name="checkIn"]').value = checkInDateStr;
      document.querySelector('form[name="user_product"] input[name="checkOut"]').value = checkOutDateStr;

      document.querySelector('form[name="user_product"] input[name="resform"]').value = '숙박';

      // 모달 닫기
      document.getElementById('reservationModal').style.display = 'none';

      obj.action="${contextPath}/user/pay1.do";
      obj.submit();
  }


  /* **************************대실부분***************************** */
  function fn_modify_Cart_Time(obj) {
      var checkInDate = document.querySelector('.timeResDate[name="checkIn"]').value;
      var checkOutDate = document.querySelector('.timeResDate[name="checkOut"]').value;
      var checkInTime = document.querySelector('.timeResDate[name="checkInTime"]').value;
      var checkOutTime = document.querySelector('.timeResDate[name="checkOutTime"]').value;

      // user_product form 내의 hidden input에 예약 날짜 값을 설정
      document.querySelector('form[name="user_product"] input[name="checkIn"]').value = checkInDate;
      document.querySelector('form[name="user_product"] input[name="checkOut"]').value = checkOutDate;
      document.querySelector('form[name="user_product"] input[name="checkInTime"]').value = checkInTime;
      document.querySelector('form[name="user_product"] input[name="checkOutTime"]').value = checkOutTime;
      document.querySelector('form[name="user_product"] input[name="resform"]').value = '대실';

      // 모달 닫기
      document.getElementById('reservationModal').style.display = 'none';

      obj.action="${contextPath}/user/InCart.do";
      obj.submit();
  }

  function fn_modify_Pay_Time(obj) {
      var checkInDate = document.querySelector('.timeResDate[name="checkIn"]').value;
      var checkOutDate = document.querySelector('.timeResDate[name="checkOut"]').value;
      var checkInTime = document.querySelector('.timeResDate[name="checkInTime"]').value;
      var checkOutTime = document.querySelector('.timeResDate[name="checkOutTime"]').value;

      // user_product form 내의 hidden input에 예약 날짜 값을 설정
      document.querySelector('form[name="user_product"] input[name="checkIn"]').value = checkInDate;
      document.querySelector('form[name="user_product"] input[name="checkOut"]').value = checkOutDate;
      document.querySelector('form[name="user_product"] input[name="checkInTime"]').value = checkInTime;
      document.querySelector('form[name="user_product"] input[name="checkOutTime"]').value = checkOutTime;
      document.querySelector('form[name="user_product"] input[name="resform"]').value = '대실';

      // 모달 닫기
      document.getElementById('reservationModal').style.display = 'none';

      obj.action="${contextPath}/user/pay1.do";
      obj.submit();
  }
  </script> 



  </div>
  

  <!--탭메뉴등장-->
  <div class="main">

    <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    <label for="tab1">객실안내 / 예약</label>

    <input id="tab2" type="radio" name="tabs">
    <label for="tab2">리뷰</label>

    <input id="tab3" type="radio" name="tabs">
    <label for="tab3">위치</label>

    <section id="content1">
      <!-- 객실 예약하기 -->
      <form class="form" name="user_product" method="post" action="${contextPath}/user/InCart.do">
      <c:forEach var="goods" items="${goods}" varStatus="status">
    
        <input type="hidden" name="c_no" value="${company.c_no}"/>
        <input id="selectedGno" type="hidden" name="g_no" value="${goods.g_no}"/>
        <input type="hidden" name="price" value="${goods.price}"/>
        <div class="room-reservation-card">
            <div class="room-reservation-image">
                <img src="${contextPath}/business/mainDownload.do?main_img=${gmain_imgs[status.index]}&amp;room=${goods.room}" alt="" />
            </div>

          <div class="room-reservation-details">
            <h3><b>${goods.room}</b></h3>
            <div class="room-info-container">
              <div class="info-content">
                  <div class="price-section">
                      <div class="price">숙박가격: ${goods.price}</div>
                      <div class="tprice">대실가격: ${goods.timeprice}</div>
                  </div>
                  <div class="stdper">기준인원: ${goods.stdper}</div>
                  <div class="detail">객실안내: ${goods.detail}</div>
                  <input type="hidden" name="checkIn">
                  <input type="hidden" name="checkOut">
                  <input type="hidden" name="checkInTime" value="12:00">
                  <input type="hidden" name="checkOutTime" value="17:00">
                  <input type="hidden" name="resform" />
              </div>
              <div class="btn-section">
                  <div class="btn">
                      <input type="button" class="resButton" value="숙박예약하기" data="${goods.g_no}">
                      <input type="button" class="timeResButton" value="대실예약하기" data-room="${goods.room}">
                  </div>
              </div>
          </div>
          
          </div>
        </div>
      
      </c:forEach>
    </form>
    </section>

    <section id="content2">

      <!-- 리뷰 보기-->
      <c:forEach var="review" items="${review}">
        <div class="reviewlist">
          <div class="review-card">
            <div class="review-details">
              <h3><b>${review.nickname} 님의 리뷰</b></h3>
                <div class="rating">
                  <p class="p-1">별점 :</p>
                  <div class="star-rating">
                    <c:forEach begin="1" end="${review.grade/2}">
                      <img src="${contextPath}/resources/images/grade.png" alt="별" class="star-image" />
                    </c:forEach>
                  </div>
                  <p class="p-3">리뷰내용 : ${review.content}</p>
                  <p class="review-date">${review.writedate}</p>
              </div>
          </div>
      </div>
        <!---->
        </c:forEach>
    </section>
    <section id="content3">
      <div id="map" style="width:600px; height:500px;"></div>
    </section>
    
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ee5742af74aeabb95a5010509d6933c"></script>
  <script>
    var latitude = '${company.latitude}';
    var longitude = '${company.longitude}';
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
    // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);    
    </script>

    <script>
      /* datetime-local의 시간값을 고정하는 스크립트 */
      /* 숙박부분 */
      function disableInTime(input) {
        const parts = input.value.split("T");
        input.value = parts[0] + "T17:00";
      }
      function disableOutTime(input) {
        const parts = input.value.split("T");
        input.value = parts[0] + "T12:00";
      }

      /*대실 부분*/
      function timeDisableInTime(input) {
        const parts = input.value.split("T");
        input.min = parts[0] + "T11:00";
      }
      function timeDisableOutTime(input) {
        const parts = input.value.split("T");
        input.max = parts[0] + "T17:00";
      }
    </script>
</div>


<!-- 모달 창 -->
<div id="myModal" class="modal">
  <div class="modal-content">
      <div class="carousel-wrapper">
          <div class="carousel">
              <c:forEach items="${sub_imgs}" var="sub_img">
                  <img class="carousel_item" src="${contextPath}/main/subDownload.do?sub_img=${sub_img}&amp;company=${company.company}"/>  <!-- sub_img -->
              </c:forEach>
            <div class="carousel_button--next"></div>
            <div class="carousel_button--prev"></div>
          </div>
        </div>
  </div>
</div>

<!-- 숙박예약 모달 창 -->
<div id="reservationModal" class="resmodal">
  <div class="miniModal-content">
      <span class="close">&times;</span>
      <h4> 선택해주세요 </h4>
      <p> </p>
        체크인 <input type="date" name="checkIn" class="resDate" id="dateInput"><br><br>
        체크아웃 <input type="date" name="checkOut" class="resDate" id="dateInput">
        <input type="hidden" name="resform" value='숙박'/>
      <div class="button-container">
        <input id="cartBtn" class="resButton" type="button" value="장바구니 담기" onClick="fn_modify_Cart(user_product)" >
        <input id="payBtn" class="resButton" type="button" value="바로 결제하기" onClick="fn_modify_Pay(user_product)" >
      </div>
  </div>
</div>

<!-- 대실예약 모달 창 -->
<div id="timeReservationModal" class="resmodal">
  <div class="miniModal-content">
      <span class="close">&times;</span>
      <h4> 선택해주세요 </h4>
      <p> </p>
        체크인 <input type="date" name="checkIn" class="timeResDate" id="dateInput">
        시간 <input type="time" name="checkInTime" class="timeResDate" ><br><br>
        체크아웃 <input type="date" name="checkOut" class="timeResDate" id="dateInput">
        시간 <input type="time" name="checkOutTime" class="timeResDate" >
        <input type="hidden" name="resform" value='대실'/>
      <div class="button-container">
        <input id="cartBtn" class="timeResButton" type="button" value="장바구니 담기" onClick="fn_modify_Cart_Time(user_product)" >
        <input id="payBtn" class="timeResButton" type="button" value="바로 결제하기" onClick="fn_modify_Pay_Time(user_product)" >
      </div>
  </div>
</div>


<!-- 로그인 유무 모달 창 -->
<div id="login_state" class="resmodal">
<div class="miniModal-content">
    <span class="close">&times;</span>
    <h4> 결제 진행 방법을 선택해주세요 </h4>
    <p> </p>
    <div class="button-container">
        <input type="button" id="n_user_pay" class="resButton" value="비회원 결제 진행">
        <input type="button" id="user_pay" class="resButton" value="로그인 결제 진행">
    </div>
</div>
</div>




</body>
</html>

<script>
  var today = new Date().toISOString().split('T')[0];
  document.getElementById('dateInput').setAttribute('min', today);
  document.getElementById('dateInput').setAttribute('value', today);
</script>


