<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
    <title>아이디 찾기 결과</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #fff;
            padding: 100px 20px;
            text-align: center;
        }
        .result-box {
			
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
			border: 1px solid #cde5d1;
			margin-top: 100px;
			font-size:18px;
        }
		.page-title {
			font-size: 29px;
			margin-bottom: 20px;
			color: #1EB980;
			font-weight: bold;
			letter-spacing: 1px;
		}

        .btn {
            display: inline-block;
            background-color: #1EB980;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            margin-top: 20px;
			font-size:18px;
        }
        .btn:hover {
            background-color: #3CA6F5;
        }
    </style>
</head>
<body>
<div style="margin-top: 150px;"></div>
<jsp:include page="header.jsp" />
<h2 class="page-title">ID 찾기</h2>
<div class="result-box">

<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");

String DB_URL = "jdbc:mysql://localhost:3306/project";
String DB_ID = "root";
String DB_PASSWORD = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
if (phone != null) {
    phone = phone.replaceAll("[^0-9]", ""); // 숫자만 남김
    if (phone.length() == 11) {
        phone = phone.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
    } else if (phone.length() == 10) {
        phone = phone.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
    }
}

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String sql = "SELECT memId FROM member WHERE memName = ? AND memPhone = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, name);
    pstmt.setString(2, phone);
    rs = pstmt.executeQuery();

    if (rs.next()) {
%>
    <h3>✅ 회원님의 아이디는: <span style='color:#1EB980'><%= rs.getString("memId") %></span></h3>
<%
    } else {
%>
    <h3 style="color:red;">❌ 일치하는 정보가 없습니다.</h3>
<%
    }
} catch (Exception e) {
%>
    <p>오류 발생: <%= e.getMessage() %></p>
<%
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>
    <a href="findAccount.jsp" class="btn">다시 찾기</a>
</div>
<div style="margin-bottom: 280px;"></div>
<jsp:include page="footer.jsp" />
</body>
</html>
