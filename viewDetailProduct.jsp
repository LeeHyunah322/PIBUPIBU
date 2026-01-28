<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>상품 상세 정보</title>

<script>
function directOrd() {
    var form = document.product;
    var qty = form.qty.value;
    var prdNo = form.prdNo.value;
    
    if(qty == "" || isNaN(qty) || qty < 1) {
        alert("수량을 정확히 입력해주세요.");
        form.qty.focus();
        return;
    }
}
function amountPlus() {
    var qtyInput = document.product.qty;
    var current = parseInt(qtyInput.value);
    if (isNaN(current)) current = 1;
    qtyInput.value = current + 1;
}

function amountMinus() {
    var qtyInput = document.product.qty;
    var current = parseInt(qtyInput.value);
    if (isNaN(current) || current <= 1) {
        qtyInput.value = 1;
    } else {
        qtyInput.value = current - 1;
    }
}

function amountCheck() {
    var qtyInput = document.product.qty;
    var value = parseInt(qtyInput.value);
    if (isNaN(value) || value < 1) {
        alert("1 이상의 숫자를 입력해주세요.");
        qtyInput.value = 1;
    }
}
</script>


<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background-color: #fff;
        color: #333;
        line-height: 1.6;
    }
    
    .container {
        width: 90%;
        max-width: 1000px;
        margin: 0 auto;
        padding: 30px 0;
    }
    
    .product-detail {
        display: flex;
        margin-bottom: 50px;
        flex-wrap: wrap;
    }
    
    .product-images {
        flex: 1;
        min-width: 300px;
        padding-right: 30px;
    }
    
    .main-image {
        width: 100%;
        height: 400px;
        object-fit: cover;
        border-radius: 8px;
        margin-bottom: 15px;
        cursor: pointer;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    
    .product-info {
        flex: 1;
        min-width: 300px;
    }
    
    .product-title {
        font-size: 24px;
        font-weight: 500;
        color: #1AA56F;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 1px solid #E8F5E9;
    }
    
    .product-meta {
        margin-bottom: 20px;
    }
    
    .product-price {
        font-size: 22px;
        font-weight: 700;
        color: #1AA56F;
        margin: 20px 0;
    }
    
    .product-description {
        margin: 25px 0;
        line-height: 1.8;
        color: #555;
    }
    
    .quantity-control {
        display: flex;
        align-items: center;
        margin: 25px 0;
    }
    
    .quantity-input {
        width: 60px;
        height: 40px;
        text-align: center;
        border: 1px solid #E8F5E9;
        margin: 0 10px;
    }
    
    .quantity-btn {
        width: 30px;
        height: 30px;
        background: #E8F5E9;
        border: none;
        border-radius: 50%;
        font-size: 16px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .action-buttons {
        display: flex;
        gap: 15px;
        margin-top: 30px;
    }
    
    .btn {
        padding: 12px 25px;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: background 0.3s;
    }
    
    .btn-cart {
        background: #E8F5E9;
        color: #1AA56F;
    }
    
    .btn-cart:hover {
        background: #C8E6C9;
    }
    
    .btn-buy {
        background: #1EB980;
        color: white;
		text-decoration: none;
    }
    
    .btn-buy:hover {
        background: #1AA56F;
    }
    
    .detail-image {
        width: 100%;
        margin-top: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    
    .info-row {
        display: flex;
        margin-bottom: 10px;
    }
    
    .info-label {
        width: 100px;
        font-weight: 500;
        color: #555;
    }
    
    .info-value {
        flex: 1;
    }
	.go-top {
		position: fixed;
		bottom: 40px;
		right: 40px;
		background-color: #1EB980;
		color: white;
		padding: 10px 15px;
		border-radius: 50px;
		font-size: 14px;
		font-weight: bold;
		text-decoration: none;
		box-shadow: 0 2px 6px rgba(0,0,0,0.2);
		transition: background-color 0.3s;
		z-index: 1000;
	}

	.go-top:hover {
		background-color: #1AA56F;
	}

</style>
</head>

<body>
<div style="margin-top: 150px;"></div>
<%@ include file="header.jsp" %>
<%
    String loginId = (String) session.getAttribute("sid");
%>

<%
try {
    String DB_URL="jdbc:mysql://localhost:3306/project";
    String DB_ID="root";  
    String DB_PASSWORD="1234"; 
    
    Class.forName("org.gjt.mm.mysql.Driver"); 
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String pNo = request.getParameter("prdNo");
    String jsql = "SELECT * FROM goods WHERE prdNo = ?";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, pNo);

    ResultSet rs = pstmt.executeQuery();
    rs.next();

    String no = rs.getString("prdNo");
    String name = rs.getString("prdName");
    int price = rs.getInt("prdPrice");
int discountRate = rs.getInt("discountRate");
int originalPrice = rs.getInt("originalPrice");

    int stock = rs.getInt("prdStock");
    String summary = rs.getString("prdSummary");
    String description = rs.getString("prdDescription");
%>

<div class="container">
    <div class="product-detail">
        <div class="product-images">
            <img src="./images/<%=no%>.jpg" alt="<%=name%>" class="main-image" onclick="javascript:enlarge()">
        </div>
        
        <div class="product-info">
            <h1 class="product-title"><%=name%></h1>
            
            <div class="info-row">
                <div class="info-label">제품코드</div>
                <div class="info-value"><%=no%></div>
            </div>
            
            <div class="info-row">
			<div class="info-label">상세설명</div>
			<div class="info-value"><%=summary%></div>

            </div>
            
           <div class="product-price">
    <% if (discountRate > 0) { %>
        <div style="font-size:16px; color:#999; text-decoration:line-through;">
            <%=String.format("%,d", originalPrice)%>원
        </div>
        <div style="font-size:24px; color:#D32F2F; font-weight: bold;">
            <%=String.format("%,d", price)%>원
        </div>
        <div style="font-size:14px; color:#1AA56F;">할인율: <%=discountRate%>%</div>
    <% } else { %>
        <%=String.format("%,d", price)%>원
    <% } %>
</div>

            
            <div class="product-description">
                <%=description%>
            </div>
            
            <div class="info-row">
                <div class="info-label">재고상태</div>
                <div class="info-value"><%=stock > 0 ? "재고 있음 (" + stock + "개)" : "일시 품절"%></div>
            </div>
            
           <form name="product" method="post" action="inCart.jsp">
                <input type="hidden" name="prdNo" value="<%=no%>">
                <input type="hidden" name="prdName" value="<%=name%>">
<input type="hidden" name="price" value="<%=price%>">
    <input type="hidden" name="prdImage" value="<%= no %>.jpg">

                <div class="quantity-control">
                    <span style="margin-right:15px; font-weight:500;">구매수량</span>
                    <button type="button" class="quantity-btn" onClick="amountMinus();">-</button>
                    <input type="text" name="qty" class="quantity-input" value="1" onblur="javascript:amountCheck();">
                    <button type="button" class="quantity-btn" onClick="amountPlus();">+</button>
                </div>
                
                <div class="action-buttons">
				
  <input type="submit" class="btn btn-cart" value="장바구니 담기">
    
   <a href="#"
   onclick="
      <% if (loginId == null) { %>
         location.href='login.jsp?redirect=viewDetailProduct.jsp?prdNo=<%=no%>';
      <% } else { %>
         location.href='orderForm.jsp?prdNo=<%=no%>&qty=' + document.product.qty.value;
      <% } %>
      return false;"
   class="btn btn-buy">바로 구매하기</a>



</div>
            </form>
        </div>
    </div>
    
    <img src="./images/<%=no%>_detail.jpg" class="detail-image" alt="<%=name%> 상세정보">
</div>

<%
    } catch(Exception e) {
        out.println(e);
    }
%>

<a href="#" class="go-top">▲ TOP</a>
<%@ include file="footer.jsp" %>

</body>
</html>