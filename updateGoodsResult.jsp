<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 수정 완료</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
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
            margin: 0;
            font-size: 36px;
            font-weight: bold;
        }

        table {
            width: 100%;
            max-width: 800px;
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 14px;
            text-align: center;
        }

        th {
            background-color: #E8F5E9;
            color: #1EB980;
        }

        td.description {
            text-align: left;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #1EB980;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-size: 15px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #159c6d;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>수정된 상품 정보</h1>
</div>

<%
    String no = request.getParameter("no");
    String name = request.getParameter("name");
    int price = Integer.parseInt(request.getParameter("price"));
    String summary = request.getParameter("summary");
    int stock = Integer.parseInt(request.getParameter("stock"));
    String description = request.getParameter("description");
    String ctg = request.getParameter("ctg");

try {
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String jsql = "UPDATE GOODS SET prdName=?, prdPrice=?, prdSummary=?, prdStock=?, prdDescription=?, ctgType=? WHERE prdNo=?";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, name);
    pstmt.setInt(2, price);
    pstmt.setString(3, summary);
    pstmt.setInt(4, stock);
    pstmt.setString(5, description);
    pstmt.setString(6, ctg);
    pstmt.setString(7, no);

    pstmt.executeUpdate();

    String jsql2 = "SELECT * FROM GOODS WHERE prdNo=?";
    PreparedStatement pstmt2 = con.prepareStatement(jsql2);
    pstmt2.setString(1, no);

    ResultSet rs = pstmt2.executeQuery();
    rs.next();
%>

<table>
    <tr><th>카테고리 분류</th><td><%= rs.getString("ctgType") %></td></tr>
    <tr><th>상품번호</th><td><%= rs.getString("prdNo") %></td></tr>
    <tr><th>상품명</th><td><%= rs.getString("prdName") %></td></tr>
    <tr><th>상품가격</th><td><%= rs.getInt("prdPrice") %> 원</td></tr>
    <tr><th>재고수량</th><td><%= rs.getInt("prdStock") %> 개</td></tr>
    <tr><th>간략설명</th><td><%= rs.getString("prdSummary") %></td></tr>
    <tr><th>상품설명</th><td class="description"><%= rs.getString("prdDescription") %></td></tr>
</table>

<a class="button" href="selectAllGoods.jsp">
    <i class="fas fa-list"></i> 전체 등록상품 조회
</a>

<%
    rs.close();
    pstmt.close();
    pstmt2.close();
    con.close();
} catch (Exception e) {
    out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
}
%>

</body>
</html>
