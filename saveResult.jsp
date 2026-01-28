<%@ page import="java.sql.*, java.util.UUID" %>
<%@ include file="dbConnection.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String testNo = UUID.randomUUID().toString();
    String userId = request.getParameter("user_id");
    int oily = Integer.parseInt(request.getParameter("oily"));
    int dry = Integer.parseInt(request.getParameter("dry"));
    int normal = Integer.parseInt(request.getParameter("normal"));
    int sensitive = Integer.parseInt(request.getParameter("sensitive"));
    int combination = Integer.parseInt(request.getParameter("combination"));


    int maxScore = Math.max(oily, Math.max(dry, Math.max(normal, Math.max(sensitive, combination))));
    String skinType = "";

    if (maxScore == oily) skinType = "지성 피부";
    else if (maxScore == dry) skinType = "건성 피부";
    else if (maxScore == normal) skinType = "중성 피부";
    else if (maxScore == sensitive) skinType = "민감성 피부";
    else if (maxScore == combination) skinType = "복합성 피부";

    String skinIssue = request.getParameter("skin_issue");  
    String recProductId = request.getParameter("rec_product_id"); 
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = getConnection();
        String sql = "INSERT INTO skinTest (testNo, userId, skinType, skinIssue, recProductId) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, testNo);
        pstmt.setString(2, userId);
        pstmt.setString(3, skinType);
        pstmt.setString(4, skinIssue);
        pstmt.setString(5, recProductId);
        pstmt.executeUpdate();
%>
    <h2>결과 저장 완료!</h2>
    <p><b><%= userId %></b>님의 피부 타입은 <b><%= skinType %></b> 입니다.</p>
    <a href="index.jsp">다시 테스트하기</a>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>