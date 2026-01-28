<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ include file="DBConnection.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 QnA 관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
        }

        .admin-header {
        color: #1EB980;
        margin-bottom: 40px;
    }

        table {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 14px;
        }

        th {
            background-color: #E8F5E9;
            color: #1EB980;
        }

        textarea {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            font-size: 13px;
        }

        input[type="submit"] {
            margin-top: 8px;
            background-color: #1EB980;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #159c6d;
        }

        .links {
            margin-top: 30px;
        }

        .links a {
            display: inline-block;
            background-color: #1EB980;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 30px;
            font-weight: bold;
            font-size: 15px;
        }

        .links a:hover {
            background-color: #159c6d;
        }
    </style>
</head>

<body>
<%@ include file="adminHeader.jsp" %>
<div class="admin-header">
    <h1>미답변 QnA 목록</h1>
</div>

<table>
    <tr>
        <th>번호</th>
        <th>사용자 ID</th>
        <th>질문 내용</th>
        <th>답변 작성/수정</th>
        <th>삭제</th>
    </tr>

<%
    String sql = "SELECT * FROM qna ORDER BY qnaId DESC";

    try (Connection conn = DriverManager.getConnection(url, user, password);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {

        while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("qnaId") %></td>
    <td><%= rs.getString("userId") %></td>
    <td style="text-align:left; padding:10px;"><%= rs.getString("qnaQuestion") %></td>
    <td>
        <form action="adminAnswer.jsp" method="post">
            <input type="hidden" name="qnaId" value="<%= rs.getInt("qnaId") %>">
            <textarea name="qnaAnswer" rows="3" required><%= rs.getString("qnaAnswer") != null ? rs.getString("qnaAnswer") : "" %></textarea>
            <br>
            <input type="submit" value="<%= (rs.getString("qnaAnswer") == null || rs.getString("qnaAnswer").trim().equals("")) ? "답변 등록" : "답변 수정" %>">
        </form>
    </td>
    <td>
        <form action="adminDelete.jsp" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
            <input type="hidden" name="qnaId" value="<%= rs.getInt("qnaId") %>">
            <input type="submit" value="삭제">
        </form>
    </td>
</tr>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</table>

<div class="links">
    <a href="manager_index.jsp"><i class="fas fa-home"></i> 관리자 메인으로</a>
</div>

</body>
</html>
