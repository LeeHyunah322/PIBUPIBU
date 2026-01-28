<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>회원 정보 삭제</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
        }

        .admin-header {
            background-color: #1EB980;
            color: white;
            padding: 40px 0;
            margin-bottom: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .admin-header h1 {
            font-size: 36px;
            margin: 0;
            font-weight: bold;
            letter-spacing: 1px;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 14px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button-group {
            margin-top: 30px;
        }

        .button-group a {
            display: inline-block;
            margin: 10px;
            padding: 12px 30px;
            background-color: #1EB980;
            color: white;
            border-radius: 30px;
            font-weight: bold;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button-group a.cancel-btn {
            background-color: #6c757d;
        }

        .button-group a:hover {
            background-color: #17a36d;
        }

        .button-group a.cancel-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>회원 정보 삭제 확인</h1>
</div>

<%
try {
    String DB_URL = "jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String key = request.getParameter("id");

    String jsql = "SELECT * FROM member WHERE memId = ?";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, key);

    ResultSet rs = pstmt.executeQuery();
    rs.next();

    String id = rs.getString("memId");
    String passwd = rs.getString("memPasswd");
    String name = rs.getString("memName");
    Date birth = rs.getDate("memBirth");
    String solar = rs.getString("memSolar");
    String address = rs.getString("memAddress");
    String phone = rs.getString("memPhone");
    String sex = rs.getString("memSex");
    String postcode = rs.getString("postcode");
    String detailAddress = rs.getString("detailAddress");
%>

<h3>다음의 회원 정보를 삭제하시겠습니까?</h3>

<table>
    <tr><th>ID</th><td><%=id%></td></tr>
    <tr><th>비밀번호</th><td><%=passwd%></td></tr>
    <tr><th>성명</th><td><%=name%></td></tr>
    <tr><th>생년월일</th><td><%=birth%> (<%=solar%>)</td></tr>
    <tr><th>휴대폰</th><td><%=phone%></td></tr>
    <tr><th>주소</th><td><%=address%></td></tr>
    <tr><th>상세주소</th><td><%=detailAddress%></td></tr>
    <tr><th>우편번호</th><td><%=postcode%></td></tr>
    <tr><th>성별</th><td><%=sex%></td></tr>
</table>

<div class="button-group">
    <a href="deleteMemberResult.jsp?id=<%=id%>"><i class="fas fa-trash-alt"></i> 삭제</a>
    <a href="selectAllMember.jsp" class="cancel-btn"><i class="fas fa-times"></i> 취소</a>
</div>

<%
} catch (Exception e) {
    out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
}
%>

</body>
</html>
