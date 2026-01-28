<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
String DB_URL="jdbc:mysql://localhost:3306/project";
String DB_ID="root"; 
String DB_PASSWORD="1234";

Class.forName("org.gjt.mm.mysql.Driver");  
Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String redirect = request.getParameter("redirect"); 

String jsql = "SELECT * FROM member WHERE memId = ?";
PreparedStatement pstmt = con.prepareStatement(jsql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();

boolean loginSuccess = false;
boolean wrongPassword = false;

if (rs.next()) {
    if (pass.equals(rs.getString("memPasswd"))) {
        session.setAttribute("sid", id);
		 if (redirect != null && !redirect.trim().equals("")) {
            response.sendRedirect(redirect);
        } else {
            response.sendRedirect("index.jsp");
        }
        return;
    } else {
        wrongPassword = true;
    }
}
%>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>로그인 오류</title>
  <style>
      body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #fff;
		color: #333;
		margin: 0;
		padding: 0;
		}

	.error-box-wrapper {
		flex: 1;
		 display: flex;
		justify-content: center;
		align-items: center;
		padding: 0;
		min-height: 100vh;
		}


    .error-box {
      background-color: #fff;
      border: 1px solid #cde5d1;
      padding: 40px 30px;
      max-width: 420px;
      width: 90%;
	  height: 398px;
      border-radius: 12px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      text-align: center;
    }
	 .login-logo img {
      height: 60px;
      margin-bottom: 20px;
	 
	  
    }
    .error-box h1 {
      font-size: 24px;
      color: #1AA56F;
      margin-bottom: 20px;
    }

    .error-box p {
      font-size: 16px;
	 margin-top:60px;
      margin-bottom: 16px;
    }

    .error-box .btn-link {
      display: inline-block;
      margin: 60px 10px;
      padding: 15px 16px;
      font-size: 15px;
      background-color: #E8F5E9;
      color: #1AA56F;
      text-decoration: none;
      border-radius: 6px;
      transition: background-color 0.2s;
	  margin-top:63px;
	  
    }

    .error-box .btn-link:hover {
      background-color: #C8E6C9;
    }

    @media (max-width: 480px) {
      .error-box {
        padding: 30px 20px;
      }
      .error-box h1 {
        font-size: 20px;
      }
      .error-box p {
        font-size: 14px;
      }
      .error-box a {
        font-size: 14px;
        padding: 8px 12px;
      }
    }
  </style>
</head>
<body>
 <div class="page-wrapper">
<div style="margin-top: -163px;"></div>
<%@ include file="header.jsp" %>
<div class="error-box-wrapper">
<div class="error-box">
<div class="login-logo">
      <a href="index.jsp">
        <img src="images/logo.png" alt="PIBUPIBU 로고">
      </a>
    </div>
  <h1>로그인 오류</h1>
  <% if (wrongPassword) { %>
    <p>비밀번호가 잘못되었습니다. 다시 확인해 주세요.</p>
  <% } else { %>
    <p>아이디가 존재하지 않습니다. 다시 확인해 주세요.</p>
  <% } %>

  <a href="login.jsp" class="btn-link">로그인 페이지로 이동</a>
  <a href="index.jsp" class="btn-link">메인 페이지로 이동</a>
</div>
</div>

<div style="margin-bottom: -165px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>
