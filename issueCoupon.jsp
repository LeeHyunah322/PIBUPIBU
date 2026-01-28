<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.time.*" %>

<%
String memId = (String) session.getAttribute("sid");
if (memId == null) {
    out.print("❗ 로그인 후 이용해주세요.");
    return;
}

String DB_URL="jdbc:mysql://localhost:3306/project";
String DB_ID="root";
String DB_PASSWORD="1234";

Connection con = null;
PreparedStatement pstmt = null;

try {
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    // 중복 방지 (이미 발급된 쿠폰 확인)
    String checkSql = "SELECT COUNT(*) FROM coupon WHERE memId = ? AND couponCode LIKE '피부짝맞춤쿠폰%'";
    pstmt = con.prepareStatement(checkSql);
    pstmt.setString(1, memId);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    int count = rs.getInt(1);
    rs.close();
    pstmt.close();

    if (count > 0) {
        out.print("이미 쿠폰이 발급되어‎‎‎‎‎‎‎‎‎‎ 추가로 증정되지 않습니다.");
        return;
    }

    String couponCode ="피부짝맞춤쿠폰";

    int discount = 5;

    String sql = "INSERT INTO coupon (memId, couponCode, discount, expiryDate) VALUES (?, ?, ?, DATE_ADD(NOW(), INTERVAL 7 DAY))";

pstmt = con.prepareStatement(sql);
pstmt.setString(1, memId);
pstmt.setString(2, couponCode);
pstmt.setInt(3, discount);


    int result = pstmt.executeUpdate();
    if (result > 0) {
        out.print("🎁 축하합니다! 5% 할인 쿠폰이 발급되었습니다!");
    } else {
        out.print("쿠폰 발급에 실패했습니다.");
    }

} catch(Exception e) {
    e.printStackTrace();
    out.print("오류: " + e.getMessage());
} finally {
    if (pstmt != null) pstmt.close();
    if (con != null) con.close();
}
%>
