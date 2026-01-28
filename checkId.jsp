<%@ page contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");

    if (id == null || id.trim().equals("")) {
        out.print("ERROR: id 파라미터가 없음");
        return;
    }

    boolean isExist = false;

    try {
        String DB_URL = "jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8";
        String DB_ID = "root";
        String DB_PASSWORD = "1234";

        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

        String sql = "SELECT * FROM member WHERE memId = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) isExist = true;

        rs.close();
        pstmt.close();
        con.close();
    } catch (Exception e) {
        out.print("ERROR: " + e.getMessage());
        return;
    }

    out.print(isExist ? "EXIST" : "AVAILABLE");
%>
