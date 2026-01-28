<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String sid = (String) session.getAttribute("sid");
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
  .sticky-header {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 9999;
    background-color: white;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  }

  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 30px 40px;
    flex-wrap: wrap;
  }

  .logo img {
    height: 55px;
  }

  .center-menu {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 45px;
	flex-wrap: nowrap;     
	white-space: nowrap;  
  }

  .right-nav {
    display: flex;
    gap: 16px;
    align-items: center;
  }

  .center-menu a {
	color: #1EB980; 
	font-weight: bold;
	text-decoration: none;
	font-size: 20px;
  }
  .center-menu a:hover {
	color: #B8D5BD;
  }
  .right-nav a,
  .welcome-message {
	color: #3CA6F5; 
	font-weight: bold;
	text-decoration: none;
	font-size: 16px;
  }
  .right-nav a:hover {
	color: #88D1FF;
  }
  .right-nav a i {
	color: #3CA6F5;
	font-size: 22px; 
	margin-right: 20px; 
  }


  @media screen and (max-width: 768px) {
    .header {
      flex-direction: row;
      align-items: flex-start;
    }

    .center-menu {
      position: static;
      transform: none;
      margin: 10px 0;
      flex-wrap: wrap;
      justify-content: center;
	  margin-left: 28px;
    }

    .right-nav {
      justify-content: flex-end;
      flex-wrap: wrap;
    }
	.center-menu a{
	margin-left: -28px;
	
	}
    .center-menu a,
    .right-nav a,
    .welcome-message {
      font-size: 10px;
    }

    .logo img {
      height: 35px;
    }
  }
</style>

<div class="sticky-header">
  <div class="header">
    <div class="logo">
      <a href="index.jsp">
        <img src="images/logo.png" alt="PIBUPIBU 로고">
      </a>
    </div>

    <div class="center-menu">
      <a href="productTip.jsp">피부관리 처음이라면</a>
      <a href="skintype.jsp">피부타입찾기</a> 
      <a href="searchMaps.jsp">피부과찾기</a> 
      <a href="viewProduct.jsp?ctgType=category1">상품구매</a>
      <a href="qna.jsp">QnA</a> 
      <a href="event.jsp">EVENT</a> 
    </div>

  <div class="right-nav">
  <% if (sid == null) { %>
    <a href="login.jsp" title="로그인"><i class="fas fa-sign-in-alt"></i></a>
    <a href="login.jsp" title="장바구니"><i class="fas fa-shopping-cart"></i></a>
    <a href="login.jsp" title="마이페이지"><i class="fas fa-user-circle"></i></a>
  <% } else { %>
    <span class="welcome-message"><%= sid %>님 환영합니다!</span>
    <a href="logout.jsp" title="로그아웃"><i class="fas fa-sign-out-alt"></i></a>
    <a href="showCart.jsp" title="장바구니"><i class="fas fa-shopping-cart"></i></a>
    <a href="mypage.jsp" title="마이페이지"><i class="fas fa-user-circle"></i></a>
  <% } %>
</div>


    </div>
  </div>
</div>

<div style="margin-top: 100px;"></div>
