<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*" %>

<%
String prdNo = request.getParameter("prdNo");
String action = request.getParameter("mode");
String memId = (String) session.getAttribute("sid");

int delta = "plus".equals(action) ? 1 : -1;

try {
  String DB_URL = "jdbc:mysql://localhost:3306/project";
  String DB_ID = "root";
  String DB_PASSWORD = "1234";

  Class.forName("org.gjt.mm.mysql.Driver");
  Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

  // 현재 수량 확인
  String checkQtySql = "SELECT ctQty FROM cart WHERE memId = ? AND prdNo = ?";
  PreparedStatement checkPstmt = con.prepareStatement(checkQtySql);
  checkPstmt.setString(1, memId);
  checkPstmt.setString(2, prdNo);
  ResultSet rs = checkPstmt.executeQuery();

  if (rs.next()) {
    int currentQty = rs.getInt("ctQty");

    // 수량이 1이고 감소하려는 경우는 무시
    if (!(delta == -1 && currentQty <= 1)) {
      String sql = "UPDATE cart SET ctQty = ctQty + ? WHERE memId = ? AND prdNo = ?";
      PreparedStatement pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, delta);
      pstmt.setString(2, memId);
      pstmt.setString(3, prdNo);
      pstmt.executeUpdate();
    }
  }

  rs.close();
  checkPstmt.close();

  // 이제 ctQty가 0 이하인 항목은 절대 없겠지만 혹시 모르니 삭제는 유지
  String cleanupSql = "DELETE FROM cart WHERE ctQty <= 0";
  con.prepareStatement(cleanupSql).executeUpdate();

  con.close();

} catch (Exception e) {
  out.println("에러: " + e.getMessage());
}

response.sendRedirect("showCart.jsp");
%>
