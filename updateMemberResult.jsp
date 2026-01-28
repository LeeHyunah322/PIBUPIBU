<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>회원 정보 수정 완료</title>
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

        .button-group a:hover {
            background-color: #17a36d;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>회원 정보 수정 완료</h1>
</div>

<%
try {
    request.setCharacterEncoding("euc-kr");

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    String name = request.getParameter("name");

    String birthYear = request.getParameter("birthYear");
    String birthMonth = request.getParameter("birthMonth");
    String birthDay = request.getParameter("birthDay");
    String birth = birthYear + "-" + birthMonth + "-" + birthDay;

    String solar = request.getParameter("solar");

    String hp1 = request.getParameter("hp1");
    String hp2 = request.getParameter("hp2");
    String hp3 = request.getParameter("hp3");
    String phone = hp1 + "-" + hp2 + "-" + hp3;

    String address = request.getParameter("address");
    String detailAddress = request.getParameter("detailAddress");
    String postcode = request.getParameter("postcode");
    String sex = request.getParameter("sex");

    String DB_URL = "jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String jsql = "UPDATE member SET memPasswd=?, memName=?, memBirth=?, memSolar=?, memAddress=?, memPhone=?, memSex=?, postcode=?, detailAddress=? WHERE memId=?";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, passwd);
    pstmt.setString(2, name);
    pstmt.setString(3, birth);
    pstmt.setString(4, solar);
    pstmt.setString(5, address);
    pstmt.setString(6, phone);
    pstmt.setString(7, sex);
    pstmt.setString(8, postcode);
    pstmt.setString(9, detailAddress);
    pstmt.setString(10, id);
    pstmt.executeUpdate();

    String jsql2 = "SELECT * FROM member WHERE memId=?";
    PreparedStatement pstmt2 = con.prepareStatement(jsql2);
    pstmt2.setString(1, id);
    ResultSet rs = pstmt2.executeQuery();
    rs.next();
%>

<table>
    <tr><th>ID</th><td><%=rs.getString("memId")%></td></tr>
    <tr><th>비밀번호</th><td><%=rs.getString("memPasswd")%></td></tr>
    <tr><th>성명</th><td><%=rs.getString("memName")%></td></tr>
    <tr><th>생년월일</th><td><%=rs.getDate("memBirth")%> (<%=rs.getString("memSolar")%>)</td></tr>
    <tr><th>휴대폰</th><td><%=rs.getString("memPhone")%></td></tr>
    <tr><th>주소</th><td><%=rs.getString("memAddress")%></td></tr>
    <tr><th>상세주소</th><td><%=rs.getString("detailAddress")%></td></tr>
    <tr><th>우편번호</th><td><%=rs.getString("postcode")%></td></tr>
    <tr><th>성별</th><td><%=rs.getString("memSex")%></td></tr>
</table>

<div class="button-group">
    <a href="selectAllMember.jsp"><i class="fas fa-users"></i> 전체 회원 목록 보기</a>
    <a href="manager_index.jsp"><i class="fas fa-home"></i> 관리자 메인으로</a>
</div>

<%
} catch (Exception e) {
    out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
}
%>

</body>
</html>
