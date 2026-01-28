<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>상품 등록 완료</title>
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
            padding: 40px 0;
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

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 90%;
            max-width: 800px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 14px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button-group {
            margin-top: 30px;
        }

        .button-group a {
            display: inline-block;
            margin: 10px;
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

        .error-message {
            color: red;
            font-size: 18px;
            margin-top: 50px;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>상품 등록 완료</h1>
</div>

<%
    request.setCharacterEncoding("euc-kr");

    String ctg = request.getParameter("ctg");
    String no = request.getParameter("no");
    String name = request.getParameter("name");
    int price = Integer.parseInt(request.getParameter("price"));
    int stock = Integer.parseInt(request.getParameter("stock"));
    String summary = request.getParameter("summary");
    String description = request.getParameter("description");

    try {
        String DB_URL = "jdbc:mysql://localhost:3306/project";
        String DB_ID = "root";
        String DB_PASSWORD = "1234";

        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

        String jsql = "INSERT INTO GOODS (ctgType, prdNo, prdName, prdPrice, prdStock, prdSummary, prdDescription) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(jsql);

        pstmt.setString(1, ctg);
        pstmt.setString(2, no);
        pstmt.setString(3, name);
        pstmt.setInt(4, price);
        pstmt.setInt(5, stock);
        pstmt.setString(6, summary);
        pstmt.setString(7, description);
        pstmt.executeUpdate();
%>

<table>
    <tr><th>카테고리 분류</th><td><%=ctg%></td></tr>
    <tr><th>상품번호</th><td><%=no%></td></tr>
    <tr><th>상품명</th><td><%=name%></td></tr>
    <tr><th>상품가격</th><td><%=price%> 원</td></tr>
    <tr><th>재고수량</th><td><%=stock%> 개</td></tr>
    <tr><th>상세설명</th><td><%=summary%></td></tr>
    <tr><th>상품설명</th><td><%=description%></td></tr>
</table>

<div class="button-group">
    <a href="selectAllGoods.jsp"><i class="fas fa-box-open"></i> 전체 등록상품 조회</a>
</div>

<%
    } catch(Exception e) { 
%>
    <div class="error-message">
        에러 발생: <%=e.getMessage()%>
    </div>
<%
    }
%>

</body>
</html>
