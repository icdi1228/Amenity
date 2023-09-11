# Amenity

## 프로젝트 소개

숙박예약사이트를 만들어 보았습니다.


## 개발 기간

- 23.08.01 ~ 23.09.08


## 멤버구성

- 이상원 - 관리자 회원/사업자 관리 리스트, 사업자 마이페이지 매출도표, 검색 및 세부검색 기능, 결제 api, 상품상세페이지, 쿠폰발급(쿠폰관리), DB초안 제작
- 김범규 - 관리자 (기업, 업체, 상품) 리스트 (검색, 수정, 삭제, 페이징) + 공지사항 + 작성 , 메인 페이지(다중이미지 캐러셀) + 회원가입, (네이버, 카카오) 로그인 api, (단일, 다중)결제 처리, DB초안 제작
- 이창현 - 장바구니 기능, DB초안 제작 ,  사용자,사업자,관리자 공지사항 기능 사용자,사업자  아이디 비밀번호 찾기 기능, 사용자 마이페이지 , 사용자 리뷰작성 및 마일리지 , 나의 문의내역
- 유치상 - 사업자 사업체/객실 추가

## 개발환경

- `Java 1.8`
- `JDK 17.0.4.1`
- IDE : STS 4.10.0
- Framework : SpringFrameWork
- DB : Mysql
- ORM : Mybatis

## 주요 기능

- 메인페이지
  - 검색기능
      - 전체 검색 : 검색창에 아무것도 입력하지 않고 검색버튼을 누를 시 검색됨
        ```
        if(name != null && !name.trim().isEmpty()) {
	        companyList = companyService.searchCompaniesByName(name); // 검색창에 특정 값을 넣었을 때
	      } else {
	        companyList = companyService.listProducts(); // 검색창에 null이 들어왔을 때
	      }
        ```
      - 카테고리 검색 : 메인페이지에 카테고리 이미지를 눌렀을 때 수행
        ```
        List<CompanyVO> companyList = companyService.searchCompaniesByCategory(category); // 카테고리에 해당하는 companyList 출력

        <select id="searchCompaniesByCategory" resultType="CompanyVO">
    	    select * from company where category = #{category}

        </select>

        for(CompanyVO companyVO : companyList) {
	    	  String company = companyVO.getCompany();
	    	  String temp = companyService.viewCompanyListMainImage(company);
	    	  main_imgs.add(temp);
	      }
        ```
        
  - 세부검색기능
    - 체크인/체크아웃, 인원, 가격, 거리, 별점등 기입한 정보를 바탕으로 해당 정보에 부합하는 결과물만 출력
      우선 모든 companyList를 가져오고 소거법으로 부합하는 결과물 출력

      예약날짜 검색 (여기서 company는 모텔이나 호텔등을 의미 goods는 객실을 의미)

      ```
      boolean compare = false; // 해당 company가 사용자가 기입한 정보에 부합하는지 아닌지 최종결과
      for (GoodsVO goodsVO : goodsList) {
		int gnum = goodsVO.getG_no();
		boolean found = false;
		for (int goods : compgnum) {
		if (gnum == goods) {
		// 이 if문(예약내역에 해당 업체의 방번호가 있는 경우)
		// 이 if문을 거치는데 거치는 경우 compare를 true로 반전 못시킨다. (한 방도 남아있지 않는 경우)
			found = true;
			 break;
			 }
		}
		if (!found) {
		// 하지만 한 번이라도 거치지 않으면 compare는 true로 반전 (한 방이상 남아있는 경우)
			compare = true;
		}}
      ```
      인원/가격/별점 검색
      
      ```
      // 초기치를 설정하고
      	int goodsPrice = 1000000;
			int goodsStdper = 100;

      // 해당 company의 최소치를 잡아서
      	for(GoodsVO goodsVO : goodsList) {
				if(goodsPrice>=goodsVO.getPrice() && goodsStdper >= goodsVO.getStdper()) {
					goodsPrice = goodsVO.getPrice();
					goodsStdper = goodsVO.getStdper();
				}
			}
      // company별 최소치와 사용자가 입력한 값을 비교하여 부합하는 정보만 추가
      	if (distance <= selectedDistance && companyGrade >= selectedGrade && goodsPrice <= selectedPrice && goodsStdper <= selectedStdper && compare) {
					System.out.println("distance : " + distance);
					System.out.println("companyGrade : " + companyGrade);
					System.out.println("selectedPrice : " + selectedPrice);
					System.out.println("selectDistance : " + selectedDistance);
					System.out.println("distance : " + distance);
					System.out.println("company : " + companyVO.getCompany());
					companyList.add(companyVO);
					}
      ```
      거리별 검색
      우선 업체를 추가할때 daum api를 이용해서 해당 위치의 위도/경도 값을 받아 DB에 저장한다.
      이후 현 위치의 값을 input 태그에 가져와 세부 검색 기능의 form안에 같이 넣는다.
      ```
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ee5742af74aeabb95a5010509d6933c"></script>
      	<script>
        	window.onload=function currentLocation() {
        	if (navigator.geolocation) {
          	navigator.geolocation.getCurrentPosition(function(position) {
          	var lat = position.coords.latitude; // 위도
		var lon = position.coords.longitude; // 경도
          	document.getElementById("latitude").value = lat;
          	document.getElementById("longitude").value = lon;});
        	}else{
          	message = "error 위치를 알 수 없습니다.";
        	}
      		}
      	</script>    
      ```
      해당 정보를 기반으로 위도/경도를 이용해 거리를 km단위로 출력하는 method를 만들고
      ```
      private double calculateDistance(double startLat, double startLon, double arriveLat, double arriveLon) {
    		double slat = Math.cos(startLat);
	  	double absLonVal = Math.abs(startLon - arriveLon);
	  	double absLatVal = Math.abs(startLat - arriveLat); 
	  	double x = ((slat * 6400 * 2 * 3.14 / 360)*(absLonVal));
	  	double y = 111 * absLatVal;
	  	double calculatedDistance = Math.sqrt((Math.pow(x,2) + Math.pow(y,2)));
	  	return calculatedDistance;
		}
		// 메서드를 사용하여 거리별 검색을 실행한다.
      	double distance = calculateDistance(userLatitude, userLongitude, companyLatitude, companyLongitude);
      
      ```
      
      
------------
- 사용자
  - 1
  - 2
  - 3
------------
- 사업자
  - 1
  - 2
  - 3
------------
- 관리자
  - 1
  - 2
  - 3


  
