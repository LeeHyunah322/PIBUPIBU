<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>PIBUPIBU 로그인</title>
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
	  border: 1px solid #cde5d1;
      width: 100%;
      max-width: 400px;
      text-align: center;
	  
    }

    .login-logo img {
      height: 60px;
      margin-bottom: 20px;
    }

    .login-container h2 {
      color: #1EB980;
      margin-bottom: 30px;
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
      background-color: #E8F5E9;
        color: #1EB980;
      border: none;
      cursor: pointer;
    }

    .login-container button:hover {
      background-color: #C8E6C9;
    }

    .login-links {
      margin-top: 10px;
      font-size: 14px;
    }

    .login-links a {
      color: #1EB980;
      text-decoration: none;
      margin: 0 10px;
	  font-size : 15px;
      font-weight: bold;
    }

    .login-links a:hover {
      color:  #B8D5BD;
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

  .login-links {
    font-size: 13px;
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

  .login-links {
    font-size: 12px;
    display: flex;
    flex-direction: column;
    gap: 6px;
  }
}

  </style>
</head>
<body>
<div style="margin-top: -160px;"></div>
<%@ include file="header.jsp" %>
<div class="wrapper">
<div class="login-container">
  <div class="login-logo">
    <a href="index.jsp">
      <img src="images/logo.png" alt="PIBUPIBU 로고">
    </a>
  </div>

  <h2>로그인</h2>
  <form name="login" method="post" action="loginOK.jsp">
    <input type="text" name="id" placeholder="아이디" required>
    <input type="password" name="pass" placeholder="비밀번호" required>
	 <input type="hidden" name="redirect" value="<%= request.getParameter("redirect") != null ? request.getParameter("redirect") : "" %>">
    <button type="submit">로그인</button>
  </form>

  <div class="login-links">
    <a href="insertMember.jsp">회원가입</a> 
    <a href="findAccount.jsp">아이디 / 비번 찾기</a> 
  </div>
</div>
</div>
<div style="margin-bottom: -170px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>
