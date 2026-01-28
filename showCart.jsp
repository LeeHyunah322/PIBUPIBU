<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  if (session.getAttribute("sid") == null) {
    response.sendRedirect("login.jsp?redirect=showCart.jsp");
    return;
  }
  String loginId = (String)session.getAttribute("sid");
%>

<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*, java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>

<html>
<head>
  <title>장바구니</title>
  <style>
  .wrapper { 
   font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 30px;
      background-color: #fff;
    }

    h1 {
      text-align: center;
      color: #1EB980;
      margin-bottom: 40px;
	  margin-top: 5px;
    }

    .cart-table {
      width: 95%;
      max-width: 1200px;
      margin: auto;
      border-collapse: collapse;
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    th, td {
      padding: 15px;
      text-align: center;
      font-size: 20px;
    }

    th {
      background-color: #B8D5BD;
      color: #fff;
    }

    td img {
      width: 80px;
      border-radius: 6px;
    }

    .qty-controls {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 8px;
    }

    .qty-btn {
      padding: 4px 10px;
      background: #B8D5BD;
      border: none;
      border-radius: 4px;
      cursor: pointer;
	  margin-top: 20px;
    }

    .delete-link {
      color: red;
      font-weight: bold;
      text-decoration: none;
    }

    .delete-link:hover {
      text-decoration: underline;
    }

    .total-row {
      font-weight: bold;
      background-color: #fdf5f5;
      color: #c0392b;
    }
	.total-row td:last-child {
      text-align: left;
      padding-left: 55px;
    }

    .btn-area {
      text-align: center;
      margin-top: 30px;
    }

    .btn {
      padding: 12px 25px;
	   background-color: #E8F5E9;
	  color: #1AA56F;
      text-decoration: none;
      border-radius: 6px;
      font-size: 20px;
      margin: 10px;
      display: inline-block;
	  transition: all 0.3s;
	  border: none;
  cursor: pointer;
    }

    .btn:hover {
      background-color: #B8D5BD;
      color: #555;
    }

    .empty-cart {
      text-align: center;
      margin-top: 100px;
    }

    .empty-cart img {
      width: 120px;
      opacity: 0.5;
    }

    .empty-cart p {
      font-size: 20px;
      color: #1EB980;
      margin: 20px 0;
    }

    @media (max-width: 768px) {
      .cart-table, th, td {
        font-size: 12px;
      }

      td img {
        width: 60px;
      }

      .qty-btn {
        padding: 2px 8px;
      }
    }
  </style>
</head>
<body>
<div style="margin-top: 140px;"></div>
<%@ include file="header.jsp" %>
<div class="wrapper">
<h1>🛒 장바구니</h1>

<%
try {
  String DB_URL = "jdbc:mysql://localhost:3306/project";
  String DB_ID = "root";
  String DB_PASSWORD = "1234";

  Class.forName("org.gjt.mm.mysql.Driver");
  Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

  String memId = (String)session.getAttribute("sid");
  String jsql = "SELECT * FROM cart WHERE memId = ?";
  PreparedStatement pstmt = con.prepareStatement(jsql);
  pstmt.setString(1, memId);

  ResultSet rs = pstmt.executeQuery();

   if (!rs.next()) {
%>
  <div class="empty-cart">
    <p>장바구니가 비어 있어요!<br>원하는 상품을 담아보세요 </p>
    <a href="viewProduct.jsp" class="btn">구경하러 가기</a>
  </div>
<%
    } else {
        List<Map<String, Object>> cartItems = new ArrayList<>();
        String jsql2 = "SELECT prdNo, prdName, price, prdImage, ctQty FROM cart WHERE memId = ?";
        PreparedStatement pstmt2 = con.prepareStatement(jsql2);
        pstmt2.setString(1, memId);
        ResultSet rs2 = pstmt2.executeQuery();

        int total = 0;
        while (rs2.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("prdNo", rs2.getString("prdNo"));
            item.put("prdName", rs2.getString("prdName"));
            item.put("prdPrice", rs2.getInt("price"));
            item.put("prdImage", rs2.getString("prdImage"));
            item.put("ctQty", rs2.getInt("ctQty"));
            cartItems.add(item);  

            String prdNo = rs2.getString("prdNo");
            String prdName = rs2.getString("prdName");
            int prdPrice = rs2.getInt("price");
            String prdImage = rs2.getString("prdImage");
            int ctQty = rs2.getInt("ctQty");

            int amount = prdPrice * ctQty;
            total += amount;
        }

        session.setAttribute("cartItems", cartItems);

%>
  <table class="cart-table">
    <tr>
      <th>이미지</th>
      <th>상품명</th>
      <th>단가</th>
      <th>수량</th>
      <th>금액</th>
      <th>삭제</th>
    </tr>

    <%
  
    for (Map<String, Object> item : cartItems) {
        String prdNo = (String) item.get("prdNo");
        String prdName = (String) item.get("prdName");
        int prdPrice = (int) item.get("prdPrice");
        String prdImage = (String) item.get("prdImage");
        int ctQty = (int) item.get("ctQty");

        int amount = prdPrice * ctQty;
    %>
    <tr>
      <td>
  <a href="viewDetailProduct.jsp?prdNo=<%= prdNo %>">
    <img src="images/<%= prdImage %>" alt="상품 이미지">
  </a>
</td>
<td>
  <a href="viewDetailProduct.jsp?prdNo=<%= prdNo %>" style="color:#1AA56F; text-decoration:none; font-weight:bold;">
    <%= prdName %>
  </a>
</td>
      <td><%= String.format("%,d", prdPrice) %> 원</td>
      <td>
  <div class="qty-controls">
    <form action="updateCart.jsp" method="post" style="display:inline;">
      <input type="hidden" name="prdNo" value="<%= prdNo %>">
      <input type="hidden" name="mode" value="minus">
      <button type="submit" class="qty-btn">-</button>
    </form>
    <span><%= ctQty %></span>
    <form action="updateCart.jsp" method="post" style="display:inline;">
      <input type="hidden" name="prdNo" value="<%= prdNo %>">
      <input type="hidden" name="mode" value="plus">
      <button type="submit" class="qty-btn">+</button>
    </form>
  </div>
</td>

      <td><%= String.format("%,d", amount) %> 원</td>
      <td><a href="deleteCart.jsp?prdNo=<%= prdNo %>" class="delete-link">삭제</a></td>
    </tr>
    <% } %>

    <tr class="total-row">
      <td colspan="4">전체 금액</td>
      <td colspan="2"><%= String.format("%,d", total) %> 원</td>

    </tr>
  </table>

  <div class="btn-area">
    <form action="deleteAllCart.jsp" method="post" style="display:inline;">
  <button type="submit" class="btn">장바구니 비우기</button>
</form>
    <a href="orderForm.jsp" class="btn">주문하기</a>
	<a href="viewProduct.jsp" class="btn">상품 보러가기</a>
  </div>
<%
    }
} catch (Exception e) {
    out.println("에러 발생: " + e.getMessage());
}
%>

</div>
</div>
<div style="margin-bottom: 180px;"></div>
<%@ include file="footer.jsp" %>

</body>
</html>