<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ include file="DBConnection.jsp" %>

<%
    int qnaId = Integer.parseInt(request.getParameter("qnaId"));

    String sql = "DELETE FROM qna WHERE qnaId = ?";
    try (Connection conn = DriverManager.getConnection(url, user, password);
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, qnaId);
        pstmt.executeUpdate();
    }

    response.sendRedirect("adminQna.jsp");
%>
