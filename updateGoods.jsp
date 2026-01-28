<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 정보 수정</title>
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

        form {
            background: white;
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            text-align: left;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px;
            vertical-align: middle;
        }

        td input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        img.product-img {
            width: 300px;
            height: 300px;
            object-fit: cover;
            border-radius: 12px;
            margin-left: 20px;
        }

        .detail-img {
            margin-top: 40px;
        }

        .detail-img img {
            width: 100%;
            max-width: 700px;
            height: auto;
            border-radius: 12px;
        }

        .submit-btn {
            margin-top: 30px;
            text-align: center;
        }

        .submit-btn input[type="submit"] {
            background-color: #1EB980;
            color: white;
            border: none;
            padding: 14px 40px;
            font-size: 18px;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn input[type="submit"]:hover {
            background-color: #159c6d;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>상품 정보 수정</h1>
</div>

<%
try {
    String DB_URL="jdbc:mysql://localhost:3306/project";
    String DB_ID="root";
    String DB_PASSWORD="1234";

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
    String summary = rs.getString("prdSummary");
    String description = rs.getString("prdDescription");
    String ctg = rs.getString("ctgType");
%>

<form method="post" action="updateGoodsResult.jsp">
    <table>
        <tr>
            <td>카테고리 분류</td>
            <td><input type="text" name="ctg" value="<%=ctg%>"></td>
            <td rowspan="7" style="text-align:center;">
                <img src="images/<%=no%>.jpg" class="product-img" alt="상품 이미지">
            </td>
        </tr>
        <tr>
            <td>상품번호</td>
            <td><input type="hidden" name="no" value="<%=no%>"><%=no%></td>
        </tr>
        <tr>
            <td>상품명</td>
            <td><input type="text" name="name" value="<%=name%>"></td>
        </tr>
        <tr>
            <td>상품가격</td>
            <td><input type="text" name="price" value="<%=price%>"> 원</td>
        </tr>
        <tr>
            <td>재고수량</td>
            <td><input type="text" name="stock" value="<%=stock%>"> 개</td>
        </tr>
        <tr>
            <td>간략설명</td>
            <td><input type="text" name="summary" value="<%=summary%>"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea name="description" rows="5"><%=description%></textarea></td>
        </tr>
    </table>

    <div class="detail-img">
        <img src="images/<%=no%>_detail.jpg" alt="상세 이미지">
    </div>

    <div class="submit-btn">
        <input type="submit" value="수정 완료">
    </div>
</form>

<%
} catch (Exception e) {
    out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
}
%>

</body>
</html>
