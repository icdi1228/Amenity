<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ABC 호텔</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        .hotel-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            padding: 20px;
        }
        .hotel-card {
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 70%;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .mainimg {
            max-width: 50%;
            height: auto;
            margin: 10px auto;
            display: block;
            cursor: pointer; /* 클릭 가능함을 나타냄 */
        }
        .room-details {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .room-info {
            text-align: left;
        }
        .resButton {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: inline-block;
            text-decoration: none;
            margin-top: 5px;
        }
        .resButton:hover {
            background-color: #0056b3;
            color: white;
        }
        .review-section {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .gradeimg {
            width: 30px;
            height: 36px;
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
            width: 30%;
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

.in4 {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 20px;
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 70%;
    box-sizing: border-box;
    margin: 20px auto;
}

.inner8, .inner9, .inner10, .inner11 {
    padding: 10px;
    text-align: center;
}

.inner-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.roomimg, .gradeimg {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
    margin-bottom: 10px;
}

.inner10 p img, .inner11 p{
    background-color: #f9f9f9;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    font-size: 0.8rem;
}
.inner10 {
    display: flex; /* flexbox를 사용하여 img와 p 태그를 한 줄로 만듭니다. */
    align-items: center; /* img와 p 태그를 수직으로 중앙 정렬합니다. */
    gap: 10px; /* img와 p 태그 사이의 간격을 조절합니다. */
}

.gradeimg {
    width: 30px;
    height: 32px;
}




    </style>
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

    </script>
    <script>
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
    </script>

    <script>
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
        $("#reservationModal").show();
    });
    $("#reservationModal .close").click(function(){
        $("#reservationModal").hide();
    });

    // 모달 창 외부 클릭 감지
    $(document).click(function(event) {
        var target = $(event.target);
        if (!target.closest("#myModal .modal-content").length && !target.closest(".mainimg").length) {
            $("#myModal").hide();
        }
        if (!target.closest("#reservationModal .modal-content").length && !target.closest(".resButton").length) {
            $("#reservationModal").hide();
        }
    });
});

    </script>
    
    <!-- 결제하기 -->

    <script>
        document.addEventListener("DOMContentLoaded", function() {
    var paymentButton = document.getElementById("paymentButton");
    paymentButton.addEventListener("click", function() {
        var contextPath = "${contextPath}"; // JSP에서 contextPath를 가져옵니다.
        window.location.href = contextPath + "/user/payment.do"; // 페이지를 리디렉션합니다.
    });
});

    </script>
</head>
<body>
<div class="hotel-container">
    <!-- 1번방 -->
    <div class="hotel-card">
        <img class="mainimg" src="${contextPath}/resources/images/mainproduct_img.png"/>
        <div class="room-details">
            <div class="room-info">
                <h3>1번방</h3>
                <p>입실시간: {ㅇㅇ}</p>
                <p>퇴실시간: {ㅇㅇ}</p>
                <p>대실가격: {ㅇㅇ}</p>
                <input type="button" class="resButton" value="대실 예약하기">
            </div>
            <div class="room-info">
                <h3>1번방</h3>
                <p>입실시간: {ㅇㅇ}</p>
                <p>퇴실시간: {ㅇㅇ}</p>
                <p>숙박가격: {ㅇㅇ}</p>
                <input type="button" class="resButton" value="숙박 예약하기">
            </div>
        </div>
    </div>
    <!-- 2번방 -->
    <div class="hotel-card">
        <img class="mainimg" src="${contextPath}/resources/images/mainproduct_img.png"/>
        <div class="room-details">
            <div class="room-info">
                <h3>2번방</h3>
                <p>입실시간: {ㅇㅇ}</p>
                <p>퇴실시간: {ㅇㅇ}</p>
                <p>대실가격: {ㅇㅇ}</p>
                <input type="button" class="resButton" value="대실 예약하기">
            </div>
            <div class="room-info">
                <h3>2번방</h3>
                <p>입실시간: {ㅇㅇ}</p>
                <p>퇴실시간: {ㅇㅇ}</p>
                <p>숙박가격: {ㅇㅇ}</p>
                <input type="button" class="resButton" value="숙박 예약하기">
            </div>
        </div>
    </div>
</div>

<!-- 별점 -->
<div class="in4">
    <div class="inner-row">
        <div class="inner8">
            <img class="roomimg" src="${contextPath}/resources/images/subimg3.jpg">
        </div>
        
    </div>
    <div class="inner10">
        <p>닉네임: {nickname}</p>
        <img class="gradeimg" src="${contextPath}/resources/images/grade.png">
        <img class="gradeimg" src="${contextPath}/resources/images/grade.png">
        <img class="gradeimg" src="${contextPath}/resources/images/grade.png">
    </div>
    
    <div class="inner11">
        <p>내용: {content}</p>
    </div>
</div>


<!-- 모달 창 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="carousel-wrapper">
            <div class="carousel">
              <img class="carousel_item" src="${contextPath}/resources/images/subimg1.jpg"/>
              <img class="carousel_item" src="${contextPath}/resources/images/subimg2.jpg"/>
              <img class="carousel_item" src="${contextPath}/resources/images/subimg3.jpg"/>
              <img class="carousel_item" src="${contextPath}/resources/images/subimg4.jpg"/>
              
      
              <div class="carousel_button--next"></div>
              <div class="carousel_button--prev"></div>
            </div>
          </div>
    </div>
</div>

<!-- 예약 모달 창 -->
<div id="reservationModal" class="resmodal">
    <div class="miniModal-content">
        <span class="close">&times;</span>
        <h3>Title</h3>
        <p>내용</p>
        <div class="button-container">
            <input type="button" class="resButton" value="장바구니 담기">
            <input type="button" class="resButton" id="paymentButton" value="결제하기">
        </div>
    </div>
</div>


</body>
</html>
