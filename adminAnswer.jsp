<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ include file="DBConnection.jsp" %>
<%
    int qnaId = Integer.parseInt(request.getParameter("qnaId"));
    String qnaAnswer = request.getParameter("qnaAnswer");

    String sql = "UPDATE qna SET qnaAnswer = ?, qnaStatus = 'completed' WHERE qnaId = ?";
    try (Connection conn = DriverManager.getConnection(url, user, password);
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, qnaAnswer);
        pstmt.setInt(2, qnaId);
        pstmt.executeUpdate();
        response.sendRedirect("adminQna.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>