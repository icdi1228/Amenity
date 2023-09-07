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
        <title>그래프</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function backToList(obj) {
		obj.action="${contextPath}/main/main.do";
		obj.submit();
	}
    function confirmDelete(obj) {
      var confirmation = confirm("정말로 회원 탈퇴하시겠습니까?"); // 확인 대화상자
  
      if (confirmation) {
        obj.action="${contextPath}/user/unsignUser.do";
		obj.submit();       
        return true;
      } else {        
        return false;
      }
    }


	function fn_enable(obj){
		document.getElementById("upw").disabled=false;
        document.getElementById("upw").style.backgroundColor="white";
		document.getElementById("tel1").disabled=false;
        document.getElementById("tel1").style.backgroundColor="white";
        document.getElementById("tel2").disabled=false;
        document.getElementById("tel2").style.backgroundColor="white";
        document.getElementById("tel3").disabled=false;
        document.getElementById("tel3").style.backgroundColor="white";
		document.getElementById("unickname").disabled=false;
        document.getElementById("unickname").style.backgroundColor="white";
        document.getElementById("tr_btn_modify").style.display="inline-block";
        document.getElementById("tr_btn_modify").style.textAlign="center";
		document.getElementById("tr_btn_modify1").style.display="inline-block";
        document.getElementById("tr_btn_modify2").style.display="inline-block";
		document.getElementById("tr_btn").style.display="none";
	}

    function fn_disable(obj){
		document.getElementById("upw").disabled=true;
        document.getElementById("upw").style.backgroundColor="#f5f5f5";
		document.getElementById("tel1").disabled=true;
        document.getElementById("tel1").style.backgroundColor="#f5f5f5";
        document.getElementById("tel2").disabled=true;
        document.getElementById("tel2").style.backgroundColor="#f5f5f5";
        document.getElementById("tel3").disabled=true;
        document.getElementById("tel3").style.backgroundColor="#f5f5f5";
		document.getElementById("unickname").disabled=true;
        document.getElementById("unickname").style.backgroundColor="#f5f5f5";
		document.getElementById("tr_btn_modify1").style.display="none";
        document.getElementById("tr_btn_modify2").style.display="none";
		document.getElementById("tr_btn").style.display="inline-block";
        document.getElementById("tr_btn").style.textAlign="center";
	}


	function fn_modify_myInfo(obj) {
		obj.action="${contextPath}/user/updateInfo.do";
		obj.submit();
	}
</script>


        <style>
          body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    #tr_btn_modify1,
    #tr_btn_modify2 {
        display: none;
    }

    #tr_btn_modify {
        display: none;
    }

    .container {
        display: flex;
        justify-content: center;
        margin: 0 auto;
        padding: 20px;
        width:auto;

    }



    .ares,
    .hd button,.btn-primary2 {
        display: inline-block;
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s;
    }

    .btn-primary2 {
        margin-top: 20px;
        background-color: #ff000de8;
        color: #fff;
        border: none;
    }

    .ares {
        margin-top: 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
    }



    .ares:hover,
    .hd button:hover,
    .edit-btn:hover {
        background-color: #0056b3;
    }

    .btn-primary2:hover {
      background-color:rgb(189, 0, 0);
   
    }





    th {
        padding: 20px;
    }

    #tel1,
    #tel2,
    #tel3 {
        width: 70px;
    }

    .left-section {
        width: 70%;
        padding: 20px;
        background-color: #f5f5f5;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        float:left;
    }

    .right-section {
        width: 30%;
        padding: 20px;
        background-color: #f5f5f5;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        float:right;
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
          #tab1,#tab2,#tab3,#tab4 {
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
        #tab3:checked ~ #content3,
        #tab4:checked ~ #content4 {
            display: block;}

.resButton{
  width:100%;
  height:100%;
  margin-top:10%;
}   
#m-tb{
    width:auto;
    float:left;

}
table{
    margin-top:200px;
    
}

#m-h2{
    margin:30px;
}

#container3{
    display: inline-block;
}

#currentM{
    float:right;
    margin:50px;
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

 


        </style>
