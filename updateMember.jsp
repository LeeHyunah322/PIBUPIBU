<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>회원 정보 수정</title>
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

        input[type="text"], input[type="radio"] {
            font-size: 14px;
            padding: 6px;
        }

        input[type="submit"] {
            background-color: #1EB980;
            color: white;
            border: none;
            padding: 12px 30px;
            margin-top: 20px;
            border-radius: 30px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #17a36d;
        }

        .admin-main-button {
            margin-top: 30px;
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
            text-decoration: none;
        }

        .admin-main-button a:hover {
            background-color: #17a36d;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>회원 정보 수정</h1>
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
    String phone = rs.getString("memPhone");
    String address = rs.getString("memAddress");
    String detailAddress = rs.getString("detailAddress");
    String postcode = rs.getString("postcode");
    String sex = rs.getString("memSex");

    String[] birthArr = birth.toString().split("-");
    String[] phoneArr = phone.split("-");
%>

<form method="post" action="updateMemberResult.jsp">
<table>
    <tr><th>ID</th>
        <td><input type="hidden" name="id" value="<%=id%>"><%=id%></td>
    </tr>
    <tr><th>비밀번호</th>
        <td><input type="text" name="passwd" value="<%=passwd%>"></td>
    </tr>
    <tr><th>성명</th>
        <td><input type="text" name="name" value="<%=name%>"></td>
    </tr>
    <tr><th>생년월일</th>
        <td>
            <input type="text" name="birthYear" value="<%=birthArr[0]%>" size="4">년
            <input type="text" name="birthMonth" value="<%=birthArr[1]%>" size="2">월
            <input type="text" name="birthDay" value="<%=birthArr[2]%>" size="2">일
            <br>
            <input type="radio" name="solar" value="양력" <%=solar.equals("양력") ? "checked" : "" %>> 양력
            <input type="radio" name="solar" value="음력" <%=solar.equals("음력") ? "checked" : "" %>> 음력
        </td>
    </tr>
    <tr><th>휴대폰</th>
        <td>
            <input type="text" name="hp1" value="<%=phoneArr[0]%>" size="3"> -
            <input type="text" name="hp2" value="<%=phoneArr[1]%>" size="4"> -
            <input type="text" name="hp3" value="<%=phoneArr[2]%>" size="4">
        </td>
    </tr>
    <tr><th>주소</th>
        <td><input type="text" name="address" value="<%=address%>" size="50"></td>
    </tr>
    <tr><th>상세주소</th>
        <td><input type="text" name="detailAddress" value="<%=detailAddress%>" size="50"></td>
    </tr>
    <tr><th>우편번호</th>
        <td><input type="text" name="postcode" value="<%=postcode%>"></td>
    </tr>
    <tr><th>성별</th>
        <td>
            <input type="radio" name="sex" value="남" <%=sex.equals("남") ? "checked" : "" %>> 남
            <input type="radio" name="sex" value="여" <%=sex.equals("여") ? "checked" : "" %>> 여
        </td>
    </tr>
</table>

<input type="submit" value="수정 완료">
</form>

<div class="admin-main-button">
    <a href="selectAllMember.jsp">
        <i class="fas fa-home"></i> 회원목록으로
    </a>
</div>

<%
} catch (Exception e) {
    out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
}
%>

</body>
</html>
