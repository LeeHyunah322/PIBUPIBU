<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전체 등록상품 조회</title>
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

        .filter-section {
            margin-bottom: 30px;
        }

        .filter-section label {
            font-size: 18px;
            font-weight: bold;
            margin-right: 10px;
        }

        .filter-section select {
            padding: 8px 14px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        table {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            font-size: 14px;
            text-align: center;
            line-height: 1.5;
        }

        th {
            background-color: #E8F5E9;
            color: #1EB980;
        }

        td img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 6px;
        }

        td.description {
            text-align: left;
            padding: 12px;
        }

        .button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #1EB980;
            color: white;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 13px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #17a36d;
        }

        .links {
            margin-top: 40px;
        }

        .links .button {
            margin: 0 10px;
            font-size: 15px;
            padding: 10px 20px;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>전체 등록상품 조회</h1>
</div>

<div class="filter-section">
    <label for="ctgFilter">피부타입 선택:</label>
    <select id="ctgFilter" onchange="location.href='selectAllGoods.jsp?ctgType=' + this.value">
        <option value="">전체</option>
        <option value="category1" <%= "category1".equals(request.getParameter("ctgType")) ? "selected" : "" %>>건성</option>
        <option value="category2" <%= "category2".equals(request.getParameter("ctgType")) ? "selected" : "" %>>지성</option>
        <option value="category3" <%= "category3".equals(request.getParameter("ctgType")) ? "selected" : "" %>>중성</option>
        <option value="category4" <%= "category4".equals(request.getParameter("ctgType")) ? "selected" : "" %>>민감성</option>
        <option value="category5" <%= "category5".equals(request.getParameter("ctgType")) ? "selected" : "" %>>복합성</option>
    </select>
</div>

<table>
    <tr>
        <th>상품사진</th>
        <th>카테고리</th>
        <th>상품번호</th>
        <th>상품명</th>
        <th>가격</th>
        <th>재고</th>
        <th>간략설명</th>
        <th>상세설명</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>

<%
try {
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    String ctgType = request.getParameter("ctgType");
    String jsql = "SELECT * FROM GOODS";
    PreparedStatement pstmt;

    if (ctgType != null && !ctgType.trim().equals("")) {
        jsql += " WHERE ctgType = ?";
        pstmt = con.prepareStatement(jsql);
        pstmt.setString(1, ctgType);
    } else {
        pstmt = con.prepareStatement(jsql);
    }

    ResultSet rs = pstmt.executeQuery();

    while(rs.next()) {
        String ctg = rs.getString("ctgType");
        String no = rs.getString("prdNo");
        String name = rs.getString("prdName");
        int price = rs.getInt("prdPrice");
        int stock = rs.getInt("prdStock");
        String summary = rs.getString("prdSummary");
        String description = rs.getString("prdDescription");
%>
<tr>
    <td><a href="updateGoods.jsp?prdNo=<%=no%>"><img src="images/<%=no%>.jpg"></a></td>
    <td><%=ctg%></td>
    <td><%=no%></td>
    <td><a href="updateGoods.jsp?prdNo=<%=no%>"><%=name%></a></td>
    <td><%=price%> 원</td>
    <td><%=stock%> 개</td>
    <td><%=summary%></td>
    <td class="description"><%=description%></td>
    <td><a class="button" href="updateGoods.jsp?prdNo=<%=no%>">수정</a></td>
    <td><a class="button" href="deleteGoods.jsp?prdNo=<%=no%>">삭제</a></td>
</tr>
<%
    }
    rs.close();
    pstmt.close();
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
</table>

<div class="links">
    <a class="button" href="insertGoods.jsp"><i class="fas fa-plus-square"></i> 신규 상품 추가</a>
    <a class="button" href="manager_index.jsp"><i class="fas fa-home"></i> 관리자 메인으로</a>
</div>

</body>
</html>