<!-- 페이징 선언부분 -->
<c:set var="totalItems" value="${totalMyMile}" /> 
<c:set var="itemsPerPage" value="10" />
<c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
<c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />

    </head>
    <body>

 <div class="main">

            <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
            <label for="tab1">개인 정보</label>
        
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">내 쿠폰함</label>

            <input id="tab3" type="radio" name="tabs">
            <label for="tab3">내 마일리지</label>

            <input id="tab4" type="radio" name="tabs">
            <label for="tab4">내 찜목록</label>
                    


<!-- 나의 개인정보-->

    <section id="content1">
      <div class="container">
              <div class="inner-div1">
                  <div class="hd">
                      <form name="u_myInfo" method="post" action="${contextPath}/user/unsignUser.do">
                          <div class="left-section">
                            <!-- 사용자 정보 수정 내용 -->
                            <table align="center" class="atb">
                              <tr align="center" class="atr">
                                <th width="200"><b>아이디</b></th>
                                <th width="300">
                                    <input style="border:none;background-color:#f5f5f5" type="text" name="u_id1" value="${userVO.u_id}" disabled/>
                                    <input type="hidden" name="u_id" value="${userVO.u_id}"/>
                                </th>
                            </tr>
                            <tr align="center">
                                <th width="150"><b>이름</b></th>
                                <th width="150">
                                    <input style="border:none;background-color:#f5f5f5" type="text" name="name1" value="${userVO.name}" disabled />
                                    <input type="hidden" name="name" value="${userVO.name}"/>
                                </th>
                            </tr>
                            <tr align="center">
                                <th width="150"><b>닉네임</b></th>
                                <th width="150">
                                    <input style="border:none;background-color:#f5f5f5" type="text" name="nickname" id="unickname" value="${userVO.nickname}" disabled/>
                                </th>
                            </tr>
                            <tr align="center">
                                <th width="150"><b>비밀 번호</b></th>
                                <th width="150">
                                    <input style="border:none;background-color:#f5f5f5" type="text" id="upw" name="u_pw" value="${userVO.u_pw}" disabled/>
                                </th>
                            </tr>
                            <tr align="center">
                                <th width="150"><b>이메일</b></th>
                                <th width="150">
                                    <input style="border:none;background-color:#f5f5f5" type="text" name="email1" value="${userVO.email}" disabled />
                                    <input type="hidden" name="email" value="${userVO.email}"/>
                                </th>
                            </tr>
                            <tr align="center">
                                <th width="150"><b>전화 번호</b></th>
                                <th width="400">
                                    <input style="border:none;background-color:#f5f5f5" type="text" name="tel1" id="tel1"  value="${userVO.tel1}" disabled />
                                    -<input style="border:none;background-color:#f5f5f5" type="text" name="tel2" id="tel2" value="${userVO.tel2}" disabled />
                                    -<input style="border:none;background-color:#f5f5f5" type="text" name="tel3" id="tel3" value="${userVO.tel3}" disabled/>
                                </th>
                            </tr>
                            <tr align="center">
                                <th width="150"><b>생년월일</b></th>
                                <th width="150">
                                    <input style="border:none;background-color:#f5f5f5" type="text" name="birth"  value="${userVO.birth}" disabled/>
                                </th>
                            </tr>
                            <tr align="center">
                                <th width="150"><b>가입일</b></th>
                                <th width="150">
                                    <input style="border:none;background-color:#f5f5f5" type="text" name="credate"  value="${userVO.credate}" disabled/>
                                </th>
                            </tr>
                          </table>
                          <div id="tr_btn_modify">
                              <input id="tr_btn_modify1" class="ares" type="button" value="수정반영하기" onClick="fn_modify_myInfo(this.form)">
                              <input id="tr_btn_modify2" class="ares" type="button" value="취소" onClick="return fn_disable(this.form)">
                          </div>
                          <input id="tr_btn" type="button" class="ares" value="정보 수정" onClick="fn_enable(this.form)" />
                          <input type="button" class="btn-primary2" value="회원 탈퇴" onclick="return confirmDelete(this.form);"/>
                          </div>
                        </form>
                      
                  </div>
              </div>
      </div>
  </section>

