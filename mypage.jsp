<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp?redirect=mypage.jsp");
        return;
    }
%>
<%
    request.setCharacterEncoding("UTF-8");
  
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #fff;
        margin: 0;
        padding: 40px;
    }
    .container {
        max-width: 1140px;
        margin: auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.1);
		border: 1px solid #cde5d1;
		
    }
    h2 {
        color: #1EB980;
        margin-bottom: 30px;
        font-size : 35px;
    }
    .skin-result, .cart-items, .order-history {
        margin-top: 30px;
    }
    .section-title {
        font-size: 25px;
        font-weight: 600;
        color: #444;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
		font-size: 18px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
		font-size: 18px;
    }
    th {
        background-color: #E8F5E9;
        color: #777;
    }
    .order-item {
        margin-bottom: 20px;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        overflow: hidden;
    }
    .order-header {
        background-color: #f9f9f9;
        padding: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #e0e0e0;
    }
    .order-date {
        font-weight: 500;
        color: #666;
		font-size: 18px;
    }
    .order-number {
        font-weight: bold;
        color: #444;
		font-size: 18px;
    }
    .order-status {
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 20px;
        font-weight: 500;
        background-color: #E8F5E9;
        color: #1AA56F;
    }
    .order-details {
        padding: 15px;
    }
    .order-product {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
        padding-bottom: 10px;
        border-bottom: 1px solid #f0f0f0;
    }
    .order-product:last-child {
        border-bottom: none;
        margin-bottom: 0;
        padding-bottom: 0;
    }
    .product-info {
        display: flex;
        align-items: center;
    }
    .product-name {
        margin-left: 10px;
        font-weight: 500;
		font-size: 18px; 
    }
    .product-price {
        color: #555;
		font-size: 18px; 
    }
    .order-total {
        text-align: right;
        padding: 15px;
        background-color: #f9f9f9;
        font-weight: 600;
        color: #1AA56F;
        border-top: 1px solid #e0e0e0;
    }
    .view-detail-btn {
        display: inline-block;
        padding: 6px 12px;
        background-color: #1EB980;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-size: 15px;
        transition: background-color 0.3s;
    }
    .view-detail-btn:hover {
        background-color: #1AA56F;
    }
    .no-items {
        text-align: center;
        padding: 20px;
        color: #777;
        font-style: italic;
    }
	.coupon-btn {
		padding: 10px 20px;
		background-color: #1EB980;
		color: white;
		border: none;
		border-radius: 4px;
		font-size: 16px;
		cursor: pointer;
		transition: background-color 0.3s;
	}

	.coupon-btn:hover {
		background-color: #1AA56F;
	}

    @media screen and (max-width: 768px) {
        body {
            padding: 20px;
        }
        .container {
            padding: 20px;
            box-shadow: none;
        }
        h2 {
            font-size: 22px;
            text-align: center;
        }
        .skin-result p,
        .cart-items p,
        .order-history p {
            font-size: 14px;
            text-align: center;
        }
        table {
            font-size: 16px;
        }
        th, td {
            padding: 8px;
        }
        .section-title {
            font-size: 18px;
            text-align: center;
        }
        .order-header {
            flex-direction: column;
            gap: 10px;
        }
    }
    </style>
</head>
<body>
<div style="margin-top: 200px;"></div>
<%@ include file="header.jsp" %>
<div class="container">
<h2>마이페이지</h2>

