<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>회원가입 완료</title>
    <style>
        body {
            background-color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 40px 0;
            text-align: center;
        }

        .result-box {
            display: inline-block;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #556B2F;
			font-size:29px;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            margin: 0 auto;
            font-size: 18px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        td {
            padding: 10px 15px;
        }

        .link {
            margin-top: 30px;
            display: inline-block;
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
        }

        .link:hover {
            background: #388E3C;
        }

        .error {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div style="margin-top: 200px;"></div>
<jsp:include page="header.jsp" />
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");   
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    String birth = request.getParameter("birth");
    String solar = request.getParameter("solar");

    String postcode = request.getParameter("postcode");
    String address = request.getParameter("address");
    String detailAddress = request.getParameter("detailAddress");

    String phone = request.getParameter("phone");
    String sex = request.getParameter("sex");

    try {
        String DB_URL = "jdbc:mysql://localhost:3306/project";  
        String DB_ID = "root";  
        String DB_PASSWORD = "1234"; 
        
        Class.forName("org.gjt.mm.mysql.Driver"); 
        Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

        String jsql = "INSERT INTO member (memId, memPasswd, memName, memBirth, memSolar, postcode, memAddress, detailAddress, memPhone, memSex) " +
                      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pstmt = con.prepareStatement(jsql);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        pstmt.setString(3, name);
        pstmt.setString(4, birth);
        pstmt.setString(5, solar);
        pstmt.setString(6, postcode);
        pstmt.setString(7, address);
        pstmt.setString(8, detailAddress);
        pstmt.setString(9, phone);
        pstmt.setString(10, sex);

        pstmt.executeUpdate();
        con.close();
%>

    <div class="result-box">
        <h2>회원 가입이 완료되었습니다.</h2>

        <table>
            <tr><td>ID</td><td><%=id%></td></tr>
            <tr><td>비밀번호</td><td><%=password%></td></tr>
            <tr><td>성명</td><td><%=name%></td></tr>
            <tr><td>생년월일</td><td><%=birth%> (<%=solar%>)</td></tr>
            <tr><td>우편번호</td><td><%=postcode%></td></tr>
            <tr><td>주소</td><td><%=address%></td></tr>
            <tr><td>상세 주소</td><td><%=detailAddress%></td></tr>
            <tr><td>휴대폰번호</td><td><%=phone%></td></tr>
            <tr><td>성별</td><td><%=sex%></td></tr>
        </table>

        <a href="login.jsp" class="link">로그인하러 가기</a>
    </div>

<%
    } catch (Exception e) {
%>
    <p class="error">에러 발생: <%=e.getMessage()%></p>
<%
    }
%>
<div style="margin-bottom: 80px;"></div>
<jsp:include page="footer.jsp" />
</body>
</html>
