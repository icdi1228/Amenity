<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"	/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>리뷰작성</title>
</head>
<body>
<h1 style="text-align:center">리뷰작성</h1>
<form name="reviewForm" method="post" action="${contextPath}/user/writeReview.do" enctype="multipart/form-data">
	<table border="0" align="center">
		<tr>
			<td align="right">작성자: </td>
			<td colspan="2" align="left"><input type="text" size="20" maxlength="100" value="${user.nickname}" readonly	/></td>
		</tr>
		<tr>
			<td align="right">글제목: </td>
			<td colspan="2"><input type="text" size="67" maxlength="500" name="title"	/></td>
		</tr>
		<tr>
			<td align="right" valign="top">리뷰내용: </td>
			<td colspan="2"><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
		</tr>
		<tr>
			<td align="right" valign="top">별점: </td>
            <td colspan="2"><div class="filter-items" role="group" aria-labelledby="filter-menu-StarRating">
            
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

            </div></td>
		</tr>
		<tr>
			<td colspan="4"><div id="d_file"></div></td>
		</tr>
		<tr>
			<td align="right"></td>
			<td colspan="2">
				<input type="submit" value="글쓰기"	/>
				<input type="button" value="목록보기" onClick="backToList(this.form)"	/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>