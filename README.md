# Amenity

## 프로젝트 소개

숙박예약서비스 웹 프로젝트


## 개발 기간

- 23.08.01 ~ 23.09.08


## 멤버구성
|이름|구현기능|
|:---:|---|
|이상원| - 관리자 회원/사업자 관리 리스트 <br> - 사업자 마이페이지 매출도표 <br> - 검색 및 세부검색 기능 <br>  - 결제 api <br> - 상품상세페이지<br> - 쿠폰발급(쿠폰관리)<br> - DB초안 제작|
|이창현| - 장바구니 기능<br> - 사용자/사업자/관리자 공지사항<br> - 사용자,사업자  아이디 비밀번호 찾기<br> - 사용자 마이페이지<br> - 사용자 리뷰작성 및 마일리지<br> -  나의 문의내역<br> - DB초안 제작|
|김범규| - 관리자 리스트 (검색, 수정, 삭제, 페이징)<br> - 관리자페이지 공지사항<br> - 메인 페이지(다중이미지 캐러셀)<br> - (네이버, 카카오 api) 로그인,회원가입<br> - (단일, 다중)결제 처리<br> - DB초안 제작|
|유치상| - 사업자 사업체/객실 추가|

## 개발환경
<div>
	<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white">
	<img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">
	<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
	<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
	<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
	<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white">
	<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
	<img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
	<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
	<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
	<img src="https://img.shields.io/badge/chart.js-%23FF6384?style=for-the-badge&logo=chartdotjs&logoColor=white">
</div>


- `Java 1.8`
- `JDK 17.0.4.1`
- IDE : STS 4.10.0
- Framework : SpringFrameWork
- DB : Mysql
- ORM : Mybatis

 <details style="display: none;">
	 <summary>김법규</summary>
	 <video preload="none" src="https://github.com/icdi1228/Amenity/assets/94802582/4ed641e8-441d-4254-a080-2381d48d91ae">
 </details> 

## 화면 구성
<style>
  details:not([open]) video {
    display: none;
  }
