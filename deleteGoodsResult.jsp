<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>상품 삭제 완료</title>
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
            background-color: #1EB980;
            color: white;
            padding: 50px 20px;
            margin-bottom: 50px;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .admin-header h1 {
            font-size: 36px;
            margin: 0;
            font-weight: bold;
        }

        .message {
            font-size: 24px;
            margin-top: 50px;
            margin-bottom: 30px;
        }

        .button-group {
            margin-top: 20px;
        }

        .button-group a {
            display: inline-block;
            padding: 12px 30px;
            background-color: #1EB980;
            color: white;
            border-radius: 30px;
            font-weight: bold;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button-group a:hover {
            background-color: #17a36d;
        }
    </style>

    <script>
        setTimeout(function() {
            window.location.href = "selectAllGoods.jsp";
        }, 2000);
    </script>
</head>

<body>

<div class="admin-header">
    <h1>상품 삭제 완료</h1>
</div>

<%
try {
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String key = request.getParameter("prdNo");

    String jsql = "DELETE FROM GOODS WHERE prdNo=?";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, key);

    pstmt.executeUpdate();
%>

<div class="message">
    상품이 성공적으로 삭제되었습니다.<br>
    (2초 후 상품 목록으로 이동합니다.)
</div>

<div class="button-group">
    <a href="selectAllGoods.jsp"><i class="fas fa-box-open"></i> 전체 상품 목록 보기</a>
</div>

<%
} catch (Exception e) {
%>
    <div style="color:red; margin-top:50px; font-size:18px;">
        오류 발생: <%= e.getMessage() %>
    </div>
<%
}
%>

</body>
</html>
