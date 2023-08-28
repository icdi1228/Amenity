<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 업체 등록하기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 20px;
  }
  .card {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    max-width: 700px;
    margin: auto;
  }
  .card-header {
    background-color: #f5ba18;
    color: white;
    text-align: center;
    padding: 10px 0;
    border-radius: 10px 10px 0 0;
  }
  .card-body {
    padding: 20px;
  }
  .btn-primary {
    background-color: #555;
    border: none;
    color: #f4f4f4;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
    margin-left: 5px;
    font-size: 14px;
  }
  .btn-primary:hover {
    background-color: #666;
  }
</style>
<script>
  var fileIndex = 0;

  function fn_addFile(){
	    $("#d_file").append("<br>"+"<input type='file' class='form-control-file' id='sub_img' name='sub_img' onchange='readURL(this);'>");
  }

</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ee5742af74aeabb95a5010509d6933c&libraries=services"></script>
</head>
<body>
  <div class="container mt-5">
    <div class="card">
      <div class="card-header">
        <h1>새 업체 등록하기</h1>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-md-6 offset-md-3">
            <form name="newCompany" method="post" action="${contextPath}/business/addNewCompany.do" enctype="multipart/form-data">
              <div class="form-group">
                <label for="b_no">사업자 등록 번호</label>
                <input type="text" class="form-control" id="b_no" name="b_no" value="${businessVO.b_no}" readonly>
              </div>
              <div class="form-group">
                <label for="company">업체명</label>
                <input type="text" class="form-control" id="company" name="company">
              </div>
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="category">업체 종류</label>
                  <input type="text" class="form-control" id="category" name="category">
                </div>
                <div class="col-md-6">
                  <label for="categorySelect">업체 카테고리</label>
                  <select class="form-control" id="categorySelect" name="categorySelect" onchange="changeCategory()">
                    <option value="custom" selected>종류를 선택해주세요.</option>
                    <option value="Hotel">Hotel</option>
                    <option value="Motel">Motel</option>
                    <option value="Pention">Pention</option>
                    <option value="PoolVilla">Pool Villa</option>
                    <option value="Camping">Camping</option>
                  </select>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="location">주소</label>
                  <input type="text" class="form-control" id="sample5_address" name="location" placeholder="주소">
                  <label for="locationdetail">상세주소</label>
                  <input type="text" class="form-control" name="locationdetail" placeholder="상세주소">
                  <input type="hidden" id="latitude" name="latitude">
                  <input type="hidden" id="longitude" name="longitude">
                </div>
                <div class="col-md-6 mt-md-2">
                  <button type="button" class="btn btn-primary btn-block" onclick="sample5_execDaumPostcode()">주소 검색</button>
                </div>
              </div>
              <div class="form-group">
                <div id="map" style="width:100%;height:300px;display:none"></div>
              </div>
              <div class="form-group">
                <label for="main_img">대표 이미지</label>
                <input type="file" class="form-control-file" id="main_img" name="main_img">
              </div>
              <div class="form-group">
                <label for="sub_img">상세 이미지</label>
                <div id="d_file">
                  <input type="file" class="form-control-file" id="sub_img" name="sub_img" onchange="readURL(this);">
                </div>
                <button type="button" class="btn btn-secondary btn-sm mt-2" onclick="fn_addFile()">파일 추가</button>
              </div>
              <div class="form-group">
                <label for="detail">상세 설명</label>
                <textarea class="form-control" id="detail" name="detail" maxlength="1000"></textarea>
              </div>
              <div class="text-center">
                <button type="submit" class="btn btn-primary">등록하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
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

    function sample5_execDaumPostcode() {
      new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)

                        document.getElementById("latitude").value = result.y;
                        document.getElementById("longitude").value = result.x;
                    }
                });
            }
        }).open();
    }
  </script>
</body>
</html>
