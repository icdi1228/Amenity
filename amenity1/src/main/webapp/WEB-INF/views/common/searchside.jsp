<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 20px;
  }

  h4 {
    margin-top: 20px;
    margin-bottom: 10px;
  }

  .filter-container {
    background: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
  }

  .filter-item-react img {
    width: 20px;
    height: 20px;
  }

  .filter-item-react {
    padding: 5px 0;
    cursor: pointer;
    display: flex;
    align-items: center;
  }

  .box, .box2 {
    display: inline-block;
    padding: 10px 20px;
    margin: 10px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    color: #f4f4f4;
    border-radius: 5px;
  }

  .box {
    background-color: #555;
  }

  .box2 {
    background-color: #ff5252;
  }

  .box:hover {
    background-color: #666;
  }

  .box2:hover {
    background-color: #ff6161;
  }

  input[type="date"], input[type="range"], select {
    width: 100%;
    padding: 5px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="button"] {
    background-color: #555;
    border: none;
    color: #f4f4f4;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
  }

  input[type="button"]:hover {
    background-color: #666;
  }

  .result {
    background-color: #f4f4f4;
    border: 1px solid #ccc;
    color: #333;
    padding: 5px;
    width: 100%;
    border-radius: 5px;
  }

  .filter-item-info {
    display: flex;
    align-items: center;
  }

  .ficon {
    margin-right: 5px;
  }

  .people_count {
    text-align: center; 
    margin-bottom: 10px; 
  }

  .abs {
    display: inline-block;
    vertical-align: middle;
  }

  .btn_con {
    display: flex;
    justify-content: center; 
    align-items: center;
    margin: 0 auto;
    width: fit-content;
  }

  .btn_con input {
    margin: 0 20%;
  }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

// 인원수 + - 함수
  function count(type) {
    const resultElement = document.getElementById('result');
    let number = resultElement.innerText;

    if(type === 'plus') {
      number = parseInt(number) + 1;
    } 

    else if(type === 'minus') {
      if(number > 0){
        number = parseInt(number) - 1;
      }
      else {
        number = 0;
      }
    }
    resultElement.innerText = number;
  }

  // 가격 슬라이더
  $(document).ready(function(){
    $("input[name='slider']").change(function(){
      $(".result").val($(this).val());
    });
  });

  /*
  // 적용 버튼 클릭시 이건 셀릭트바 
  $(document).ready(function(){

    $(".apply-button").click(function(e){
      e.preventDefault(); // 다른이벤트 동작 정지

      // 옵션 설정
      const selectedRating = parseInt($("#selected-rating").val());
      console.log(selectedRating);

      // 옵션 추가
      
      $("#list li").each(function(){
        const listItem = $(this);
        const listItemGrade = parseInt(listItem.data("grade"));

        if(listItemGrade == selectedRating) {
          listItem.show();
        }
        else {
          listItem.hide();
        }
      });
    });
  });
  */

  // 이건 체크박스
  $(document).ready(function(){

    $(".apply-button").click(function(e){
      e.preventDefault();

    // 옵션 설정
    const selectedRatingFilters = [];

    $("input[name='rating-filter']:checked").each(function() {
      selectedRatingFilters.push(parseInt($(this).val()));
    });

    // 옵션 추가
    $("#list li").each(function(){
      const listItem = $(this);
      const listItemGrade = parseInt(listItem.data("grade"));

      if (selectedRatingFilters.length === 0 || selectedRatingFilters.includes(listItemGrade)) {
        listItem.show();
      } 
      else {
        listItem.hide();
      }
    });
  });
});


</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ee5742af74aeabb95a5010509d6933c"></script>
<script>
  window.onload=function currentLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude; // 위도
			  var lon = position.coords.longitude; // 경도
        document.getElementById("latitude").value = lat;
        document.getElementById("longitude").value = lon;
      });
    }else{
      message = "error 위치를 알 수 없습니다.";
    }
  }
