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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <script type="text/javascript">
	function backToList(obj) {
		obj.action="${contextPath}/main/main.do";
		obj.submit();
	}
	function fn_enable(obj){
		document.getElementById("bpw").disabled=false;
        document.getElementById("bpw").style.backgroundColor="white";
		document.getElementById("tel1").disabled=false;
        document.getElementById("tel1").style.backgroundColor="white";
        document.getElementById("tel2").disabled=false;
        document.getElementById("tel2").style.backgroundColor="white";
        document.getElementById("tel3").disabled=false;
        document.getElementById("tel3").style.backgroundColor="white";
		document.getElementById("baccount").disabled=false;
        document.getElementById("baccount").style.backgroundColor="white";
        document.getElementById("tr_btn_modify").style.display="inline-block";
        document.getElementById("tr_btn_modify").style.textAlign="center";
		document.getElementById("tr_btn_modify1").style.display="inline-block";
        document.getElementById("tr_btn_modify2").style.display="inline-block";
		document.getElementById("tr_btn").style.display="none";
	}

    function fn_disable(obj){
		document.getElementById("bpw").disabled=true;
        document.getElementById("bpw").style.backgroundColor="#f5f5f5";
		document.getElementById("tel1").disabled=true;
        document.getElementById("tel1").style.backgroundColor="#f5f5f5";
        document.getElementById("tel2").disabled=true;
        document.getElementById("tel2").style.backgroundColor="#f5f5f5";
        document.getElementById("tel3").disabled=true;
        document.getElementById("tel3").style.backgroundColor="#f5f5f5";
		document.getElementById("baccount").disabled=true;
        document.getElementById("baccount").style.backgroundColor="#f5f5f5";
		document.getElementById("tr_btn_modify1").style.display="none";
        document.getElementById("tr_btn_modify2").style.display="none";
		document.getElementById("tr_btn").style.display="inline-block";
        document.getElementById("tr_btn").style.textAlign="center";
	}


	function fn_modify_myInfo(obj) {
		obj.action="${contextPath}/business/updateInfo.do";
		obj.submit();
	}
