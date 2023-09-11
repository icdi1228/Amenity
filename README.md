# Amenity

## 프로젝트 소개

숙박예약사이트를 만들어 보았습니다.


## 개발 기간

- 23.08.01 ~ 23.09.08


## 멤버구성
|이름|                   구현기능                                                                      |
|:---:|---------------------------------------------------------------------------------------------------------|
|이상원| - 관리자 회원/사업자 관리 리스트 <br> - 사업자 마이페이지 매출도표 <br> - 검색 및 세부검색 기능 <br>  - 결제 api <br> - 상품상세페이지<br> - 쿠폰발급(쿠폰관리)<br> - DB초안 제작|
|이창현| - 장바구니 기능<br> - 사용자/사업자/관리자 공지사항<br> - 사용자,사업자  아이디 비밀번호 찾기<br> - 사용자 마이페이지<br> - 사용자 리뷰작성 및 마일리지<br> -  나의 문의내역|
|김범규| - 관리자 리스트 (검색, 수정, 삭제, 페이징)<br> - 관리자페이지 공지사항<br> - 메인 페이지(다중이미지 캐러셀)<br> - (네이버, 카카오 api) 로그인,회원가입<br> - (단일, 다중)결제 처리<br> - DB초안 제작|
|유치상| - 사업자 사업체/객실 추가|

## 개발환경

- `Java 1.8`
- `JDK 17.0.4.1`
- IDE : STS 4.10.0
- Framework : SpringFrameWork
- DB : Mysql
- ORM : Mybatis

## 화면 구성

## 주요 기능

- 메인페이지
  - 검색기능
    - 전체 검색 : 검색창에 아무것도 입력하지 않고 검색버튼을 누를 시 검색됨
    - 카테고리 검색 : 메인페이지에 카테고리 이미지를 눌렀을 때 수행
        
  - 세부검색기능
    - 사용자가 선택한 옵션에 해당하는 업체만 출력
    
------------

- 사용자
  - 1
  - 2
  - 3


------------

- 사업자
  - 사업자 마이페이지
    - 사업장 매출 그래프
      
        
  - 2
  - 3


------------

- 관리자
  - 1
  - 2
  - 3


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
  
