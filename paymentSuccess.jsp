<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*%>

<%
request.setCharacterEncoding("UTF-8");

// ✔️ null 방지 + 중복 제거
String receiver = request.getParameter("receiver") != null ? request.getParameter("receiver") : "미입력";
String address1 = request.getParameter("address") != null ? request.getParameter("address") : "";
String address2 = request.getParameter("detailAddress") != null ? request.getParameter("detailAddress") : "";
String address = address1 + " " + address2;

String orderId = request.getParameter("orderId");
String memId = (String) session.getAttribute("sid");
String phone = request.getParameter("phone") != null ? request.getParameter("phone") : "";
String payMethod = "카카오페이";
String ordDate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
%>

<%
try {
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String sql = "INSERT INTO orderinfo (ordNo, memId, ordDate, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay) VALUES (?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, orderId);
    pstmt.setString(2, memId);
    pstmt.setString(3, ordDate);
    pstmt.setString(4, receiver);
    pstmt.setString(5, address);
    pstmt.setString(6, phone);
    pstmt.setString(7, payMethod);

    int result = pstmt.executeUpdate();

    if (result > 0) {
        out.println("<h2>✅ 결제 정보 저장 완료</h2>");
    } else {
        out.println("<h2>⚠️ 결제 정보 저장 실패</h2>");
    }

    pstmt.close();
    con.close();
} catch (Exception e) {
    out.println("<p style='color:red;'>DB 저장 오류: " + e.getMessage() + "</p>");
}
%>
