<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String message = null;
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    try {
        Class.forName("org.gjt.mm.mysql.Driver");
        con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

        if (request.getMethod().equalsIgnoreCase("POST")) {
            String action = request.getParameter("action");

            if ("register".equals(action)) {
                String code = request.getParameter("couponCode");
                int discount = Integer.parseInt(request.getParameter("discount"));
                int days = Integer.parseInt(request.getParameter("days"));

                String sql = "INSERT INTO public_coupon (couponCode, discount, expiryDate) VALUES (?, ?, DATE_ADD(CURDATE(), INTERVAL ? DAY))";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, code);
                pstmt.setInt(2, discount);
                pstmt.setInt(3, days);
                int result = pstmt.executeUpdate();
                message = (result > 0) ? "✅ 쿠폰 코드 등록 완료!" : "❌ 등록 실패!";
                pstmt.close();
            } else if ("delete".equals(action)) {
                String deleteCode = request.getParameter("deleteCode");
                String sql = "DELETE FROM public_coupon WHERE couponCode = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, deleteCode);
                int result = pstmt.executeUpdate();
                message = (result > 0) ? "🗑 쿠폰 삭제 완료!" : "⚠ 삭제 실패!";
                pstmt.close();
				} else if ("deleteMemberCoupon".equals(action)) {
    String deleteCode = request.getParameter("deleteCode");
    String memId = request.getParameter("memId");

    String sql = "DELETE FROM coupon WHERE couponCode = ? AND memId = ?";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, deleteCode);
    pstmt.setString(2, memId);
    int result = pstmt.executeUpdate();
    message = (result > 0) ? "🗑 회원 쿠폰 삭제 완료!" : "⚠ 삭제 실패!";
    pstmt.close();

            }
			
        }

        String selectSql = "SELECT * FROM public_coupon ORDER BY expiryDate DESC";
        pstmt = con.prepareStatement(selectSql);
        rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쿠폰 코드 등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        background-color: #f8f9fa;
        color: #333;
        text-align: center;
    }
	.admin-header {
        color: #1EB980;
        margin-bottom: 40px;
    }

	
    h2, h3 {
        color: #1EB980;
    }
    table {
        margin: auto;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px 14px;
        font-size: 14px;
    }
    th {
        background-color: #E8F5E9;
        color: #1EB980;
    }
    button {
        padding: 8px 16px;
        background: #1EB980;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
    }
    button:hover {
        background: #159c6d;
    }
    .message {
        margin-top: 20px;
        font-weight: bold;
        color: #2E7D32;
    }
    .form-buttons {
        margin-top: 40px;
        text-align: center;
    }
    .form-buttons a {
        display: inline-block;
        padding: 12px 24px;
        background-color: #1EB980;
        color: white;
        border-radius: 30px;
        font-weight: bold;
        font-size: 16px;
        text-decoration: none;
        transition: background 0.3s;
    }
    .form-buttons a:hover {
        background-color: #159c6d;
    }
    .form-buttons i {
        margin-right: 8px;
    }
</style>
</head>
<body>
<%@ include file="adminHeader.jsp" %>
<div class="admin-header">
    <h1>🎫 쿠폰 코드 등록</h1>
</div>


<form method="post" action="adminCouponRegister.jsp">
    <input type="hidden" name="action" value="register">
    <table>
        <tr>
            <td>쿠폰 코드</td>
            <td><input type="text" name="couponCode" required></td>
        </tr>
        <tr>
            <td>할인율 (%)</td>
            <td><input type="number" name="discount" min="1" max="100" required></td>
        </tr>
        <tr>
            <td>유효기간 (일)</td>
            <td><input type="number" name="days" value="7" required></td>
        </tr>
    </table>
    <br>
    <button type="submit">등록</button>
</form>

<% if (message != null) { %>
    <p class="message" style="color:<%= message.startsWith("✅") || message.startsWith("🗑") ? "#2E7D32" : "red" %>;">
        <%= message %>
    </p>
<% } %>

<hr style="margin: 40px 0;">

<h3>📋 등록된 쿠폰 목록</h3>
<table>
    <tr>
        <th>쿠폰 코드</th>
        <th>할인율</th>
        <th>유효기간</th>
        <th>삭제</th>
    </tr>
<%
    while (rs.next()) {
        String cCode = rs.getString("couponCode");
        int cDiscount = rs.getInt("discount");
        Date cExpiry = rs.getDate("expiryDate");
%>
    <tr>
        <td><%= cCode %></td>
        <td><%= cDiscount %> %</td>
        <td><%= cExpiry %></td>
        <td>
            <form method="post" action="adminCouponRegister.jsp" style="margin:0;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="deleteCode" value="<%= cCode %>">
                <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
            </form>
        </td>
    </tr>
<%
    }
%>
</table>

<h3 style="margin-top:60px;">👤 회원별 보유 쿠폰 목록</h3>
<table>
    <tr>
        <th>회원 ID</th>
        <th>쿠폰 코드</th>
        <th>할인율</th>
        <th>만료일</th>
        <th>삭제</th>
    </tr>
<%
    String memCouponSql = "SELECT * FROM coupon ORDER BY memId ASC, expiryDate DESC";
    pstmt = con.prepareStatement(memCouponSql);
    rs = pstmt.executeQuery();

    while (rs.next()) {
        String memId = rs.getString("memId");
        String code = rs.getString("couponCode");
        int discount = rs.getInt("discount");
        Date expiry = rs.getDate("expiryDate");
%>
    <tr>
        <td><%= memId %></td>
        <td><%= code %></td>
        <td><%= discount %> %</td>
        <td><%= expiry %></td>
        <td>
            <form method="post" action="adminCouponRegister.jsp" style="margin:0;">
                <input type="hidden" name="action" value="deleteMemberCoupon">
                <input type="hidden" name="deleteCode" value="<%= code %>">
                <input type="hidden" name="memId" value="<%= memId %>">
                <button type="submit" onclick="return confirm('이 회원의 쿠폰을 삭제하시겠습니까?');">삭제</button>
            </form>
        </td>
    </tr>
<%
    }
    rs.close();
%>
</table>


<div class="form-buttons">
    <a href="manager_index.jsp"><i class="fas fa-home"></i> 관리자 메인으로</a>
</div>

</body>
</html>

<%
    } catch (Exception e) {
        out.print("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>
