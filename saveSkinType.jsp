<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.UUID" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
	
    String DB_URL = "jdbc:mysql://localhost:3306/project?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    String skinType = request.getParameter("result");
    String skinIssue = request.getParameter("skinIssue");
    String recProductId = request.getParameter("recProductId");


    String testNo = java.util.UUID.randomUUID().toString();
    String userId = (String) session.getAttribute("sid");
    try {
        Class.forName("org.gjt.mm.mysql.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

        String sql = "INSERT INTO skintest (testNo, userId, testDate, skinType, skinIssue, recProductId) VALUES (?, ?, NOW(), ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, testNo);
        pstmt.setString(2, userId);
        pstmt.setString(3, skinType);
        pstmt.setString(4, skinIssue != null ? skinIssue : "");
        pstmt.setString(5, recProductId != null ? recProductId : "");

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.print("✅ 피부 테스트 결과 저장 성공! (당신의 피부 타입: " + skinType + ")");
        } else {
            out.print("❌ 데이터 저장 실패!");
        }
    } catch (Exception e) {
        out.print("❌ 오류 발생: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>


