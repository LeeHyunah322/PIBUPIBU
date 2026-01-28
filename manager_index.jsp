<%@ page contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>관리자 로그인 결과</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
        color: #333;
    }
    
    .admin-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .admin-header {
        background-color: #1EB980;
        color: white;
        padding: 40px 0;
        text-align: center;
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
    
    .admin-info-card {
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        margin-bottom: 40px;
        text-align: center;
    }
    
    .admin-info-table {
        width: 100%;
        max-width: 500px;
        margin: 0 auto;
        border-collapse: collapse;
    }
    
    .admin-info-table td {
        padding: 15px;
        border-bottom: 1px solid #eee;
        text-align: left;
    }
    
    .admin-info-table td:first-child {
        font-weight: bold;
        color: #1EB980;
        width: 40%;
    }
    
    .admin-menu-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
        margin-bottom: 40px;
    }
    
    .admin-menu-card {
        background-color: white;
        padding: 30px;
        text-align: center;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
    }
    
    .admin-menu-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 16px rgba(0,0,0,0.15);
    }
    
    .admin-menu-card a {
        text-decoration: none;
        color: #333;
        font-size: 20px;
        font-weight: bold;
        display: block;
        height: 100%;
    }
    
    .admin-menu-card i {
        font-size: 40px;
        color: #1EB980;
        margin-bottom: 15px;
        display: block;
    }
    
    .logout-section {
        text-align: center;
        margin-top: 40px;
    }
    
    .logout-btn {
        display: inline-block;
        padding: 12px 30px;
        background-color: #fff;
        color: #dc3545;
        border: 2px solid #dc3545;
        border-radius: 30px;
        font-weight: bold;
        text-decoration: none;
        transition: all 0.3s;
    }
    
    .logout-btn:hover {
        background-color: #dc3545;
        color: white;
    }
    
    @media screen and (max-width: 768px) {
        .admin-menu-grid {
            grid-template-columns: 1fr;
        }
        
        .admin-header {
            padding: 30px 0;
        }
        
        .admin-header h1 {
            font-size: 28px;
        }
        
        .admin-menu-card {
            padding: 20px;
        }
        
        .admin-menu-card a {
            font-size: 18px;
        }
        
        .admin-menu-card i {
            font-size: 32px;
        }
    }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
<div class="admin-container">
    <div class="admin-header">
        <h1>PIBUPIBU 관리자 모드</h1>
    </div>

    <div class="admin-info-card">
        <table class="admin-info-table">
            <tr>
                <td>접속 관리자 ID:</td>
                <td><%= (String)session.getAttribute("sid") %></td>
            </tr>
            <tr>
                <td>접속 시각:</td>
                <td>
                    <%
                        java.util.Date date = new java.util.Date();
                        out.print(date.toLocaleString());
                    %>
                </td>
            </tr>
        </table>
    </div>

    <div class="admin-menu-grid">
        <div class="admin-menu-card">
            <a href="member.jsp">
                <i class="fas fa-users"></i>
                회원 관리
            </a>
        </div>
        <div class="admin-menu-card">
            <a href="goods.jsp">
                <i class="fas fa-box-open"></i>
                상품 관리
            </a>
        </div>
        <div class="admin-menu-card">
            <a href="adminQna.jsp">
                <i class="fas fa-comments"></i>
                QnA 답변
            </a>
        </div>
		
    <div class="admin-menu-card">
        <a href="adminCouponRegister.jsp">
            <i class="fas fa-ticket-alt"></i> 
            쿠폰 코드 등록
        </a>
    </div>

    <div class="admin-menu-card">
        <a href="adminDiscount.jsp">
            <i class="fas fa-tags"></i> 
            상품 할인 관리
        </a>
    </div>
</div>

    <div class="logout-section">
        <a href="logout.jsp" target="_parent" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> 관리자 로그아웃
        </a>
    </div>
</div>
</body>
</html>
</center>
</body>
</html>