<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<%
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
	
	request.setCharacterEncoding("UTF-8");
    // 세션에서 주문 정보 가져오기
    Map<String, Object> orderInfo = (Map<String, Object>) session.getAttribute("orderInfo");
    String impUid = request.getParameter("imp_uid");
    
    // 주문 ID 변수 선언
    String orderId = "";

    // DB 연결 정보
    String DB_URL = "jdbc:mysql://localhost:3306/project?useSSL=false&characterEncoding=UTF-8&useUnicode=true";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    try {
        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
        
        // 트랜잭션 시작
        con.setAutoCommit(false);
        
        try {
            // 주문 정보 저장 (ordNo는 자동 증가)
            String sql = "INSERT INTO orderInfo (memId, ordReceiver, ordRcvPhone, ordRcvAddress, ordDate, ordStatus, paymentKey, ordPay) VALUES (?, ?, ?, ?, NOW(), '주문완료', ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            
            pstmt.setString(1, loginId);
            pstmt.setString(2, (String)orderInfo.get("receiver"));
            pstmt.setString(3, (String)orderInfo.get("phone"));
            // 배송지 주소 조합
            String fullAddress = "[" + (String)orderInfo.get("postcode") + "] " + 
                               (String)orderInfo.get("address") + " " + 
                               (String)orderInfo.get("detailAddress");
            pstmt.setString(4, fullAddress);
            pstmt.setString(5, impUid);
            pstmt.setString(6, String.valueOf((Integer)orderInfo.get("finalAmount")));
            
            pstmt.executeUpdate();
            
            // 생성된 주문 번호(ordNo) 가져오기
            ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next()) {
                orderId = String.valueOf(rs.getInt(1));
                // 세션에 주문 ID 저장
                session.setAttribute("orderId", orderId);
                session.setAttribute("orderAmount", orderInfo.get("finalAmount"));
            }
            rs.close();
			pstmt.close();
			
			// 주문 상품 정보 저장
            String prdNo = request.getParameter("prdNo");
            String qty = request.getParameter("qty");
            List<Map<String, Object>> cartItems = (List<Map<String, Object>>) session.getAttribute("cartItems");
            
            if (prdNo != null && qty != null) {
                // 단일 상품 주문 처리
                String itemSql = "INSERT INTO orderProduct (ordNo, prdNo, ordQty) VALUES (?, ?, ?)";
                pstmt = con.prepareStatement(itemSql);
                pstmt.setString(1, orderId);
                pstmt.setString(2, prdNo);
                pstmt.setInt(3, Integer.parseInt(qty));
                pstmt.executeUpdate();
                pstmt.close();
                
                // 상품 재고 감소 처리
                String updateStockSql = "UPDATE goods SET prdStock = prdStock - ? WHERE prdNo = ?";
                pstmt = con.prepareStatement(updateStockSql);
                pstmt.setInt(1, Integer.parseInt(qty));
                pstmt.setString(2, prdNo);
                pstmt.executeUpdate();
                pstmt.close();
            } else if (cartItems != null && !cartItems.isEmpty()) {
                // 장바구니 기반 주문 처리
                String itemSql = "INSERT INTO orderProduct (ordNo, prdNo, ordQty) VALUES (?, ?, ?)";
                pstmt = con.prepareStatement(itemSql);
                
                for (Map<String, Object> item : cartItems) {
                    String cartPrdNo = (String) item.get("prdNo");
                    int cartQty = (int) item.get("ctQty");
                    
                    pstmt.setString(1, orderId);
                    pstmt.setString(2, cartPrdNo);
                    pstmt.setInt(3, cartQty);
                    pstmt.executeUpdate();
                    
                    // 상품 재고 감소 처리
                    String updateStockSql = "UPDATE goods SET prdStock = prdStock - ? WHERE prdNo = ?";
                    PreparedStatement pstmtStock = con.prepareStatement(updateStockSql);
                    pstmtStock.setInt(1, cartQty);
                    pstmtStock.setString(2, cartPrdNo);
                    pstmtStock.executeUpdate();
                    pstmtStock.close();
                }
                pstmt.close();
                
                // 장바구니 비우기 (session에서)
                session.removeAttribute("cartItems");
                
                // 장바구니 DB 테이블에서 삭제
                String deleteCartSql = "DELETE FROM cart WHERE memId = ?";
                pstmt = con.prepareStatement(deleteCartSql);
                pstmt.setString(1, loginId);
                pstmt.executeUpdate();
                pstmt.close();
            }
            
            // 쿠폰 사용 처리
            String couponCode = (String)orderInfo.get("couponCode");
            if (couponCode != null && !couponCode.equals("0")) {
                String updateCoupon = "DELETE FROM coupon WHERE couponCode = ? AND memId = ?";
                PreparedStatement pstmtCoupon = con.prepareStatement(updateCoupon);
                pstmtCoupon.setString(1, couponCode);
                pstmtCoupon.setString(2, loginId);
                pstmtCoupon.executeUpdate();
                pstmtCoupon.close();
            }
            
            // 트랜잭션 커밋
            con.commit();
            
            // 세션에서 주문 정보 제거
            session.removeAttribute("orderInfo");
            
        } catch(Exception e) {
            // 오류 발생 시 롤백
            con.rollback();
            throw e;
        } finally {
            // 자동 커밋 복구
            con.setAutoCommit(true);
        }
        
        con.close();
    } catch(Exception e) {
        out.println(e);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>결제 성공</title>
    <style>
        body {
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			background-color: #fff;
			margin: 0;
			padding: 0;
			min-height: 100vh;
			display: flex;
			flex-direction: column;
		}
        .success-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 90%;
			margin: 0 auto;
			
        }
        h1 {
            color: #1EB980;
            margin-bottom: 20px;
        }
        .success-message {
            color: #333;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background: #1EB980;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #1AA56F;
        }
		.success-container {
			 padding: 40px;
			 text-align: center;
		}

		footer {
			margin-top: auto;
		}
    </style>
</head>
<body>
<div class="page-wrapper">
<div style="margin-top:90px;"></div>
<%@ include file="header.jsp" %>
    <div class="success-container">
        <h1>결제가 완료되었습니다</h1>
        <div class="success-message">
            주문이 성공적으로 처리되었습니다.<br>
            주문번호: <%= orderId %>
        </div>
        <a href="mypage.jsp" class="btn">주문 내역 보러가기</a>
        <a href="index.jsp" class="btn">홈으로</a>
    </div>
	<div style="margin-bottom: 0px;"></div>
	<%@ include file="footer.jsp" %>
	<div>
</body>
</html>