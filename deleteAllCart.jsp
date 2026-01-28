<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  request.setCharacterEncoding("UTF-8");

  String memId = (String)session.getAttribute("sid");

  try {
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String sql = "DELETE FROM cart WHERE memId = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, memId);
    pstmt.executeUpdate();

    session.removeAttribute("cartItems");

  } catch(Exception e) {
    out.println("삭제 중 에러 발생: " + e.getMessage());
  }

  response.sendRedirect("showCart.jsp");
%>
