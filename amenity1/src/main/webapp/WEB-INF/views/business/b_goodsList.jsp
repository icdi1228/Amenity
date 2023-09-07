<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b_goodsList</title>

<style>
    table { 
        border-collapse: collapse;
        width: 100%;
    }

    th, tr, td { 
        height: 50px;
        padding: 10px;
        border-bottom: 2px solid rgb(37, 88, 184);
    }

    a {
        text-decoration:none
    }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
    // 중복되지 않는 사업장 이름을 저장할 Set 생성
    var uniqueCompanies = new Set();
    
    // select 요소 초기화
    $('#selectCompany').empty();
    $('#selectCompany').append($('<option>', {
        value: '',
        text: '사업장을 선택하세요'
    }));
    
    // 사업장 목록을 가져와서 select 요소에 추가
    <c:forEach items="${myCompanyList}" var="company">
        uniqueCompanies.add("${company}");
    </c:forEach>
    
    uniqueCompanies.forEach(function(company) {
        $('#selectCompany').append($('<option>', {
            value: company,
            text: company
        }));
    });
    
    // 초기에 "사업장을 선택하세요" 메시지를 출력합니다.
    var $tbody = $('table tbody');
    $tbody.append(`
        <tr>
            <td colspan="9">사업장을 선택하세요.</td>
        </tr>
    `);
    
    // select 요소 변경 이벤트 처리
    $("#selectCompany").on("change", function(){
        var selectedCompany = $(this).val();
        
        // 상품 정보를 테이블에 표시하기 전에 tbody를 비웁니다.
        $tbody.empty();
        
        // 선택된 사업장이 비어있는지 확인
        if (!selectedCompany) {
            $tbody.append(`
                <tr>
                    <td colspan="9">사업장을 선택하세요.</td>
                </tr>
            `);
            return; // 선택된 사업장이 없으므로 함수 종료
        }

        var reservationFound = false; // 상품 정보가 있는지 여부를 나타내는 플래그
        
        <c:forEach items="${myGoodsList}" var="myGoods">
            if ("${myGoods.company}" === selectedCompany) {
                $tbody.append(`
               		<c:set var="count" value="1" />
       				<tr>
       					<td>${count}</td>
       					<td>${myGoods.company}</td>
       					<td>${myGoods.room}</td>
       					<td>${myGoods.price}</td>
       					<td>${myGoods.timeprice}</td>
       					<td>${myGoods.stdper}</td>
       					<td>${myGoods.detail}</td>
       					<td><a href="${contextPath}/business/b_modGoodsInList.do?g_no=${myGoods.g_no}">수정</a></td>
       					<td><a href="${contextPath}/business/deleteGoodsInList.do?g_no=${myGoods.g_no}">삭제</a></td>
       				</tr>
       				<c:set var="count" value="${count + 1}" />
                `);
                reservationFound = true; // 상품 정보가 있음을 표시
            }
        </c:forEach>

        // 상품 정보가 없는 경우 메시지 표시
        if (!reservationFound) {
            $tbody.append(`
                <tr>
                    <td colspan="9">등록된 상품이 없습니다.</td>
                </tr>
            `);
        }
    });
});


</script>

</head>

<body>
	<section>
		<form name="b_goodsList" method="post" enctype="multipart/form-data">
			<div>
				<h1>사업장 등록상품 목록</h1>
					<tr>
					<td>조회할 사업장 선택</td>
						<td>
						<select name="selectCompany" id="selectCompany">
						</select>
						<br>
							<table id="goodsTable">

							<thead>
								<tr>
									<th>No</th>
									<th>사업장명</th>
									<th>객실번호</th>
									<th>숙박 이용료</th>
									<th>대실 이용료</th>
									<th>투숙인원</th>
									<th>세부</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
							</table>
			</div>
		</form>
	</section>
</body>
</html>