</style>
[PPT자료(pdf)](https://drive.google.com/file/d/1Mo-OG7WNElRaZwX1LmiLYdvuRYHKgieF/view?usp=drive_link)
- 회원가입
	- <details style="display: none;">
		<summary>일반 회원가입</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/94802582/4ed641e8-441d-4254-a080-2381d48d91ae">			
	</details>
 
	- <details style="display: none;">
		<summary>카카오 회원가입 + 로그인</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/94802582/0dea648c-514d-4b31-b346-5747e4377fce">			
	</details>
- 로그인
  - <details style="display: none;">
		<summary>일반 로그인</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/94802582/00b66018-3e85-45d9-a8ac-1c7be521ce0e">			
	</details>
 
  - <details style="display: none;">
	<summary>카카오 로그인</summary>
	<video src="https://github.com/icdi1228/Amenity/assets/141104418/eb9914c9-59e8-427e-add4-2fbbbaafd06d">			
</details>

- 검색
  - <details style="display: none;">
		<summary>일반 검색</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/141104418/0aced252-7ea7-46e6-aefe-01f64a5e44a8">			
	</details>
			
  - <details style="display: none;">
		<summary>상세 검색</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/94802582/8217895e-436d-4418-b350-3a94bd0504bb">			
	</details>
 
- 결제하기
  - 카트 (쿠폰, 마일리지 적용, 아임포트 결제 api) 
	- <details style="display: none;">
		<summary>장바구니</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/141104418/c40d1294-4c02-4979-aaf8-3d16966a1857">			
	</details>
  - 결제 -> 예약내역
	- <details style="display: none;">
		<summary>결제</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/141104418/46f5a49f-df14-4d3e-b65a-4857c0ae563f">			
	</details>

- (유저)
  - 북마크, 이벤트 (쿠폰발급) -> 개인정보, 내 쿠폰함, 내 마일리지, 내 찜목록 -> 회원탈퇴
	- <details style="display: none;">
		<summary>유저기능</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/141104418/2c6bafaf-b8fb-4ea1-9701-9f8b4bf87b8c">			
	</details>

- (사업자)
  - 마이페이지 사업자 정보 / 내 사업장 정보 
	- <details style="display: none;">
		<summary>사업자 기능</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/94802582/12c02f24-dd1f-489a-ad61-dba86b2e0d57">			
	</details>
  - 리뷰 기능
	- <details style="display: none;">
		<summary>리뷰 기능</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/94802582/4b6c0501-8e7d-4c87-8b67-67fd3fa70e04">			
	</details>
  - 업체추가, 상품추가 -> 내 사업장/상품 리스트 -> 검색 해서 보여주기
	- <details style="display: none;">
		<summary>추가 기능</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/94802582/e8950eb0-bfcb-4519-b518-84bb5c3b9151">			
	</details>

- (관리자)
  - 공지사항 [공지]/[FAQ] 작성 -> 문의내역 답변 
	- <details style="display: none;">
		<summary>추가 기능</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/141104418/1d35838a-4b73-4b56-967f-479b81bf619d">			
	</details>
  - 회원/기업관리/사업장 수정/삭제 기능 
	- <details style="display: none;">
		<summary>CRUD</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/141104418/d3e7832f-611c-43b9-aef7-0671a5ca959e">			
	</details>
  - 쿠폰 발급
	- <details style="display: none;">
		<summary>쿠폰발급</summary>
		<video src="https://github.com/icdi1228/Amenity/assets/141104418/7ebe244d-5cd5-4998-b04a-87f6d994fe8d">			
	</details>

## 주요 기능

- 메인페이지
  - 검색기능
    - 전체 검색 : 검색창에 아무것도 입력하지 않고 검색버튼을 누를 시 검색됨
    - 카테고리 검색 : 메인페이지에 카테고리 이미지를 눌렀을 때 수행    
  - 세부검색기능
    - 사용자가 선택한 옵션에 해당하는 업체만 출력
  - 상품 상세내역
    - 숙박/대실 예약하기
    - 리뷰보기
    - 위치 보기 (카카오 맵)
  - 결제하기
    - 쿠폰적용
    - 마일리지 적용
    - 아임포트 결제 (토스, 카카오페이, 핸드폰소액결제)
------------

- 사용자
  - 회원가입 / 로그인
  - 장바구니 
  - mypage (내정보, 내역, 쿠폰, 마일리지, 찜목록)
  - 공지 (공지, 문의내역, 이벤트)


------------

- 사업자
  - 예약현황 조회
  - 사업자 마이페이지
    - 사업자 개인정보
    - 사업장 매출 그래프
    - 리뷰관리
  - 사업장 리스트
  - 상품 리스트
  - 업체추가
  - 객실추가

------------

- 관리자
  - 고객센터 관리
    - 공지사항 , FAQ 작성 및 (사용자,사업자)문의 조회 , 답변
    - 사용자 전체 예약내역 조회
  
  - 마이페이지
    - 사용자, 사업자 회원목록 조회 , 수정 및 삭제 기능
    - 등록된 사업체 및 객실상품 조회, 수정 및 삭제 기능
    - 쿠폰 발행기능


## gradle 추가
```
- repositories {
	//아임포트 추가
	maven { url 'https://jitpack.io' }
}
```
```
- dependencies {
  implementation('org.springframework.boot:spring-boot-starter-jdbc')
	implementation('org.springframework.boot:spring-boot-starter-web')
	implementation('org.mybatis.spring.boot:mybatis-spring-boot-starter:1.3.2')
	implementation('org.apache.tomcat.embed:tomcat-embed-jasper')
    	implementation('javax.servlet:jstl:1.2')    
	implementation('org.apache.tiles:tiles-jsp:3.0.4')  
    	implementation group: 'commons-fileupload', name: 'commons-fileupload', version: '1.2.1'	  
    	implementation group: 'commons-io', name: 'commons-io', version: '1.4'	
    	runtimeOnly ('mysql:mysql-connector-java:8.0.25')
    
    // 아임포트 gradle
    implementation 'com.github.iamport:iamport-rest-client-java:0.2.21'

    testImplementation('org.springframework.boot:spring-boot-starter-test')
    testImplementation group: 'org.junit.jupiter', name: 'junit-jupiter-api', version: '5.3.0'
    
    //JSON 을 Map 으로 변환하기 위한 의존성
    implementation('org.springframework.boot:spring-boot-starter-web')
    
    // javax mail
    implementation 'javax.mail:javax.mail-api:1.6.2'
    
    // mail surpport?
    implementation 'org.springframework:spring-context-support:5.3.28'
    
    // spring email
    implementation group: 'org.springframework.boot', name: 'spring-boot-starter-mail', version: '2.6.3' // 이메일전송
    implementation group: 'org.apache.commons', name: 'commons-lang3', version: '3.12.0' // 문자열 처리 
    
    //Lombok 자동코드생성
    implementation 'org.projectlombok:lombok:1.18.22'
    
    //validation 유효성검증
    implementation 'org.hibernate.validator:hibernate-validator:7.0.1.Final'
    
    //스프링부트 유효성 검증
    implementation 'org.springframework.boot:spring-boot-starter-validation'
    
    // api에서 java언어 대상으로 데이터 유효성 검사 
    implementation group: 'jakarta.validation', name: 'jakarta.validation-api', version: '3.0.0'

    // jsp 즉시적용 (컴파일 자동화)
    implementation 'org.springframework.boot:spring-boot-devtools'
    
    // 카카오
	implementation group: 'com.google.code.gson', name: 'gson', version: '2.9.0'
	
    // 네이버
	implementation 'com.github.scribejava:scribejava-core:2.8.1'
  }
```
  