</script>


        <style>
            body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
                    #relative{
            position:relative;
          }
          #absolute{
            position:absolute;
          }
          .out{
            display:flex;
            width:auto;
            height:auto;
            
          }
          .inner1{
            width:400px;
            height:400px;
            margin:1%;
            border: 1px solid black;
            transition: width 2.5s ease, height 2.5s ease;
          }
          .inner2{
            width:400px;
            height:400px;
            margin:1%;
            border: 1px solid black;
            transition: width 2.5s ease, height 2.5s ease;
          }
          .inner3{
            width:400px;
            height:400px;
            margin:1%;
            border: 1px solid black;
            transition: width 2.5s ease, height 2.5s ease;
          }


          canvas {
            width: 95%;
            height: 95%;
        }

        
        #tr_btn_modify1,#tr_btn_modify2{
		display:none;
	}
    #tr_btn_modify{
        display:none;
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
        #tab1,#tab2 {
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
        input[name="tabs"]:checked + label {
              color: #555;
              border: 1px solid #ddd;
              border-top: 2px solid #2e9cdf;
              border-bottom: 1px solid #ffffff;}

              input[name="subtabs"]:checked + label {
              color: #555;
              border: 1px solid #ddd;
              border-top: 2px solid #2e9cdf;
              border-bottom: 1px solid #ffffff;}

        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2 {
            display: block;}


.resButton{
  width:100%;
  height:100%;
  margin-top:10%;
}

.container {
      
      justify-content: space-between;
      margin: 0 auto;
      padding: 20px;
      float:center;
    }
    
    .outter-div1, .outter-div2{
      background-color: #f5f5f5;
      border-radius: 10px;
      max-width:700px;      
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      text-align:center;
      margin: 0 10px;
    }
    
    .in3 {
      margin: 0;
    }
    .inner-div1 h4 {
      margin: 0;
    }
    .inner-div2, .inner-div3 {
      text-align: center;
    }
    .value {
      font-size: 24px;
      font-weight: bold;
      margin: 10px 0;
    }
    .inner-div5 img {
      max-width: 100px;
      height: auto;
    }
    
    .ares, .hd button {
      display: inline-block;
      padding: 8px 16px;
      border-radius: 5px;
      text-decoration: none;
      transition: background-color 0.3s;
    }
     .ares {
       margin-top:20px;
      background-color: #007bff;
      color: #fff;
      border:none;
    }
    .ares:hover, .hd button:hover, .edit-btn:hover {
      background-color: #0056b3;
    }
    th{
      padding:20px;
    }
    #tel1,#tel2,#tel3{
        width:70px;
    }

    #companySelect{
        width:200px;
        height:40px;
        padding:10px;
    }
   
        </style>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- inner1 -->
    <script>
        $(document).ready(function () {
            var isExpanded1 = false;
            $('.inner1').on('click',function(){
                if(!isExpanded1){
                    $('.inner1').css({
                    'width': '1200px',
                    'height': '700px'
                    });
                    
                    $('.inner2, .inner3').css({
                        'width': '1px',
                        'height': '1px',
                        'border': 'none'
                    });
                }
                else{
                    $('.inner1').css({
                    'width': '400px',
                    'height': '400px'
                    });
                    
                    $('.inner2, .inner3').css({
                    'display':'block',
                    'width': '400px',
                    'height': '400px',
                    'border': '1px solid black'
                    });
                }
                isExpanded1 = !isExpanded1;
                
            });
        });
    </script>

    <!-- inner2 -->
    <script>
        $(document).ready(function () {
            var isExpanded2 = false;

            $('.inner2').on('click',function(){
                if (isExpanded2){
                    $('.inner2').css({
                    'width': '1200px',
                    'height': '700px'
                    });
                    
                    $('.inner1, .inner3').css({
                        'width': '1px',
                        'height': '1px',
                        'border': 'none'
                    });
                }
                else{
                    $('.inner2').css({
                    'width': '400px',
                    'height': '400px'
                    });
                    
                    $('.inner1, .inner3').css({
                    'display':'block',
                    'width': '400px',
                    'height': '400px',
                    'border': '1px solid black'
                    });
                }
                isExpanded2 = !isExpanded2;
            });
        });
    </script>

    <!-- inner3 -->
    <script>
        $(document).ready(function () {
            var isExpanded3 = false;
    
            $('.inner3').on('click', function () {
                if (!isExpanded3) {
                    $('.inner3').css({
                        'width': '1100px',
                        'height': '1200px'
                    });
                    $('.inner2, .inner1').css({
                        'width': '1px',
                        'height': '1px',
                        'border': 'none'
                    });
                } else {
                    $('.inner3').css({
                        'width': '400px',
                        'height': '400px'
                    });
                    $('.inner2, .inner1').css({
                        'display': 'block',
                        'width': '400px',
                        'height': '400px',
                        'border': '1px solid black'
                    });
                }
    
                isExpanded3 = !isExpanded3;
            });
        });
    </script>




    </head>
    <body>
        <div class="main">

            <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
            <label for="tab1">사업자 내정보</label>
        
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">내 사업장 정보</label>
        
            <section id="content1">
              <!-- 사업장 내정보 -->
                <div class="container">
                  <div class="outter-div1">
                    <div class="inner-div1">
                      <div class="hd">
                        <h3 class="in3">내 정보</h3><br>
                        <form name="b_myPage" method="post" action="${contextPath}">
                        <table align="center" class="atb">
                          <tr align="center" class="atr">
                                    <th width="200"><b>사업자 등록 번호</b></th>
                                    <th width="300"><input style="border:none;background-color:#f5f5f5" type="text" name="b_no1" value="${businessVO.b_no}" disabled/><input type="hidden" name="b_no" value="${businessVO.b_no}"/></th>		
                            </tr>            
                          <tr align="center">
                                    <th width="150"><b>이름</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="name1" value="${businessVO.name}" /><input type="hidden" name="name" value="${businessVO.name}"/></th>	
                            </tr>
                          <tr align="center">
                                    <th width="150"><b>비밀 번호</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" id="bpw" name="b_pw" value="${businessVO.b_pw}" disabled/></th>		
                            </tr>
                          <tr align="center">
                                    <th width="150"><b>이메일</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="email1" value="${businessVO.email}" /><input type="hidden" name="email" value="${businessVO.email}"/></th>		
                            </tr>
                          <tr align="center">
                                    <th width="150"><b>전화 번호</b></th>
                                    <th width="400"><input style="border:none;background-color:#f5f5f5" type="text" name="tel1" id="tel1"  value="${businessVO.tel1}" disabled />-<input style="border:none;background-color:#f5f5f5" type="text" name="tel2" id="tel2" value="${businessVO.tel2}" disabled />-<input style="border:none;background-color:#f5f5f5" type="text" name="tel3" id="tel3" value="${businessVO.tel3}" disabled/></th>		
                            </tr>            
                          
                          <tr align="center">
                                    <th width="150"><b>계좌 번호</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="account" id="baccount" value="${businessVO.account}" disabled/></th>		
                            </tr>
                          <tr align="center">
                                    <th width="150"><b>가입일</b></th>
                                    <th width="150"><input style="border:none;background-color:#f5f5f5" type="text" name="credate"  value="${businessVO.credate}" disabled/></th>		
                            </tr>
                
                        </table>
                        <div id="tr_btn_modify">
                        <input id="tr_btn_modify1" class="ares" type="button" value="수정반영하기" onClick="fn_modify_myInfo(b_myPage)">
                        <input id="tr_btn_modify2" class="ares" type="button" value="취소" onClick="fn_disable(this.form)">
                        </div> 
                        <input id="tr_btn" type="button" class="ares" value="정보 수정" onClick="fn_enable(this.form)" />
                        </div>
                    </form>
            </section>
        
            <section id="content2">        
              <!-- 내 사업장 관리-->

                    <div class="out">
                        <div class="inner1">        
                            <canvas id="myChart"></canvas>
                        </div>
                    
                        <div class="inner2">
                            <canvas id="reservationChart"></canvas>
                        </div>
                        
                        <div class="inner3">
                            <canvas id="ratingChart"></canvas>
                        </div>
                    </div>
                    
            </section>
            
        </div>    








  
        





























    


        <script>
            var companyData = [
                <c:forEach items="${comList}" var="company" varStatus="companyStatus">
                    [
                        <c:forEach items="${companySalesMap[company]}" var="sale" varStatus="saleStatus">
                            '${sale}'<c:if test="${!saleStatus.last}">,</c:if>
                        </c:forEach>
                    ]<c:if test="${!companyStatus.last}">,</c:if>
                </c:forEach>
            ];
        
            var labelList = [
                <c:forEach items="${labels}" var="label" varStatus="status">
                    '${label}'<c:if test="${!status.last}">,</c:if>
                </c:forEach>
            ];

            var comList = [
                <c:forEach items="${comList}" var="company" varStatus="status">
                    '${company}'<c:if test="${!status.last}">,</c:if>
                </c:forEach>
            ];

            console.log(comList);
            var colorList = [
                <c:forEach items="${colorList}" var="color" varStatus="status">
                    '${color}'<c:if test="${!status.last}">,</c:if>
                </c:forEach>
            ];
        
            const ctx1 = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx1, {
                type: 'line',
                data: {
                    labels: labelList,
                    datasets: companyData.map(function(data, index) {
                        return {
                            label: comList[index],
                            data: data,
                            backgroundColor: colorList[index],
                            borderColor: colorList[index],
                            borderWidth: 2
                        };
                    })
                },
                options: {
                    plugins:{
                        title:{
                            display:true,
                            text: '월별 매출',
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    animation: {
                        delay: function(context) {
                            // 예: 데이터셋 인덱스에 따라 다른 지연 시간 설정
                            if (context.datasetIndex === 0) {
                                return 500; // 첫 번째 데이터셋의 경우 500ms 지연
                            } else {
                                return 1000; // 그 외 데이터셋의 경우 1000ms 지연
                            }
                        }
                    }
                }
            });
        </script>
        
           
                <script>
                // 사용자 평점 비율 (파이 차트)
                
                var gradeLabel = [
                    <c:forEach items="${gradeLabel}" var="label" varStatus="status">
                        '${label}'<c:if test="${!status.last}">,</c:if>
                    </c:forEach>
                ];

                var gradeList = [
                    <c:forEach items="${gradeList}" var="list" varStatus="status">
                        '${list}'<c:if test="${!status.last}">,</c:if>
                    </c:forEach>
                ];

                
        const ratingCtx = document.getElementById('ratingChart').getContext('2d');
        const ratingChart = new Chart(ratingCtx, {
            type: 'pie',
            data: {
                labels: gradeLabel,
                datasets: [{
                    data: gradeList,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(23, 87, 156, 0.6)',
                        'rgba(29, 138, 196, 0.6)',
                        'rgba(113, 201, 228, 0.6)',
                        'rgba(205, 239, 237, 0.6)',
                        'rgba(248, 239, 237, 0.6)',
                        'rgba(179, 178, 235, 0.6)'
                    ]
                }]
            },
            options: {
                plugins:{
                        title:{
                            display:true,
                            text: '사용자 평점 비율',
                        }
                    },
                        animation: {
                            delay: function(context) {
                                // 각 조각에 대해 500ms씩 증가하는 지연 시간 설정
                                return context.dataIndex * 500;
                            }
                        }
                    }
        });
                </script>
                <script>
                    // 객실별 예약 빈도 (스택 바 차트)
        
                    var companyRoomData = [
        <c:forEach items="${comList}" var="company" varStatus="companyStatus">
            [
                <c:forEach items="${roomSalesMap[company]}" var="sale" varStatus="saleStatus">
                    '${sale}'<c:if test="${!saleStatus.last}">
                        ,
                    </c:if>
                </c:forEach>
            ]<c:if test="${!companyStatus.last}">
                ,
            </c:if>
        </c:forEach>
    ];
                    console.log(companyRoomData)
        
                    var roomList = [
                        <c:forEach items="${roomList}" var="room" varStatus="status">
                            '${room}'<c:if test="${!status.last}">,</c:if>
                        </c:forEach>
                    ];

            const reservationCtx = document.getElementById('reservationChart').getContext('2d');
            const reservationChart = new Chart(reservationCtx, {
                type: 'bar',
                data: {
                    labels: roomList,
                    datasets: companyRoomData.map(function(data, index) {
                        return {
                            label: comList[index],
                            data: data,
                            backgroundColor: colorList[index],
                        };
                    })
                },
                options: {
                    plugins:{
                        title:{
                            display:true,
                            text: '객실별 매출',
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            stacked: true
                        },
                        x: {
                            stacked: true
                        }
                    }
                }
            });
                </script>
    
    </body>
</html>
