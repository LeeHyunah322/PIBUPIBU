<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>상품 삭제 확인</title>
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

        td img {
            width: 300px;
            height: 300px;
            object-fit: cover;
            border-radius: 12px;
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

        .button-group a.cancel-btn {
            background-color: #6c757d;
        }

        .button-group a:hover {
            background-color: #17a36d;
        }

        .button-group a.cancel-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>상품 삭제 확인</h1>
</div>

<%
try {
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String key = request.getParameter("prdNo");

    String jsql = "SELECT * FROM GOODS WHERE prdNo = ?";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, key);

    ResultSet rs = pstmt.executeQuery();
    rs.next();

    String no = rs.getString("prdNo");
    String name = rs.getString("prdName");
    int price = rs.getInt("prdPrice");
    int stock = rs.getInt("prdStock");
    String description = rs.getString("prdDescription");
    String ctg = rs.getString("ctgType");
%>

<h3>다음 상품 정보를 삭제하시겠습니까?</h3>

<table>
    <tr>
        <th>카테고리 분류</th><td><%=ctg%></td>
        <td rowspan="6"><img src="images/<%=no%>.jpg" alt="상품 이미지"></td>
    </tr>
    <tr><th>상품번호</th><td><%=no%></td></tr>
    <tr><th>상품명</th><td><%=name%></td></tr>
    <tr><th>상품가격</th><td><%=price%> 원</td></tr>
    <tr><th>재고수량</th><td><%=stock%> 개</td></tr>
    <tr><th>상품설명</th><td><%=description%></td></tr>
</table>

<div class="button-group">
    <a href="deleteGoodsResult.jsp?prdNo=<%=no%>"><i class="fas fa-trash-alt"></i> 삭제</a>
    <a href="selectAllGoods.jsp" class="cancel-btn"><i class="fas fa-times"></i> 취소</a>
</div>

<%
} catch (Exception e) {
    out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
}
%>

</body>
</html>
