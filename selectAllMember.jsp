<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>전체 회원 조회</title>
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
            width: 95%;
            max-width: 1220px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 14px;
        }

        th {
            background-color: #1EB980;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9f7ef;
        }

        a {
            text-decoration: none;
            color: #1EB980;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .admin-main-button {
            margin-top: 40px;
        }

        .admin-main-button a {
            display: inline-block;
            padding: 12px 30px;
            background-color: #1EB980;
            color: white;
            border-radius: 30px;
            font-weight: bold;
            font-size: 18px;
            transition: all 0.3s;
            margin-bottom: 50px;
        }

        .admin-main-button a:hover {
            background-color: #17a36d;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>PIBUPIBU 전체 회원 조회</h1>
</div>

<%
try {
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String jsql = "SELECT * FROM member";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    ResultSet rs = pstmt.executeQuery();
%>

<table>
    <tr>
        <th>ID</th><th>비밀번호</th><th>성명</th><th>생년월일</th><th>양력/음력</th>
        <th>전화</th><th>주소</th><th>상세주소</th><th>우편번호</th><th>성별</th>
        <th>수정</th><th>삭제</th>
    </tr>

<%
    while(rs.next()) {
        String id = rs.getString("memId");
        String passwd = rs.getString("memPasswd");
        String name = rs.getString("memName");
        Date birth = rs.getDate("memBirth");
        String solar = rs.getString("memSolar");
        String phone = rs.getString("memPhone");
        String address = rs.getString("memAddress");
        String detailAddress = rs.getString("detailAddress");
        String postcode = rs.getString("postcode");
        String sex = rs.getString("memSex");
%>
    <tr>
        <td><a href="updateMember.jsp?id=<%=id%>"><%=id%></a></td>
        <td><%=passwd%></td>
        <td><%=name%></td>
        <td><%=birth%></td>
        <td><%=solar%></td>
        <td><%=phone%></td>
        <td><%=address%></td>
        <td><%=detailAddress%></td>
        <td><%=postcode%></td>
        <td><%=sex%></td>
        <td><a href="updateMember.jsp?id=<%=id%>">수정</a></td>
        <td><a href="deleteMember.jsp?id=<%=id%>">삭제</a></td>
    </tr>
<%
    }
%>
</table>

<div class="admin-main-button">
    <a href="member.jsp">
        <i class="fas fa-home"></i> 회원관리 홈으로
    </a>
</div>

<%
} catch (Exception e) {
    out.println(e);
}
%>

</body>
</html>
