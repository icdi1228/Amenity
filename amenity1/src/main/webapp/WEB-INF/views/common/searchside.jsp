<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h3 {
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
    </style>
    <script>
        function count(type) {
            const resultElement = document.getElementById('result');
            let number = resultElement.innerText;
            if(type === 'plus') {
                number = parseInt(number) + 1;
            } else if(type === 'minus')  {
                number = parseInt(number) - 1;
            }
            resultElement.innerText = number;
        }

        $(document).ready(function(){
            $("input[name='slider']").change(function(){
                $(".result").val($(this).val());
            });
        });
    </script>
</head>
<body>
    <div class="filter-container">
        <form>
            <!-- 날짜 필터 -->
            <h3>날짜</h3>
            <input type=date name=""> <input type=date name="">
            <hr>
            <!-- 인원 필터 -->
            <h3 class="inline">인원</h3>
            <input class="inline" type='button' onclick='count("minus")' value='-'/> 
            <div class="inline" id='result'>0</div>
            <input type='button' onclick='count("plus")' value='+'/><br>
            <!-- 가격 필터 -->
            <h3>가격</h3>
            <input type="range" name="slider" for="result" value="10000" min="10000" max="1000000" step="10000" onchange="result.value=slider.value">
            <br>
            <input class="result" name="result" for="slider" onchange="slider.value=result.value">
            <!-- 거리 필터 -->
            <h3>거리</h3>
            <select name="range">
              <option value="1">1Km이내</option><br><br>
              <option value="2">5Km이내</option><br><br>
              <option value="3">10Km이내</option><br><br>
              <option value="4">50Km이내</option><br><br>
              <option value="5">100Km이내</option><br><br>
              <option value="6">200Km이내</option><br><br>
              <option value="7">300Km이내</option><br><br>
            </select>
            <!-- 별점 필터 -->
            <h3>별점</h3>
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
            <a class="box2" onclick="document.forms[0].submit();">적용</a>
        </form>
    </div>
</body>
</html>
