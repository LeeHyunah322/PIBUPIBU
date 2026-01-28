<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>PIBUPIBU 관리자 로그인</title>
  <style>
    .wrapper{
      background-color:#fff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin-top: -40px;
      padding : 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      background-color: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      border: 1px solid #ffcccc; /* 일반 로그인과 색상 차이 */
      width: 100%;
      max-width: 400px;
      text-align: center;
      position: relative;
    }

    .admin-warning {
      background-color: #fff3f3;
      color: #d32f2f;
      padding: 12px;
      border-radius: 6px;
      margin-bottom: 25px;
      font-size: 14px;
      border-left: 4px solid #d32f2f;
    }

    .login-logo img {
      height: 60px;
      margin-bottom: 20px;
    }

    .login-container h2 {
      color: #d32f2f; /* 일반 로그인과 색상 차이 */
      margin-bottom: 15px;
    }

    .login-container input[type="text"],
    .login-container input[type="password"],
    .login-container button {
      width: 100%;
      padding: 14px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 15px;
      box-sizing: border-box;
    }

    .login-container button {
      background-color: #ffebee;
      color: #d32f2f; /* 일반 로그인과 색상 차이 */
      border: none;
      cursor: pointer;
      font-weight: bold;
    }

    .login-container button:hover {
      background-color: #ffcdd2;
    }

    .admin-label {
      position: absolute;
      top: -10px;
      right: 20px;
      background-color: #d32f2f;
      color: white;
      padding: 5px 15px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: bold;
    }

    @media screen and (max-width: 768px) {
      .login-container {
        padding: 30px 20px;
        max-width: 90%;
      }

      .login-container h2 {
        font-size: 24px;
      }

      .login-container input,
      .login-container button {
        font-size: 14px;
        padding: 12px;
      }
    }

    @media screen and (max-width: 480px) {
      .wrapper {
        padding: 0 10px;
      }

      .login-container {
        padding: 24px 16px;
      }

      .login-logo img {
        height: 50px;
      }

      .login-container h2 {
        font-size: 22px;
      }

      .login-container input,
      .login-container button {
        font-size: 13px;
        padding: 10px;
      }
      
      .admin-warning {
        font-size: 13px;
        padding: 10px;
      }
    }
  </style>
  <script language="javascript" src="js_package.js"></script>
</head>
<body onLoad="login_focus()">
<div style="margin-top: -160px;"></div>
<%@ include file="header.jsp" %>
<div class="wrapper">
  <div class="login-container">
    <div class="admin-label">관리자 전용</div>
    <div class="login-logo">
      <a href="index.jsp">
        <img src="images/logo.png" alt="PIBUPIBU 로고">
      </a>
    </div>

    <h2>관리자 로그인</h2>
    
    <div class="admin-warning">
      ⚠️ 이 페이지는 관리자 전용입니다. 일반 사용자는 <a href="login.jsp" style="color: #d32f2f; font-weight: bold;">일반 로그인</a>을 이용해주세요.
    </div>
    
    <form name="login" method="post" action="manager_loginOK.jsp" target="_parent">
      <input type="text" name="id" placeholder="관리자 ID" required>
      <input type="password" name="pass" placeholder="비밀번호" required onkeydown="onEnterSubmit()">
      <button type="button" onclick="login_check()">관리자 로그인</button>
    </form>
  </div>
</div>
<div style="margin-bottom: -170px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>