<!-- 나의 쿠폰함-->
  <section id="content2">
    <div class="container">
        <div class="row">
            <c:forEach var="coupon" items="${myCouponList}" varStatus="status">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="${contextPath}/user/couponDownload.do?imageName=${coupon.imagename}&amp;couponCode=${coupon.couponCode}" class="card-img-top" alt="쿠폰이미지반복">
                        <div class="card-body">
                            <h5 class="card-title">쿠폰 코드 : ${coupon.couponCode}</h5>
                            <c:choose>
                                <c:when test="${coupon.discountType eq 'PERCENTAGE'}">할인률 : ${coupon.discountValue} %</c:when>
                                <c:otherwise>할인 금액 : ${coupon.discountValue}</c:otherwise>
                            </c:choose>

                            <p class="card-text">발급 일자 : ${coupon.createdAt}</p>
                            <p class="card-text">유효 기간 : ${coupon.expiryDate}</p>
                            
                        </div>
                    </div>
                </div>
                <c:if test="${status.index % 3 == 2}">
                    </div><div class="row">
                </c:if>
            </c:forEach>
        </div>
    </div>

</section>


<!-- 나의 마일리지-->
<section id="content3">

    <div id="container3">

    <div class="table-responsive" id="m-tb">

        <h2 id="m-h2">나의 마일리지 변동 내역</h2>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>아이디</th>                    
                    <th>변동 마일리지</th>
                    <th>변동 내역</th>
                    <th>마일리지 잔액</th>                    
                    <th>마일리지 변동일</th>                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${myVarMile}" var="mile" varStatus="status">
                    <tr>
                        <td>${status.index+1}</td>
                        <td>${mile.u_id}</td>
                        <td>${mile.varmile}</td>
                        <td>${mile.varstate}</td>
                        <td>${mile.mileage}</td>
                        <td>${mile.vartime}</td>
                        <c:set var="currentMile" value="${mile.mileage}"/>                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="currentM">
        <p>나의 현재 마일리지 : ${currentMile}</p>
    </div>
</div>


<div class="d-flex justify-content-center mt-3">
    <ul class="pagination">

        <c:if test="${currentPage > 1}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage - 1}">이전</a>
            </li>
        </c:if>


        <c:forEach begin="1" end="${totalPages}" var="page">
            <li class="page-item ${page == currentPage ? 'active' : ''}">
                <a class="page-link" href="?page=${page}">${page}</a>
            </li>
        </c:forEach>


        <c:if test="${currentPage < totalPages}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage + 1}">다음</a>
            </li>
        </c:if>
    </ul>
</div>







</section>


<!-- 나의 찜목록-->
<section id="content4">


    <div class="product-company">
        <c:forEach items="${company}" var="company" varStatus="status">
        <div class="product-card">
          
              <img class="mainimg" src="${contextPath}/main/mainDownload.do?main_img=${main_imgs[status.index]}&company=${company.company}" alt="" />
              
          
          <div class="product-details">
              <h3><b class="head" style="color: #f5ba18;">&nbsp;${company.category}</b>&nbsp;${company.company}</h3>
              <hr>        
              <p class="p-1"><b>평점</b>${company.grade} &nbsp; </p>
              <p class="p-2" style="color:rgb(59, 57, 57);">주소 : ${company.location}</p>
          <p class="p-3"><b>객실정보</b> : ${company.detail}</p>
            
          <a href="${contextPath}/main/product.do?company=${company.company}" class="ares">예약하러가기</a>
          <a class="btn-primary2" href="${contextPath}/user/deleteMark.do?u_id=${userVO.u_id}&c_no=${company.c_no}">찜목록에서 제거</a>


          
        </div>
    </div>
    </c:forEach>
    </div>






</section>






    </body>
</html>
<script type="text/javascript">
    function changeTab(tabId, page) {
        // 탭 전환 함수
        document.getElementById(tabId).checked = true;

        // 페이지 이동
        window.location.href = `?page=${page}`;
    }
</script>