<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	color: #333;
	margin: 0;
	padding: 20px;
}

.form {
	background: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	width: 100%;
	height: 80%;
	margin: auto;
}

td {
	margin-bottom: 5px;
}

td.td1 {
	height: 45px;
}

.td1 {
	padding: 5px;
	width: 21%;
}

.td2 {
	padding: 5px;
	width: 60%;
}

input[type="text"] {
	text-align: center;
    width: 100%;
    box-shadow: 5px;
    padding: 5px;
}

input[type="text"].m_tel {
    width: 30%;
}

input[type="text"].m_email1,
input[type="text"].m_email2,
input[type="text"].m_addr {
    width: 35%;
}

select#chemail {
	text-align: center;
    width: 22%; 
    height: 38px; 
}

input#new_addr1 {
	width: 68%;
}

.f_add { 
	width: 80%;
	height: 38px;
	text-align: center;
}

.ad_no {
	width: 30%;
	height: 38px;
}

#de_content {
	width: 100%;
	height: 250px;
}

#cat {
	width:68%;
	height: 38px;
}

#cate {
	width:30%;
	height: 38px;
	padding-top: 3px;
	text-align: center;
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ee5742af74aeabb95a5010509d6933c&libraries=services"></script>
<title>userModForm</title>
</head>
<body>

	<form class="form" name="cpinfo" method="post" action="${contextPath}/admin/c_InfoUpdate.do"
		enctype="multipart/form-data">

		<h1 style="text-align: center">기업정보 수정</h1>
		<h4 style="text-align: right">관리자 수정모드</h4>
		<table border="0" align="center">

			<tr>
				<td class="td1" align="right">번호</td>
				<td class="td2" align="center">
          			<input type="text" name="c_no" value="${companyVO.c_no}"/>
				</td>
			</tr>


			<tr>
				<td class="td1" align="right">사업자 등록번호</td>
				<td class="td2" align="center">
					<input class="test" type="text" name="b_no" value="${companyVO.b_no}" readonly="readonly" />
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">업 체 명</td>
				<td class="td2" align="center">
          			<input type="text" name="company" value="${companyVO.company}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">분 류</td>
				<td class="td2" align="center">
          			<input id="cat" type="text" name="category" value="${companyVO.category}" readonly="readonly"/>
					<select name="cate" id="cate">
						<option value="없음">없음</option>
						<option value="호텔">호텔</option>
						<option value="모텔">모텔</option>
						<option value="캠핑">캠핑</option>
						<option value="풀빌라">풀빌라</option>
					</select>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">설 명</td>
				<td class="td2" align="center">
					<textarea id="de_content" name="detail" rows="4">${companyVO.detail}</textarea>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">주 소</td>
				<td class="td2" align="center">
          			<input type="text" id="location" name="location" value="${companyVO.location} ${companyVO.locationdetail}" readonly="readonly"/>
				</td>
				<td> <input type="button" class="f_add" value="주소 변경" onclick="changeAddress()"></td>
			</tr>

			<tr id="h_ad1" style="display: none;">
				<td class="td1" align="right">주소 수정</td>
				<td class="td2" align="center">
          			<input id="new_addr1" type="text" name="b_address1" />
					<input type="button" class="ad_no" onclick="sample5_execDaumPostcode()" value="주소 찾기"/>
				</td>
			</tr>

			<tr id="h_ad2" style="display: none;">
				<td class="td1" align="right"></td>
				<td class="td2" align="center">
          			<input id="new_addr2" type="text" name="b_address2" placeholder="상세주소를 입력해 주세요" />
				</td>
				<td><input class="f_add" type="button" value="작성완료" onclick="com_add()"></td>
			</tr>

			<tr id="h_ad2" style="display: none;">
				<td class="td1" align="right">위도</td>
				<td class="td2" align="center">
					<input type="text" id="latitude" name="latitude">
				</td>
				<td></td>
			</tr>

			<tr id="h_ad2" style="display: none;">
				<td class="td1" align="right">경도</td>
				<td class="td2" align="center">
					<input type="text" id="longitude" name="longitude">
				</td>
				<td></td>
			</tr>

			<tr>
				<td class="td1" align="right">별 점</td>
				<td class="td2" align="center">
          			<input type="text" name="grade" value="${companyVO.grade}" readonly="readonly"/>
				</td>
			</tr>

			<tr>
				<td><br></td>
				<td><br></td>
			</tr>

			<div class="form-group">
                <div id="map" style="width:100%;height:300px;display:none"></div>
              </div>

			<tr>
				<td align="center"></td>
				<td align="center">
					<button type="button" style="width: 150px; height: 30px;" onclick="location.href='${contextPath}/admin/companyList.do'">뒤로가기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" style="width: 150px; height: 30px;">수정하기</button>
				<td>				
			</tr>
		</table>

	</form>
</body>
<script type="text/javascript"> 

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level: 5 // 지도의 확대 레벨
	};
	
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();

	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.537187, 127.005476),
		map: map
	});
	
	// 주소 가져오기
	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = data.address;
				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("new_addr1").value = addr;
	
				geocoder.addressSearch(data.address, function(results, status) {
					if (status === daum.maps.services.Status.OK){
						var result = results[0];
						var coords = new daum.maps.LatLng(result.y, result.x);
						
						document.getElementById("latitude").value = result.y;
						document.getElementById("longitude").value = result.x;

					}
				}); 
			}
		}).open();
		close();
	}
	
	function changeAddress() {
		var h_ad1 = document.getElementById('h_ad1');
		var h_ad2 = document.getElementById('h_ad2');
		
		var isDisplayed = h_ad1.style.display !== 'none';
	
		h_ad1.style.display = isDisplayed ? 'none' : '';
		h_ad2.style.display = isDisplayed ? 'none' : '';
	}
	
	function com_add(){
		var address1 = document.getElementById('new_addr1').value;
		var address2 = document.getElementById('new_addr2').value;
	
		var address = address1 + " " + address2;
	
		var addreInput = document.getElementById('location');
		addreInput.readOnly = false;
		addreInput.value = address;
		addreInput.readOnly = true;
	
		changeAddress();
	}
	
	function updateCategory() {
    var selectedCategory = document.getElementById("cate").value; // 선택한 옵션 값 가져오기
    document.getElementById("cat").value = selectedCategory; // 선택한 값으로 cat input 업데이트
	}
	document.getElementById("cate").addEventListener("change", updateCategory);
	</script>
</html>
