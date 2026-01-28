<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
        }

        .admin-header {
        color: #1EB980;
        margin-bottom: 40px;
    }


        .admin-menu-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .admin-menu-card {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            text-align: center;
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
	.admin-main-button {
    margin-top: 40px;
}

.admin-main-button a {
    display: inline-block;
    padding: 12px 30px;
    background-color: #1EB980;
    color: white;
    border-radius: 30px;
    font-weight: bold;
    text-decoration: none;
    font-size: 18px;
    transition: all 0.3s;
}

.admin-main-button a:hover {
    background-color: #17a36d;
}

        @media screen and (max-width: 768px) {
            .admin-menu-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
<%@ include file="adminHeader.jsp" %>
<div class="admin-header">
    <h1>회원 관리</h1>
</div>

<div class="admin-menu-grid">
    <div class="admin-menu-card">
        <a href="insertMember.jsp">
            <i class="fas fa-user-plus"></i>
            신규 회원 등록
        </a>
    </div>

    <div class="admin-menu-card">
        <a href="selectAllMember.jsp">
            <i class="fas fa-user-cog"></i>
            전체 회원 조회 / 상세 정보 수정 삭제
        </a>
    </div>
</div>
<div class="admin-main-button">
    <a href="manager_index.jsp">
        <i class="fas fa-home"></i> 관리자 메인으로
    </a>
</div>

</body>
</html>
