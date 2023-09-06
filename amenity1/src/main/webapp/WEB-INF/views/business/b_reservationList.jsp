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
<title>b_reservationList</title>

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
        text-decoration: none;
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
        <c:forEach items="${myCompany}" var="company">
            uniqueCompanies.add("${company}");
        </c:forEach>
        
        uniqueCompanies.forEach(function(company) {
            $('#selectCompany').append($('<option>', {
                value: company,
                text: company
            }));
        });
        
        // select 요소 변경 이벤트 처리
        $("#selectCompany").on("change", function(){
            var selectedCompany = $(this).val();
            
            // 예약 정보를 테이블에 표시
            $('table tbody').empty();

            <c:if test="${empty myResList}">
                // 예약 정보가 없는 경우 메시지 표시
                $('table tbody').append(`
                    <tr>
                        <td colspan="9">등록된 상품이 없습니다.</td>
                    </tr>
                `);
            </c:if>
            
            <c:forEach items="${myResList}" var="myRes">
                if ("${myRes.company}" === selectedCompany) {
                    $('table tbody').append(`
                        <tr>
                            <td>${myRes.u_id}</td>
                            <td>${myRes.name}</td>
                            <td>${myRes.checkIn}</td>
                            <td>${myRes.checkOut}</td>
                            <td>${myRes.resdate}</td>
                            <td>${myRes.resform}</td>
                            <td>${myRes.checkInTime}</td>
                            <td>${myRes.checkOutTime}</td>
                            <td>${myRes.price}</td>
                        </tr>
                    `);
                }
            </c:forEach>
        });
    });
</script>
</head>

<body>
    <section>
        <form name="b_reservationList" method="post" enctype="multipart/form-data">
            <div>
                <h1>예약현황 조회</h1>
                <tr>
                    <td>조회할 사업장 선택</td>
                </tr>
                <select name="selectCompany" id="selectCompany">
                </select>
                <table>
                    <thead>
                        <tr>
                            <th>예약자 아이디</th>
                            <th>예약자명</th>
                            <th>이용시작 일자</th>
                            <th>이용종료 일자</th>
                            <th>예약신청 날짜</th>
                            <th>이용형태</th>
                            <th>체크인 예정시간</th>
                            <th>체크아웃 예정시간</th>
                            <th>가격</th>
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
