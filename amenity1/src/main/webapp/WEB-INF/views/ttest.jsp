<!DOCTYPE html>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<html>  
<head>
    <meta charset="UTF-8">
    <!-- PortOne SDK -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        var IMP = window.IMP;
        IMP.init("imp45451010");
   
        function requestDanalPay() {
          IMP.request_pay(
            {
              pg: "danal_tpay.A010002002",
              pay_method: "card",
              merchant_uid: "order_no_001",
              name: "김범규 1마리",
              amount: 1,
              buyer_email: "Iamport@chai.finance",
              buyer_name: "포트원 기술지원팀",
              buyer_tel: "010-1234-5678",
              buyer_addr: "서울특별시 강남구 삼성동",
              buyer_postcode: "123-456",
            },
            function (rsp) {
              if (rsp.success) {
              // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
              // jQuery로 HTTP 요청
              jQuery.ajax({
              url: "{서버의 결제 정보를 받는 가맹점 endpoint}", 
              method: "POST",
              headers: { "Content-Type": "application/json" },
              data: {
                  imp_uid: rsp.imp_uid,            // 결제 고유번호
                  merchant_uid: rsp.merchant_uid   // 주문번호
              }
          }).done(function (data) {
              var msg = "결제 완료";
              alert("결제에 성공하였습니다.");    
          })
          } else {
          alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
          }
          });
        }
      </script>
    <script>
      var IMP = window.IMP;
      IMP.init("imp45451010");
 
      function requestKaKaOPay() {
        IMP.request_pay(
          {
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card",
            merchant_uid: "order_no_001",
            name: "김범규 1마리",
            amount: 1,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
            if (rsp.success) {
            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            jQuery.ajax({
            url: "{서버의 결제 정보를 받는 가맹점 endpoint}", 
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: {
                imp_uid: rsp.imp_uid,            // 결제 고유번호
                merchant_uid: rsp.merchant_uid   // 주문번호
            }
        }).done(function (data) {
            var msg = "결제 완료";
            alert("결제에 성공하였습니다.");    
        })
        } else {
        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
        }
        });
      }
    </script>
    <script>
        var IMP = window.IMP;
      IMP.init("imp45451010");
 
      function requestTossPay() {
        IMP.request_pay(
          {
            pg: "tosspay.tosstest",
            pay_method: "card",
            merchant_uid: "order_no_" + new Date().getTime(),
            name: "김범규 1마리",
            amount: 10,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456"
          },
          function (rsp) {
            if (rsp.success) {
            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            var msg = "결제 완료";
            msg += '고유ID : ' + rsp.imp_uid;                
            msg += '// 상점 거래ID : ' + rsp.merchant_uid;
            msg += '// 결제 금액 : ' + rsp.amount;
            msg += '// 상품이름 : ' + rsp.name;
            $.ajax({
            url: "${contextPath}/resultT.do", 
            type: "POST",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify({
                "imp_uid": rsp.imp_uid,            // 결제 고유번호
                "merchant_uid": rsp.merchant_uid,   // 주문번호
                "pay_method": rsp.pay_method,
                "name": rsp.name,
                "amount": rsp.amount,
                "buyer_email": rsp.buyer_email,
                "buyer_name": rsp.buyer_name,
                "buyer_addr": rsp.buyer_addr,
                "buyer_postcode": rsp.buyer_postcode
            }),
            success: function(response) {
            // 여기에 성공 시의 코드를 작성합니다.
            alert(msg);
            console.log("Server responded with:", response);
            location.href="${contextPath}/resultTest.do";
            },
            error: function(error) {
            alert("서버 요청에 실패했습니다.");
            console.error("Error from server:", error);
            }
        })
        
        } else {
        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
        }
        });
      }
    </script>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
  </head>
  <body>
    <button onclick="requestKaKaOPay()">카카오페이 결제하기</button>
    <button onclick="requestTossPay()">토스결제하기</button>
    <button onclick="requestDanalPay()">다날결제하기</button>
    <!-- 결제하기 버튼 생성 --> 
  </body>
</html>