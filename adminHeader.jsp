<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
.admin-header-bar {
    background-color: #1EB980;
    color: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 30px 60px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
	border-radius: 20px;
}
.admin-logo {
    font-size: 30px;
    font-weight: 800;
    text-decoration: none;
    color: white;
}

.admin-header-bar .admin-logo {
    font-size: 24px;
    font-weight: bold;
}

.admin-header-bar nav {
    display: flex;
    gap: 60px;
}

.admin-header-bar a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    font-size: 20px;
    transition: opacity 0.2s;
}

.admin-header-bar a:hover {
    opacity: 0.8;
}

.admin-logout {
    background-color: #dc3545;
    color: #dc3545;
    padding: 6px 16px;
    border-radius: 20px;
    border: 2px solid #dc3545;
    font-weight: bold;
    text-decoration: none;
    transition: all 0.3s;
}

.admin-logout:hover {
    background-color: #dc3545;
    color: white;
}
</style>

<div class="admin-header-bar">
    <a href="manager_index.jsp" class="admin-logo">
    PIBUPIBU 관리자
</a>

    <nav>
        <a href="member.jsp"><i class="fas fa-users"></i> 회원 관리</a>
        <a href="goods.jsp"><i class="fas fa-box-open"></i> 상품 관리</a>
        <a href="adminQna.jsp"><i class="fas fa-comments"></i> QnA 답변</a>
        <a href="adminCouponRegister.jsp"><i class="fas fa-ticket-alt"></i> 쿠폰 등록</a>
        <a href="adminDiscount.jsp"><i class="fas fa-tags"></i> 할인 관리</a>
    </nav>
    <a href="logout.jsp" class="admin-logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
</div>
