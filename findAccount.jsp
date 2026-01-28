<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

<html>
<head>
  <title>ID / 비밀번호 찾기</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, sans-serif;
      background: #fff;
      padding: 50px;
      text-align: center;
    }
    .tab-buttons button {
      padding: 10px 20px;
      margin: 10px;
      background-color: #1EB980;
      border: none;
      color: white;
      font-weight: bold;
      border-radius: 8px;
      cursor: pointer;
	  font-size: 18px;
    }
    .form-section {
      display: none;
      margin-top: 20px;
      background: white;
      padding: 30px;
      max-width: 400px;
      margin-left: auto;
      margin-right: auto;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
	  border: 1px solid #cde5d1;
      border-radius: 10px;
    }
    .form-section.active {
      display: block;
    }
    input {
      width: 90%;
      padding: 10px;
      margin: 10px 0;
      border-radius: 6px;
      border: 1px solid #ccc;
    }
    button[type="submit"] {
      background-color: #3CA6F5;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
	  font-size: 20px;
	  margin-top :20px;
    }
	.page-title {
	  font-size: 29px;
	  margin-bottom: 30px;
	  color: #1EB980;
	  font-weight: bold;
	  letter-spacing: 1px;
	  text-align: center;
	}
	input[type="text"] {
	  font-size: 18px;        
	  padding: 12px;     
	  border-radius: 6px;
	  border: 1px solid #cde5d1;
	  width: 90%;
	  box-sizing: border-box;
	}
  </style>

  <script>
    function showSection(id) {
      document.getElementById('findId').classList.remove('active');
      document.getElementById('resetPw').classList.remove('active');
      document.getElementById(id).classList.add('active');
    }
  </script>
</head>
<body>
<div style="margin-top: 200px;"></div>
<jsp:include page="header.jsp" />
  <h2 class="page-title">아이디 / 비밀번호 찾기</h2>

  <div class="tab-buttons">
    <button onclick="showSection('findId')"> 아이디 찾기</button>
    <button onclick="showSection('resetPw')"> 비밀번호 재설정</button>
  </div>

  <div class="form-section active" id="findId">
    <form action="findIdProcess.jsp" method="post">
  <input type="text" name="name" placeholder="이름 입력" required><br>
  <input type="text" name="phone" placeholder="전화번호 입력" required><br> 
  <button type="submit">아이디 찾기</button>
</form>

  </div>

  
  <div class="form-section" id="resetPw">
    <form action="findAccount.jsp" method="post">
  <input type="hidden" name="action" value="resetPw">
  <input type="text" name="userId" placeholder="아이디 입력" required><br>
  <input type="text" name="phone" placeholder="전화번호 입력" required><br> 
  <button type="submit">비밀번호 재설정하기</button>
</form>
<%
if ("resetPw".equals(request.getParameter("action"))) {
    String userId = request.getParameter("userId");
    String phone = request.getParameter("phone");

    if (phone != null) {
        phone = phone.replaceAll("[^0-9]", "");
        if (phone.length() == 11) {
            phone = phone.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
        } else if (phone.length() == 10) {
            phone = phone.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
        }
    }

    if (userId != null && phone != null && !userId.trim().isEmpty() && !phone.trim().isEmpty()) {
        String DB_URL = "jdbc:mysql://localhost:3306/project";
        String DB_ID = "root";
        String DB_PASSWORD = "1234";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
            String sql = "SELECT * FROM member WHERE memId = ? AND memPhone = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, phone);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
%>
    <p style="color:green; font-weight:bold; margin-top:10px;"> 비밀번호 재설정 페이지로 이동해주세요.</p>
    <a href="resetPasswordForm.jsp?userId=<%= userId %>" style="color:#3CA6F5; font-weight:bold;"> 비밀번호 재설정하러 가기</a>
<%
            } else {
%>
    <p style="color:red; font-weight:bold; margin-top:10px;"> 일치하는 정보가 없습니다.</p>
<%
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
%>
    <p style="color:red;">서버 오류 발생: <%= e.getMessage() %></p>
<%
        }
    }
}
%>
  </div>
  <script>
  const action = "<%= request.getParameter("action") %>";
  if (action === "resetPw") {
    showSection("resetPw");
  }
</script>

  <div style="margin-bottom: 150px;"></div>
  <jsp:include page="footer.jsp" />
</body>
</html>
