<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String userId = request.getParameter("userId");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if (newPassword == null || confirmPassword == null || !newPassword.equals(confirmPassword)) {
%>
    <script>
        alert("❌ 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
        history.back();
    </script>
<%
    return;
}

String DB_URL = "jdbc:mysql://localhost:3306/project";
String DB_ID = "root";
String DB_PASSWORD = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String sql = "UPDATE member SET memPasswd = ? WHERE memId = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, newPassword);
    pstmt.setString(2, userId);

    int result = pstmt.executeUpdate();

    if (result > 0) {
%>
    <script>
        alert("✅ 비밀번호가 성공적으로 변경되었습니다!");
        location.href = "login.jsp";
    </script>
<%
    } else {
%>
    <script>
        alert("❌ 사용자 정보를 찾을 수 없습니다.");
        history.back();
    </script>
<%
    }

} catch (Exception e) {
%>
    <script>
        alert("서버 오류 발생: <%= e.getMessage() %>");
        history.back();
    </script>
<%
} finally {
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>
