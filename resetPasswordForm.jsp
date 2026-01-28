<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
%>
<html>
<head>
    <title>비밀번호 재설정</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 60px 20px;
        }
        .container {
            max-width: 400px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border: 1px solid #cde5d1;
        }
        h2 {
            text-align: center;
            color: #1EB980;
            margin-bottom: 25px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            margin-bottom: 15px;
            border: 1px solid #cde5d1;
            border-radius: 6px;
        }
        .btn-submit {
            width: 100%;
            background-color: #1EB980;
            color: white;
            font-size: 18px;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #159d6d;
        }
    </style>
</head>
<body>
<div style="margin-top: 200px;"></div>
<jsp:include page="header.jsp" />
<div class="container">
    <h2>비밀번호 재설정</h2>
    <form action="updatePassword.jsp" method="post">
        <input type="text" name="userId" value="<%= userId %>" readonly>
        <input type="password" name="newPassword" placeholder="새 비밀번호" required>
        <input type="password" name="confirmPassword" placeholder="비밀번호 확인" required>
        <button type="submit" class="btn-submit">비밀번호 변경</button>
    </form>
</div>
<div style="margin-bottom: 145px;"></div>
<jsp:include page="footer.jsp" />
</body>
</html>
