<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>

<%
    // 로그인 확인
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp?redirect=orderForm.jsp");
        return;
    }

	request.setCharacterEncoding("UTF-8");
     // 주문 정보 받기
    final String receiver = request.getParameter("receiver");
    final String phone = request.getParameter("phone");
    final String address = request.getParameter("address");
    final String detailAddress = request.getParameter("detailAddress");
    final String postcode = request.getParameter("postcode");
    final String deliveryMemo = request.getParameter("deliveryMemo").equals("직접 입력") ? 
    request.getParameter("customMemo") : request.getParameter("deliveryMemo");
    
    // 결제 금액 정보
    final String finalAmountStr = request.getParameter("finalAmount");
    final int finalAmount = Integer.parseInt(finalAmountStr);
    
    // 쿠폰 정보
    final String couponCode = request.getParameter("selectedCouponCode");

    // 단일 상품 주문 시 상품번호와 수량 받기
    final String prdNo_param = request.getParameter("prdNo");
    final String qty_param = request.getParameter("qty");
    
    // 주문 정보를 세션에 임시 저장
    session.setAttribute("orderInfo", new HashMap<String, Object>() {{
        put("receiver", receiver);
        put("phone", phone);
        put("address", address);
        put("detailAddress", detailAddress);
        put("postcode", postcode);
        put("deliveryMemo", deliveryMemo);
        put("finalAmount", finalAmount);
        put("couponCode", couponCode);
        // prdNo와 qty는 세션의 orderInfo에 직접 넣기보다는,
        // kakaoPaySuccess.jsp로 직접 전달하는 것이 현재 구조에서 더 간단합니다.
    }});
%>

<!DOCTYPE html>
<html>
<head>
    <title>카카오페이 결제</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>

<body>
    <script>
        var IMP = window.IMP;
        IMP.init('imp40237582'); // 포트원 가맹점 식별코드

        function requestPay() {
            IMP.request_pay({
                pg: 'kakaopay.TC0ONETIME',  // 카카오페이 테스트 모드
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),  // 임시 주문번호
                name: 'PIBUPIBU 상품 결제',
                amount: <%= finalAmount %>,
                buyer_name: '<%= receiver %>',
                buyer_tel: '<%= phone %>',
                buyer_addr: '<%= address + " " + detailAddress %>',
                buyer_postcode: '<%= postcode %>'
            }, function (rsp) {
                if (rsp.success) {
                    // 결제 성공 시 서버에 결제 정보 저장
                    var form = document.createElement('form');
                    form.setAttribute('method', 'post');
                    form.setAttribute('action', 'kakaoPaySuccess.jsp');

                    // 필요한 파라미터 추가 (imp_uid, merchant_uid)
                    var impUidInput = document.createElement('input');
                    impUidInput.setAttribute('type', 'hidden');
                    impUidInput.setAttribute('name', 'imp_uid');
                    impUidInput.setAttribute('value', rsp.imp_uid);
                    form.appendChild(impUidInput);

                    var merchantUidInput = document.createElement('input');
                    merchantUidInput.setAttribute('type', 'hidden');
                    merchantUidInput.setAttribute('name', 'merchant_uid');
                    merchantUidInput.setAttribute('value', rsp.merchant_uid);
                    form.appendChild(merchantUidInput);

                    // 단일 상품 주문의 경우 prdNo와 qty 추가
                    <% if (prdNo_param != null && !prdNo_param.isEmpty() && qty_param != null && !qty_param.isEmpty()) { %>
                        var prdNoInput = document.createElement('input');
                        prdNoInput.setAttribute('type', 'hidden');
                        prdNoInput.setAttribute('name', 'prdNo');
                        prdNoInput.setAttribute('value', '<%= prdNo_param %>');
                        form.appendChild(prdNoInput);

                        var qtyInput = document.createElement('input');
                        qtyInput.setAttribute('type', 'hidden');
                        qtyInput.setAttribute('name', 'qty');
                        qtyInput.setAttribute('value', '<%= qty_param %>');
                        form.appendChild(qtyInput);
                    <% } %>

                    document.body.appendChild(form);
                    form.submit();
                } else {
                    alert('결제에 실패하였습니다.\n' + rsp.error_msg);
                    history.back(); // 이전 페이지로 돌아가기
                }
            });
        }

        // 페이지 로드 시 자동으로 결제 요청
        window.onload = requestPay;
    </script>
</body>
</html>