<%
    String DB_URL = "jdbc:mysql://localhost:3306/project?useSSL=false&characterEncoding=UTF-8&useUnicode=true";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String userId = (String) session.getAttribute("sid");
    out.print("<div class='skin-result'><p style='font-size:22px;'> 현재 로그인한 사용자 ID : <strong>" + userId + "</strong></p>");

    if (userId == null || userId.trim().isEmpty()) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
        
        String deleteExpiredSql = "DELETE FROM coupon WHERE expiryDate < CURDATE()";
        PreparedStatement deleteStmt = conn.prepareStatement(deleteExpiredSql);
        deleteStmt.executeUpdate();
        deleteStmt.close();
        
        // 최근 피부 타입 조회
        String sql1 = "SELECT skinType FROM skintest WHERE TRIM(userId) = TRIM(?) ORDER BY testDate DESC LIMIT 1";
        pstmt = conn.prepareStatement(sql1);
        pstmt.setString(1, userId.trim());
        rs = pstmt.executeQuery();

        if (rs.next()) {
    String skinType = rs.getString("skinType");
    String targetPage = "";

    // skinType 값에 따라 이동할 JSP 파일 설정
    if ("건성".equals(skinType)) targetPage = "dry.jsp";
    else if ("지성".equals(skinType)) targetPage = "oily.jsp";
    else if ("중성".equals(skinType)) targetPage = "normal.jsp";
    else if ("민감성".equals(skinType)) targetPage = "sensitive.jsp";
    else if ("복합성".equals(skinType)) targetPage = "combination.jsp";

    out.print("<p style='font-size:22px;'>✅ 최근 피부 타입 결과 : " +
        "<a href='" + targetPage + "' " +
        "style='color:#b30000; font-weight:bold; text-decoration:none;'>" + 
        skinType + "</a></p>");
} else {
    out.print("<p style='font-size:22px;'>❌ 저장된 피부 타입 정보가 없습니다.</p>");
}


        out.print("</div>");

        // 주문 내역 조회
        out.print("<div class='order-history'>");
        out.print("<h3 class='section-title'>📦 주문 내역</h3>");

        String orderSql = "SELECT ordNo, ordDate, ordPay, ordStatus FROM orderInfo WHERE memId = ? ORDER BY ordDate DESC";
        pstmt = conn.prepareStatement(orderSql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat displayFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");

        boolean hasOrders = false;

        while (rs.next()) {
            hasOrders = true;
            String ordNo = rs.getString("ordNo");
            Timestamp ordDate = rs.getTimestamp("ordDate");
            String formattedDate = displayFormat.format(ordDate);
            int ordPay = rs.getInt("ordPay");
            String ordStatus = rs.getString("ordStatus");
            if (ordStatus == null || ordStatus.isEmpty()) {
                ordStatus = "주문완료";
            }

            out.print("<div class='order-item'>");
            out.print("<div class='order-header'>");
            out.print("<div class='order-date'>" + formattedDate + "</div>");
            out.print("<div class='order-number'>주문번호: " + ordNo + "</div>");
            out.print("<div class='order-status'>" + ordStatus + "</div>");
            out.print("</div>");

            // 주문 상품 조회
            String productSql = "SELECT g.prdName, op.ordQty, g.prdPrice FROM orderProduct op " +
                                "JOIN goods g ON op.prdNo = g.prdNo " +
                                "WHERE op.ordNo = ?";
            PreparedStatement pstmtProducts = conn.prepareStatement(productSql);
            pstmtProducts.setString(1, ordNo);
            ResultSet rsProducts = pstmtProducts.executeQuery();

            out.print("<div class='order-details'>");
            while (rsProducts.next()) {
                String prdName = rsProducts.getString("prdName");
                int ordQty = rsProducts.getInt("ordQty");
                int prdPrice = rsProducts.getInt("prdPrice");
                int totalPrice = ordQty * prdPrice;

                out.print("<div class='order-product'>");
                out.print("<div class='product-info'>");
                out.print("<div class='product-name'>" + prdName + " x " + ordQty + "개</div>");
                out.print("</div>");
                out.print("<div class='product-price'>" + String.format("%,d원", totalPrice) + "</div>");
                out.print("</div>");
            }
            out.print("</div>");
            
            out.print("<div class='order-total'>");
            out.print("총 결제금액: " + String.format("%,d원", ordPay));
            out.print(" <a href='orderDetail.jsp?ordNo=" + ordNo + "' class='view-detail-btn'>상세보기</a>");
            out.print("</div>");
            
            out.print("</div>"); // .order-item 끝
            
            rsProducts.close();
            pstmtProducts.close();
        }

        if (!hasOrders) {
            out.print("<div class='no-items'>주문 내역이 없습니다.</div>");
        }
        
        out.print("</div>"); // .order-history 끝

        // 장바구니 보기
        out.print("<div class='cart-items'><h3 class='section-title'>🛒 장바구니 목록</h3>");

        // 세션 ID로 장바구니 조회
        String sessionId = session.getId(); 
        String sql2 = "SELECT g.prdNo, g.prdName, g.prdPrice, c.ctQty FROM cart c JOIN goods g ON c.prdNo = g.prdNo WHERE c.memId = ?";
        
        pstmt = conn.prepareStatement(sql2);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        boolean hasItem = false;
        out.print("<table><tr><th>상품명</th><th>수량</th><th>가격</th><th>합계</th></tr>");
        while (rs.next()) {
            hasItem = true;
            String prdNo = rs.getString("prdNo");
            String prdName = rs.getString("prdName");
            int qty = rs.getInt("ctQty");
            int price = rs.getInt("prdPrice");
            int total = qty * price;

            out.print("<tr>");
            out.print("<td><a href='viewDetailProduct.jsp?prdNo=" + prdNo + "' style='color:#1AA56F; text-decoration:none; font-weight:bold;'>" + prdName + "</a></td>");
            out.print("<td>" + qty + "</td>");
            out.print("<td>" + String.format("%,d원", price) + "</td>");
            out.print("<td>" + String.format("%,d원", total) + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");

        if (!hasItem) {
            out.print("<div class='no-items'>장바구니가 비어 있습니다.</div>");
        }

        out.print("</div>"); // .cart-items 끝

        // 쿠폰 보기
        out.print("<div class='cart-items'><h3 class='section-title'>🎁 보유 쿠폰</h3>");

        String sql3 = "SELECT couponCode, discount, expiryDate FROM coupon WHERE memId = ?";

        pstmt = conn.prepareStatement(sql3);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        boolean hasCoupon = false;
        out.print("<table><tr><th>쿠폰 코드</th><th>할인율</th><th>유효기간</th></tr>");
        while (rs.next()) {
            hasCoupon = true;
            String code = rs.getString("couponCode");
            int discount = rs.getInt("discount");
            Date expiry = rs.getDate("expiryDate");

            out.print("<tr>");
            out.print("<td>" + code + "</td>");
            out.print("<td>" + discount + "%</td>");
            out.print("<td>" + expiry + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        if (!hasCoupon) {
            out.print("<div class='no-items'>보유 중인 쿠폰이 없습니다.</div>");
        }
        out.print("</div>");
// 쿠폰 등록 처리
if ("true".equals(request.getParameter("registerCoupon"))) {
    String inputCode = request.getParameter("couponInput");
    if (inputCode != null && !inputCode.trim().isEmpty()) {
        try {
            String checkSql = "SELECT couponCode, discount, expiryDate FROM public_coupon WHERE couponCode = ? AND expiryDate >= CURDATE()";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, inputCode.trim());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String code = rs.getString("couponCode");

                // 중복 등록 확인
                String dupCheckSql = "SELECT COUNT(*) FROM coupon WHERE memId = ? AND couponCode = ?";
                PreparedStatement dupStmt = conn.prepareStatement(dupCheckSql);
                dupStmt.setString(1, userId);
                dupStmt.setString(2, code);
                ResultSet dupRs = dupStmt.executeQuery();
                dupRs.next();
                int alreadyHave = dupRs.getInt(1);
                dupRs.close();
                dupStmt.close();

                if (alreadyHave == 0) {
                    // 등록
                    String insertSql = "INSERT INTO coupon (memId, couponCode, discount, expiryDate) VALUES (?, ?, ?, ?)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                    insertStmt.setString(1, userId);
                    insertStmt.setString(2, code);
                    insertStmt.setInt(3, rs.getInt("discount"));
                    insertStmt.setDate(4, rs.getDate("expiryDate"));
                    insertStmt.executeUpdate();
                    insertStmt.close();

                    out.print("<script>alert('✅ 쿠폰이 등록되었습니다!'); location.href='mypage.jsp';</script>");
                } else {
                    out.print("<script>alert('⚠️ 이미 등록한 쿠폰입니다.');</script>");
                }
            } else {
                out.print("<script>alert('❌ 유효하지 않거나 기간이 지난 쿠폰입니다.');</script>");
            }
        } catch (Exception e) {
            out.print("<script>alert('서버 오류가 발생했습니다 😢');</script>");
        }
    } else {
        out.print("<script>alert('쿠폰 코드를 입력해주세요!');</script>");
    }
}

    } catch (Exception e) {
        out.print("");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
	
%>
<!-- 쿠폰 등록 폼 -->
<div class="cart-items">
  <h3 class="section-title">📬 쿠폰 등록</h3>
  <form method="post" action="mypage.jsp" style="display: flex; gap: 10px; align-items: center;">
    <input type="text" name="couponInput" placeholder="쿠폰 코드를 입력하세요" 
           style="padding: 10px; font-size: 16px; flex: 1; border: 1px solid #ccc; border-radius: 4px;">
    <button type="submit" name="registerCoupon" value="true" class="coupon-btn">
      등록
    </button>
  </form>
</div>


</div>
<div style="margin-bottom: 160px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>