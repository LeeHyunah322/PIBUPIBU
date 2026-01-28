<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String message = null;
    String DB_URL = "jdbc:mysql://localhost:3306/project";
    String DB_ID = "root";
    String DB_PASSWORD = "1234";

    String prdNo = request.getParameter("prdNo");
    String mode = request.getParameter("mode");
    String category = request.getParameter("category");

    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD)) {
                if ("true".equals(request.getParameter("restore"))) {
                    String sql = "UPDATE goods SET prdPrice = originalPrice, discountRate = 0";
                    PreparedStatement pstmt = con.prepareStatement(sql);
                    int restored = pstmt.executeUpdate();
                    message = "✅ " + restored + "개의 상품이 원가로 복구되었습니다.";
                    pstmt.close();
                } else {
                    double discount = Double.parseDouble(request.getParameter("discount"));
                    String sql = "";
                    PreparedStatement pstmt = null;

                    if (prdNo != null && !prdNo.isEmpty()) {
                        sql = "UPDATE goods SET originalPrice = CASE WHEN originalPrice = 0 THEN prdPrice ELSE originalPrice END, prdPrice = prdPrice * ?, discountRate = ? WHERE prdNo = ?";
                        pstmt = con.prepareStatement(sql);
                        pstmt.setDouble(1, (100 - discount) / 100.0);
                        pstmt.setInt(2, (int) discount);
                        pstmt.setString(3, prdNo);
                    } else if ("category".equals(mode) && category != null && !category.isEmpty()) {
                        sql = "UPDATE goods SET originalPrice = CASE WHEN originalPrice = 0 THEN prdPrice ELSE originalPrice END, prdPrice = prdPrice * ?, discountRate = ? WHERE ctgType = ?";
                        pstmt = con.prepareStatement(sql);
                        pstmt.setDouble(1, (100 - discount) / 100.0);
                        pstmt.setInt(2, (int) discount);
                        pstmt.setString(3, category);
                    } else {
                        sql = "UPDATE goods SET originalPrice = CASE WHEN originalPrice = 0 THEN prdPrice ELSE originalPrice END, prdPrice = prdPrice * ?, discountRate = ?";
                        pstmt = con.prepareStatement(sql);
                        pstmt.setDouble(1, (100 - discount) / 100.0);
                        pstmt.setInt(2, (int) discount);
                    }

                    int updated = pstmt.executeUpdate();
                    message = "✅ " + updated + "개의 상품 가격이 할인 적용되었습니다.";
                    pstmt.close();
                }
            }
        } catch (Exception e) {
            message = "❌ 오류 발생: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 할인 관리</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        background-color: #f8f9fa;
        color: #333;
        text-align: center;
    }
    .admin-header {
        color: #1EB980;
        margin-bottom: 40px;
    }
    .form-box {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        max-width: 500px;
        margin: auto;
    }
    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
    }
    select, input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        border: 1px solid #ddd;
        border-radius: 6px;
    }
    button {
        margin-top: 20px;
        padding: 12px 20px;
        background: #1EB980;
        color: #fff;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
    }
    button:hover {
        background: #159c6d;
    }
    .restore-btn {
        background-color: #FF7043;
        margin-top: 10px;
    }
    .restore-btn:hover {
        background-color: #e0552d;
    }
    .message {
        margin-top: 20px;
        font-weight: bold;
        color: #2E7D32;
    }
	.form-buttons {
		margin-top: 40px;
		text-align: center;
	}

	.form-buttons a {
		display: inline-block;
		padding: 12px 24px;
		background-color: #1EB980;
		color: white;
		text-decoration: none;
		border-radius: 30px;
		font-weight: bold;
		font-size: 16px;
		transition: background 0.3s;
	}

	.form-buttons a:hover {
		background-color: #159c6d;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<%@ include file="adminHeader.jsp" %>

<div class="admin-header">
    <h1>상품 할인 관리</h1>
</div>

<div class="form-box">
    <form method="post">
        <label>할인 비율 (%)</label>
        <input type="number" name="discount" min="1" max="99" required placeholder="예: 10 → 10% 할인">

        <label>할인 대상 선택</label>
        <select name="mode" id="mode" onchange="toggleCategory()">
            <option value="all">전체 상품</option>
            <option value="category">카테고리별</option>
        </select>

        <div id="categoryBox" style="display:none;">
            <label>카테고리 선택</label>
            <select name="category">
                <option value="category1">건성</option>
                <option value="category2">지성</option>
                <option value="category3">중성</option>
                <option value="category4">민감성</option>
                <option value="category5">복합성</option>
            </select>
        </div>

        <label>상품 선택</label>
        <select name="prdNo">
            <option value="">선택 안 함</option>
            <%
            try {
                Class.forName("org.gjt.mm.mysql.Driver");
                Connection con2 = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
                Statement stmt = con2.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT prdNo, prdName FROM goods");
                while (rs.next()) {
            %>
                <option value="<%=rs.getString("prdNo")%>"><%=rs.getString("prdName")%></option>
            <%
                }
                rs.close();
                stmt.close();
                con2.close();
            } catch (Exception e) {
                out.println("<option>상품 목록 불러오기 실패</option>");
            }
            %>
        </select>

        <button type="submit">💥 할인 적용</button>
    </form>

    <form method="post" style="margin-top: 20px;">
        <input type="hidden" name="restore" value="true">
        <button type="submit" class="restore-btn">⏪ 원가 복구</button>
    </form>
	
    <% if (message != null) { %>
        <div class="message"><%= message %></div>
    <% } %>
</div>
<div class="form-buttons">
    <a href="manager_index.jsp"><i class="fas fa-home"></i> 관리자 메인으로 돌아가기</a>
</div>


<script>
function toggleCategory() {
    var mode = document.getElementById("mode").value;
    document.getElementById("categoryBox").style.display = (mode === "category") ? "block" : "none";
}
window.onload = toggleCategory;
</script>

</body>
</html>
