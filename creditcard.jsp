<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.util.List, java.util.Map, java.text.SimpleDateFormat, java.util.Date" %>
<%
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
	request.setCharacterEncoding("UTF-8");
    String prdNo = request.getParameter("prdNo");
    String qty = request.getParameter("qty");
    String receiver = request.getParameter("receiver");
    String phone = request.getParameter("phone");
    String postcode = request.getParameter("postcode");
    String address = request.getParameter("address");
    String detailAddress = request.getParameter("detailAddress");
    String deliveryMemo = request.getParameter("deliveryMemo");
    if("직접 입력".equals(deliveryMemo)) {
        deliveryMemo = request.getParameter("customMemo");
    }
    String selectedCouponCode = request.getParameter("selectedCouponCode");
    String finalAmountStr = request.getParameter("finalAmount");
    int finalAmount = Integer.parseInt(finalAmountStr);
    
    
    String step = request.getParameter("step");
    if(step == null) {
        step = "input"; 
    }
    
   
    String orderId = "";
    
  
    String cardNumber = request.getParameter("cardNumber");

    if(cardNumber != null) {
        cardNumber = cardNumber.replaceAll("-", "");
    }
    String cardPassword = request.getParameter("cardPassword");
    
  
    boolean orderComplete = false;
    String errorMessage = null;
    
    if("complete".equals(step)) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            String DB_URL = "jdbc:mysql://localhost:3306/project?useSSL=false&characterEncoding=UTF-8&useUnicode=true";
            String DB_ID = "root";
            String DB_PASSWORD = "1234";

            Class.forName("org.gjt.mm.mysql.Driver");
            con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);


            con.setAutoCommit(false);


            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentDateTime = formatter.format(new Date());


            String fullAddress = "[" + postcode + "] " + address + " " + detailAddress;

            // 배송 메모 값 가져오기 (customMemo 우선, 없으면 deliveryMemo 사용)
            deliveryMemo = request.getParameter("customMemo"); // 중복 선언 방지를 위해 String 키워드 제거
            if (deliveryMemo == null || deliveryMemo.trim().isEmpty()) {
                deliveryMemo = request.getParameter("deliveryMemo");
            }
            // 값이 없을 경우 기본값 설정
            if (deliveryMemo == null || deliveryMemo.trim().isEmpty()) {
                deliveryMemo = "요청사항 없음";
            }


            // SQL 쿼리에 deliveryMemo 컬럼 추가
            String sql = "INSERT INTO orderInfo (memId, ordDate, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordCardNo, ordCardPass, deliveryMemo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, loginId);
            pstmt.setString(2, currentDateTime);
            pstmt.setString(3, receiver);
            pstmt.setString(4, fullAddress);
            pstmt.setString(5, phone);
            pstmt.setString(6, String.valueOf(finalAmount));
            pstmt.setString(7, cardNumber != null ? cardNumber : "");
            pstmt.setString(8, cardPassword != null ? cardPassword : "");
            pstmt.setString(9, deliveryMemo); // deliveryMemo 값 설정

            pstmt.executeUpdate();
            
           
            rs = pstmt.getGeneratedKeys();
            if(rs.next()) {
                orderId = String.valueOf(rs.getInt(1));
              
                session.setAttribute("orderId", orderId);
                session.setAttribute("orderAmount", finalAmount);
            }
            rs.close();
            pstmt.close();
            
            
            if(prdNo != null && !prdNo.isEmpty() && qty != null && !qty.isEmpty()) {
           
                sql = "INSERT INTO orderProduct (ordNo, prdNo, ordQty) VALUES (?, ?, ?)";
                pstmt = con.prepareStatement(sql);
                
                pstmt.setString(1, orderId);
                pstmt.setString(2, prdNo);
                pstmt.setInt(3, Integer.parseInt(qty));
                
                pstmt.executeUpdate();
                pstmt.close();
                
               
                sql = "UPDATE goods SET prdStock = prdStock - ? WHERE prdNo = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(qty));
                pstmt.setString(2, prdNo);
                pstmt.executeUpdate();
                pstmt.close();
            } else {
                
                List<Map<String, Object>> cartItems = (List<Map<String, Object>>) session.getAttribute("cartItems");
                
                if(cartItems != null && !cartItems.isEmpty()) {
                    for(Map<String, Object> item : cartItems) {
                        String cartPrdNo = (String) item.get("prdNo");
                        int cartQty = (int) item.get("ctQty");
                        
                       
                        sql = "INSERT INTO orderProduct (ordNo, prdNo, ordQty) VALUES (?, ?, ?)";
                        pstmt = con.prepareStatement(sql);
                        
                        pstmt.setString(1, orderId);
                        pstmt.setString(2, cartPrdNo);
                        pstmt.setInt(3, cartQty);
                        
                        pstmt.executeUpdate();
                        pstmt.close();
                        
                        
                        sql = "UPDATE goods SET prdStock = prdStock - ? WHERE prdNo = ?";
                        pstmt = con.prepareStatement(sql);
                        pstmt.setInt(1, cartQty);
                        pstmt.setString(2, cartPrdNo);
                        pstmt.executeUpdate();
                        pstmt.close();
                    }
                    
                  
                    session.removeAttribute("cartItems");
                    
                   
					sql = "DELETE FROM cart WHERE memId = ?"; 
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, loginId);
					pstmt.executeUpdate();
					pstmt.close();
                }
            }
            
   
            if(selectedCouponCode != null && !"0".equals(selectedCouponCode)) {
                sql = "DELETE FROM coupon WHERE memId = ? AND couponCode = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, loginId);
                pstmt.setString(2, selectedCouponCode);
                pstmt.executeUpdate();
                pstmt.close();
            }

            con.commit();
            orderComplete = true;
            
        } catch(Exception e) {

            if(con != null) {
                try {
                    con.rollback();
                } catch(Exception ex) {
                    ex.printStackTrace();
                }
            }
            errorMessage = e.getMessage();
            e.printStackTrace();
        } finally {

            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(con != null) {
                    con.setAutoCommit(true); 
                    con.close();
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
%>

<html>
<head>
    <title>신용카드 결제</title>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #fff;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            width: 95%;
            max-width: 600px;
            margin: 20px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
			border: 1px solid #cde5d1;
        }
        
        .order-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .order-header h1 {
            color: #1AA56F;
            font-weight: 500;
            margin-bottom: 10px;
        }
        
        .order-step {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }
        
        .step {
            text-align: center;
            position: relative;
            padding: 0 20px;
        }
        
        .step-number {
            width: 30px;
            height: 30px;
            background: #E8F5E9;
            color: #1AA56F;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 10px;
            font-weight: 500;
        }
        
        .step.active .step-number {
            background: #1AA56F;
            color: white;
        }
        
        .step-title {
            font-size: 14px;
            color: #777;
        }
        
        .step.active .step-title {
            color: #1AA56F;
            font-weight: 500;
        }
        
        .card-form {
            margin-top: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        
        .form-control:focus {
            border-color: #1AA56F;
            outline: none;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .card-icon {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        
        .card-icon img {
            height: 30px;
            object-fit: contain;
        }
        
        .btn-submit {
            display: block;
            width: 100%;
            padding: 15px;
            background: #1EB980;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 30px;
        }
        
        .btn-submit:hover {
            background: #1AA56F;
        }
        
        .payment-result {
            text-align: center;
            margin: 30px 0;
        }
        
        .payment-success {
            color: #1AA56F;
            font-size: 24px;
            font-weight: 500;
            margin-bottom: 20px;
        }
        
        .order-info {
            background: #F8F9FA;
            padding: 20px;
            border-radius: 8px;
            margin-top: 30px;
        }
        
        .order-info-title {
            font-size: 18px;
            font-weight: 600;
            color: #1AA56F;
            margin-bottom: 15px;
        }
        
        .order-info-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        
        .order-info-label {
            font-weight: 500;
            color: #555;
        }
        
        .processing-animation {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 200px;
        }
        
        .spinner {
            border: 4px solid rgba(0, 0, 0, 0.1);
            width: 36px;
            height: 36px;
            border-radius: 50%;
            border-left-color: #1AA56F;
            animation: spin 1s linear infinite;
            margin-bottom: 20px;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .error-message {
            color: red;
            text-align: center;
            margin: 20px 0;
            padding: 10px;
            background-color: #ffeeee;
            border-radius: 4px;
        }
    </style>
</head>

<body>
<div style="margin-top: 140px;"></div>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="order-header">
        <h1>신용카드 결제</h1>
    </div>
    
    <div class="order-step">
        <div class="step <%= "input".equals(step) ? "active" : "" %>">
            <div class="step-number">1</div>
            <div class="step-title">카드 정보 입력</div>
        </div>
        <div class="step <%= "processing".equals(step) ? "active" : "" %>">
            <div class="step-number">2</div>
            <div class="step-title">결제 처리 중</div>
        </div>
        <div class="step <%= "complete".equals(step) ? "active" : "" %>">
            <div class="step-number">3</div>
            <div class="step-title">결제 완료</div>
        </div>
    </div>
    
    <% if(errorMessage != null) { %>
    <div class="error-message">
        <strong>오류 발생:</strong> <%= errorMessage %>
        <p>다시 시도해주세요.</p>
        <a href="javascript:history.back();" class="btn-submit" style="text-decoration: none; text-align: center; margin-top: 10px; display: inline-block; width: auto; padding: 10px 20px;">
            이전 페이지로 돌아가기
        </a>
    </div>
    <% } else if("input".equals(step)) { %>
    <!-- 카드 정보 입력 단계 -->
    <form action="creditcard.jsp" method="post" class="card-form" id="cardForm">
        <input type="hidden" name="prdNo" value="<%= prdNo %>">
        <input type="hidden" name="qty" value="<%= qty %>">
        <input type="hidden" name="receiver" value="<%= receiver %>">
        <input type="hidden" name="phone" value="<%= phone %>">
        <input type="hidden" name="postcode" value="<%= postcode %>">
        <input type="hidden" name="address" value="<%= address %>">
        <input type="hidden" name="detailAddress" value="<%= detailAddress %>">
        <input type="hidden" name="deliveryMemo" value="<%= deliveryMemo %>">
        <input type="hidden" name="selectedCouponCode" value="<%= selectedCouponCode %>">
        <input type="hidden" name="finalAmount" value="<%= finalAmount %>">
        <input type="hidden" name="step" value="processing">
        
        <div class="form-group">
            <label class="form-label">결제 금액</label>
            <div style="font-size: 24px; font-weight: 700; color: #1AA56F;"><%= String.format("%,d", finalAmount) %>원</div>
        </div>
        
        <div class="form-group">
            <label for="cardNumber" class="form-label">카드 번호</label>
            <input type="text" id="cardNumber" name="cardNumber" class="form-control" placeholder="0000-0000-0000-0000" required maxlength="19">
        </div>
        
        <div class="form-row">
            <div class="form-group">
                <label for="expiryDate" class="form-label">유효 기간</label>
                <input type="text" id="expiryDate" name="expiryDate" class="form-control" placeholder="MM/YY" required maxlength="5">
            </div>
            
            <div class="form-group">
                <label for="cvv" class="form-label">CVV</label>
                <input type="password" id="cvv" name="cvv" class="form-control" placeholder="***" required maxlength="3">
            </div>
        </div>
        
        <div class="form-group">
            <label for="cardOwner" class="form-label">카드 소유자 이름</label>
            <input type="text" id="cardOwner" name="cardOwner" class="form-control" placeholder="카드에 표시된 이름" required>
        </div>
        
        <div class="form-group">
            <label for="cardPassword" class="form-label">카드 비밀번호 앞 2자리</label>
            <input type="password" id="cardPassword" name="cardPassword" class="form-control" placeholder="**" required maxlength="2">
        </div>
        
        <button type="submit" class="btn-submit">결제하기</button>
    </form>
    
    <% } else if("processing".equals(step)) { %>
    <div class="processing-animation">
        <div class="spinner"></div>
        <div>결제 처리 중입니다...</div>
    </div>
    
    <form id="completeForm" action="creditcard.jsp" method="post">
        <input type="hidden" name="prdNo" value="<%= prdNo %>">
        <input type="hidden" name="qty" value="<%= qty %>">
        <input type="hidden" name="receiver" value="<%= receiver %>">
        <input type="hidden" name="phone" value="<%= phone %>">
        <input type="hidden" name="postcode" value="<%= postcode %>">
        <input type="hidden" name="address" value="<%= address %>">
        <input type="hidden" name="detailAddress" value="<%= detailAddress %>">
        <input type="hidden" name="deliveryMemo" value="<%= deliveryMemo %>">
        <input type="hidden" name="selectedCouponCode" value="<%= selectedCouponCode %>">
        <input type="hidden" name="finalAmount" value="<%= finalAmount %>">
        <input type="hidden" name="cardNumber" value="<%= cardNumber %>">
        <input type="hidden" name="cardPassword" value="<%= cardPassword %>">
        <input type="hidden" name="step" value="complete">
    </form>
    
    <script>
        setTimeout(function() {
            document.getElementById('completeForm').submit();
        }, 2000);
    </script>
    
    <% } else if("complete".equals(step) && orderComplete) { %>
    <!-- 결제 완료 단계 -->
    <div class="payment-result">
        <div class="payment-success">결제가 완료되었습니다!</div>
        <p>주문이 성공적으로 처리되었습니다. 배송 준비가 시작되면 알림을 드리겠습니다.</p>
    </div>
    
    <div class="order-info">
        <div class="order-info-title">주문 정보</div>
        
        <div class="order-info-row">
            <span class="order-info-label">주문 번호</span>
            <span><%= orderId %></span>
        </div>
        
        <div class="order-info-row">
            <span class="order-info-label">결제 금액</span>
            <span><%= String.format("%,d", finalAmount) %>원</span>
        </div>
        
        <div class="order-info-row">
            <span class="order-info-label">받는 분</span>
            <span><%= receiver %></span>
        </div>
        
        <div class="order-info-row">
            <span class="order-info-label">연락처</span>
            <span><%= phone %></span>
        </div>
        
        <div class="order-info-row">
            <span class="order-info-label">배송지</span>
            <span>
                [<%= postcode %>]<br>
                <%= address %><br>
                <%= detailAddress %>
            </span>
        </div>
        
        <% if(deliveryMemo != null && !deliveryMemo.isEmpty()) { %>
        <div class="order-info-row">
            <span class="order-info-label">배송 메모</span>
            <span><%= deliveryMemo %></span>
        </div>
        <% } %>
    </div>
    
    <a href="mypage.jsp" class="btn-submit" style="text-decoration: none; text-align: center;">
        주문 내역 보기
    </a>
    <% } else { %>
    <div style="text-align: center; margin: 30px 0;">
        <p>결제 처리 중 문제가 발생했습니다. 다시 시도해주세요.</p>
        <a href="javascript:history.back();" class="btn-submit" style="text-decoration: none; text-align: center; margin-top: 20px; display: inline-block; width: auto; padding: 10px 20px;">
            이전 페이지로 돌아가기
        </a>
    </div>
    <% } %>
</div>

<script>

    document.getElementById('cardNumber')?.addEventListener('input', function(e) {
        let value = e.target.value.replace(/\D/g, '');
        let formattedValue = '';
        
        for(let i = 0; i < value.length; i++) {
            if(i > 0 && i % 4 === 0) {
                formattedValue += '-';
            }
            formattedValue += value[i];
        }
        
        e.target.value = formattedValue;
    });
    

    document.getElementById('expiryDate')?.addEventListener('input', function(e) {
        let value = e.target.value.replace(/\D/g, ''); 
        
        if(value.length > 2) {
            value = value.substring(0, 2) + '/' + value.substring(2);
        }
        
        e.target.value = value;
    });
</script>
<div style="margin-bottom: 200px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>