</script>
</head>
<body>
  <div class="filter-container">
    <form action="${contextPath}/main/detailSearch.do">
    
    <!-- 날짜 필터 -->
    <div>
      <h4>날  짜</h4>
      <div class="con">
        <input type="date" name="checkin" >
        <input type="date" name="checkout" >
      </div>
    </div>

    <hr>
    <!-- 인원 필터 -->
    <div>
      <h4 class="people_count">인  원</h4>
      <div class="btn_con">
        <input class="abs" type='button' onclick='count("minus")' value='-'/> 
        <div class="abs" id='result'> 0 </div>
        <input class="abs" type='button' onclick='count("plus")' value='+'/><br>
      </div>
    </div>
    
    <!-- 가격 필터 -->
    <h4>가  격</h4>
    <input type="range" name="price" for="result" value="10000" min="10000" max="1000000" step="10000" onchange="result.value=slider.value">
    <br>
    <input class="result" name="result" for="slider" onchange="slider.value=result.value">

            <!-- 거리 필터 -->
            <h4>거  리</h4>
            <select name="distance">
              <option value="1">1Km이내</option><br><br>
              <option value="2">2Km이내</option><br><br>
              <option value="5">5Km이내</option><br><br>
              <option value="10">10Km이내</option><br><br>
              <option value="50">50Km이내</option><br><br>
              <option value="100">100Km이내</option><br><br>
              <option value="200">200Km이내</option><br><br>
              <option value="300">300Km이내</option><br><br>
            </select>
            <!-- 별점 필터 -->
            <h4>별  점</h4>
            <div class="filter-items" role="group" aria-labelledby="filter-menu-StarRating">
            
              <div class="filter-items" role="group" aria-labelledby="filter-menu-StarRating">
                <ul class="list-filter__items filter-list-item">
                  <li class="filter-item-react">
                    <span tabindex="0" class="filter-item-info StarRating-5 " data-component="search-filter-starrating" data-element-name="search-filter-starrating" data-element-index="0" data-element-value="5" data-is-selected="false" data-recommendation_type="-1" aria-label=" 5-성급 " role="checkbox" aria-checked="false">
                      <span>
                        <input type="checkbox" aria-labelledby="list-filter-item-label-0"><span class="checkbox-icon" role="checkbox" aria-label="list-filter-item-label-0" aria-checked="false"></span>
                      </span>
                    
                      <span class="filter-item-body">
                        <span class="fiteritem-prefix">
                          <span><i class="ficon ficon-star-5 star-orange"></i></span>
                          <c:forEach var="i" begin="1" end="5">
                            <img src="${pageContext.request.contextPath}/resources/images/grade.png" alt="별 이미지">
                          </c:forEach>
                        </span>
              
                        <span>
                          <span class="filter-item-content" data-selenium="filter-item-text"></span>		
                        </span>
                      </span>
                    </span>
                  </li>
              
                  <li class="filter-item-react">
                    <span tabindex="0" class="filter-item-info StarRating-4 " data-component="search-filter-starrating" data-element-name="search-filter-starrating" data-element-index="1" data-element-value="4" data-is-selected="false" data-recommendation_type="-1" aria-label=" 4-성급 " role="checkbox" aria-checked="false">
                      <span>
                        <input type="checkbox" aria-labelledby="list-filter-item-label-1"><span class="checkbox-icon" role="checkbox" aria-label="list-filter-item-label-1" aria-checked="false"></span>
                      </span>
              
                      <span class="filter-item-body">
                        <span class="fiteritem-prefix">
                          <span><i class="ficon ficon-star-4 star-orange"></i></span>
                          <c:forEach var="i" begin="1" end="4">
                            <img src="${pageContext.request.contextPath}/resources/images/grade.png" alt="별 이미지">
                          </c:forEach>
                        </span>
              
                        <span>
                          <span class="filter-item-content" data-selenium="filter-item-text"></span>
                        </span>
                      </span>
                    </span>
                  </li>
              
                  <li class="filter-item-react">
                    <span tabindex="0" class="filter-item-info StarRating-3 " data-component="search-filter-starrating" data-element-name="search-filter-starrating" data-element-index="2" data-element-value="3" data-is-selected="false" data-recommendation_type="-1" aria-label=" 3-성급 " role="checkbox" aria-checked="false">
                      <span>
                        <input type="checkbox" aria-labelledby="list-filter-item-label-2"><span class="checkbox-icon" role="checkbox" aria-label="list-filter-item-label-2" aria-checked="false"></span>
                      </span>
              
                      <span class="filter-item-body">
                        <span class="fiteritem-prefix">
                          <span><i class="ficon ficon-star-3 star-orange"></i></span>
                          <c:forEach var="i" begin="1" end="3">
                            <img src="${pageContext.request.contextPath}/resources/images/grade.png" alt="별 이미지">
                          </c:forEach>
                        </span>
              
                        <span>
                          <span class="filter-item-content" data-selenium="filter-item-text"></span>
                        </span>
                      </span>
                    </span>
                  </li>
              
                  <li class="filter-item-react">
                    <span tabindex="0" class="filter-item-info StarRating-2 " data-component="search-filter-starrating" data-element-name="search-filter-starrating" data-element-index="3" data-element-value="2" data-is-selected="false" data-recommendation_type="-1" aria-label=" 2-성급 " role="checkbox" aria-checked="false">
                      <span>
                        <input type="checkbox" aria-labelledby="list-filter-item-label-3"><span class="checkbox-icon" role="checkbox" aria-label="list-filter-item-label-3" aria-checked="false"></span>
                      </span>
              
                      <span class="filter-item-body">
                        <span class="fiteritem-prefix">
                          <span><i class="ficon ficon-star-2 star-orange"></i></span>
                          <c:forEach var="i" begin="1" end="2">
                            <img src="${pageContext.request.contextPath}/resources/images/grade.png" alt="별 이미지">
                          </c:forEach>
                        </span>
                  
                        <span>
                          <span class="filter-item-content" data-selenium="filter-item-text"></span>
                        </span>
                      </span>
                    </span>
                  </li>
              
                  <li class="filter-item-react">
                    <span tabindex="0" class="filter-item-info StarRating-1 " data-component="search-filter-starrating" data-element-name="search-filter-starrating" data-element-index="4" data-element-value="1" data-is-selected="false" data-recommendation_type="-1" aria-label=" 1-성급 " role="checkbox" aria-checked="false">
                      <span>
                        <input type="checkbox" aria-labelledby="list-filter-item-label-4"><span class="checkbox-icon" role="checkbox" aria-label="list-filter-item-label-4" aria-checked="false"></span>
                      </span>
              
                      <span class="filter-item-body">
                        <span class="fiteritem-prefix">
                          <span><i class="ficon ficon-star-1 star-orange"></i></span>
                          <c:forEach var="i" begin="1" end="1">
                            <img src="${pageContext.request.contextPath}/resources/images/grade.png" alt="별 이미지">
                          </c:forEach>
                        </span>
              
                        <span>
                          <span class="filter-item-content" data-selenium="filter-item-text"></span>
                        </span>
                      </span>
                    </span>
                  </li>
                </ul>
              </div>

            </div>
            <a class="box" onclick="document.forms[0].reset();">초기화</a>
            <input type="submit" value="적용">
        </form>
    </div>
</body>
</html>
