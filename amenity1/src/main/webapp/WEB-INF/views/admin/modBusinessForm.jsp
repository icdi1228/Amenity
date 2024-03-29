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
}

.ad_no {
	width: 30%;
	height: 38px;
}


</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ee5742af74aeabb95a5010509d6933c&libraries=services"></script>
<script type="text/javascript"> 

// 이메일 뒷 형식 수정함 
  function changeEmailDomain() {
    var emailSelect = document.getElementsByName("emailSelect")[0];
    var email2 = document.getElementsByName("email2")[0];

    if(emailSelect.value === "custom") {
        email2.readOnly = false;
        email2.value = "";
    } else {
        email2.readOnly = true;
        email2.value = emailSelect.value;
    }
}

// 주소 가져오기
function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
			var addr = data.address;
			
            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("new_addr1").value = addr;
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

function changeEmail() {
	var h_em = document.getElementById('h_em');
    
    var isDisplayed = h_em.style.display !== 'none';

    h_em.style.display = isDisplayed ? 'none' : '';
}

function com_add(){
	var address1 = document.getElementById('new_addr1').value;
	var address2 = document.getElementById('new_addr2').value;

	var address = address1 + " " + address2;

	var addreInput = document.getElementById('addre');
    addreInput.readOnly = false;
    addreInput.value = address;
    addreInput.readOnly = true;

	changeAddress();
}

function com_email(){
	var ema1 = document.getElementById('email1').value;
	var ema2 = document.getElementById('email2').value;

	var email = ema1 + "@" + ema2;

	var addreInput = document.getElementById('emai');

    addreInput.readOnly = false;
    addreInput.value = email;
    addreInput.readOnly = true;

	changeEmail();
}

</script>
<title>userModForm</title>
</head>
<body>

	<form class="form" name="nbinfo" method="post" action="${contextPath}/admin/b_InfoUpdate.do"
		enctype="multipart/form-data" onsubmit="return combineEmail()">

		<h1 style="text-align: center">기업정보 수정</h1>
		<h4 style="text-align: right">관리자 수정모드</h4>
		<table border="0" align="center">
			<tr>
				<td class="td1" align="right">사업자 등록번호</td>
				<td class="td2" align="center">
					<input class="test" type="text" size="20" maxlength="10" name="b_no" value="${businessVO.b_no}" readonly="readonly" />
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">비밀번호</td>
				<td class="td2" align="center">
          			<input type="text" name="b_pw" value="${businessVO.b_pw}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">기 업 명</td>
				<td class="td2" align="center">
          			<input type="text" name="name" value="${businessVO.name}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">주 소</td>
				<td class="td2" align="center">
          			<input type="text" id="addre" name="addr" value="${businessVO.addr}" readonly="readonly"/>
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

			<tr>
				<td class="td1" align="right">계좌번호</td>
				<td class="td2" align="center">
          			<input type="text" name="account" value="${businessVO.account}"/>
				</td>
			</tr>

			<tr>
				<td class="td1" align="right">전화번호</td>
				<td class="td2" align="center">
		          <input type="text" class="m_tel" name="tel1" id="tel" value="${businessVO.tel1}" /> - 
		          <input type="text" class="m_tel" name="tel2" id="tel" value="${businessVO.tel2}" /> - 
		          <input type="text" class="m_tel" name="tel3" id="tel" value="${businessVO.tel3}" />
          		</td>
			</tr>

   
			<tr>
				<td class="td1" align="right">이 메 일</td>
				<td class="td2" align="center">
					<input type="text" id="emai" name="email" value="${businessVO.email}" readonly="readonly"/>	
				</td>
				<td><input type="button" class="f_add" value="이메일 변경" onclick="changeEmail()"></td>
			</tr>

			<tr id="h_em" style="display: none;">
				<td class="td1" align="right">이메일 수정</td>
				<td class="td2">	
					<input type="text" class="m_email1" name="email1" id="email1" value="${emailLocalPart}" /> 
					@
					<input type="text" class="m_email2" name="email2" id="email2" value="${emailDomain}" /> 
					<select name="emailSelect" id="chemail" onchange="changeEmailDomain();">
						<option value="custom" selected>직접입력</option>
					   	<option value="naver.com">naver.com</option>
					   	<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
				  	</select>
				</td>
				<td><input type="button" class="f_add" value="작성완료" onclick="com_email()"></td>
			</tr>

			<tr>
				<td><br></td>
				<td><br></td>
			</tr>

			<tr>
				<td align="center"></td>
				<td align="center">
					<button type="button" style="width: 150px; height: 30px;" onclick="location.href='${contextPath}/admin/businessList.do'">뒤로가기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" style="width: 150px; height: 30px;">수정하기</button>
				<td>				
			</tr>
		</table>

	</form>
</body>
</html>
