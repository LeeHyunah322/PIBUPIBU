<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>

<title>스킨케어 제품 목록</title>

<style type="text/css">

   body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #fff;
  color: #333;
  
		overflow-y: scroll; 
		overflow-x: hidden; 
		 
}
.wave-header {
  background-image: url('images/intro2.png');
  background-repeat: no-repeat;
  background-size: 1920px auto; 
  background-position: center top;
  padding: 200px 20px 150px;
  text-align: center;
  color: #1EB980;
  width: 100%;
  box-sizing: border-box;
}
.wave-header h2 {
  font-size: 32px;
  margin-bottom: 0px;
  position: relative;
  top: -170px; 
}
.wave-header p {
  font-size: 18px;
  color: #666;
}

    .product-container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: -30px 0;
		margin-top: -160px;
    }
	
    .category-nav {
        display: flex;
        justify-content: center;
        margin: 30px 0;
		margin-left:30px;
        flex-wrap: wrap;
    }
    
    .category-nav a {
        margin: 0 15px;
        padding: 8px 15px;
        text-decoration: none;
        color: #555;
        font-weight: 500;
        border-radius: 20px;
        transition: all 0.3s;
    }
    
    .category-nav a:hover, .category-nav a.active {
        background-color: #E8F5E9;
        color: #1AA56F;
    }
    
    .product-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 25px;
        margin-top: 20px;
    }
    
    .product-card {
        background: #FFF;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        transition: transform 0.3s, box-shadow 0.3s;
    }
	
	.product-card a {
        text-decoration: none;
    }
    
    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .product-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-bottom: 1px solid #E8F5E9;
    }
    
    .product-info {
        padding: 15px;
        text-align: center;
    }
    
    .product-name {
        font-size: 16px;
        font-weight: 500;
        margin-bottom: 8px;
        color: #333;
    }
	
	.product-name a {
        text-decoration: none;
    }
    
    .product-price {
        font-size: 18px;
        font-weight: 700;
        color: #1AA56F;
    }
	
	.product-price a {
		text-decoration: none;
    }
    
    .section-title {
        text-align: center;
        margin: 40px 0 20px;
        color: #1AA56F;
        font-weight: 500;
        position: relative;
    }
    
    .section-title:after {
        content: "";
        display: block;
        width: 50px;
        height: 2px;
        background: #E8F5E9;
        margin: 10px auto;
    }

.page-header {
  text-align: center;
  margin-bottom: 30px;
}

.page-header h2 {
  font-size: 28px;
  font-weight: bold;
  color: #1EB980;
}
.sort-nav {
  text-align: center;
  margin: 30px 0;
}

.sort-nav a {
  display: inline-block;
  margin: 0 8px;
  padding: 8px 16px;
  background-color: #f3f3f3;
  color: #333;
  text-decoration: none;
  border-radius: 20px;
  border: 1px solid #ddd;
  font-size: 15px;
  transition: all 0.3s ease;
}

.sort-nav a:hover {
  background-color: #1EB980;
  color: white;
  border-color: #1EB980;
}

.sort-nav a.active {
  background-color: #1EB980;
  color: white;
  border-color: #1EB980;
  font-weight: bold;
}




@media screen and (max-width: 768px) {
	
  .product-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
  }
  .product-image {
    height: 160px;
  }
  .product-name {
    font-size: 14px;
  }
  .product-price {
    font-size: 16px;
  }
  .section-title {
    font-size: 22px;
  }
  .wave-header {
  margin-top: 150px;
}
  .wave-header h2 {
    font-size: 22px;
  }
  .category-nav {
    gap: 8px;
  }
}

</style>
</head>

<body>
<%@ include file="header.jsp" %>
<div style="margin-top: -3px;"></div>
<%
try {
    String DB_URL="jdbc:mysql://localhost:3306/project";
    String DB_ID="root";  
    String DB_PASSWORD="1234"; 
    
    Class.forName("org.gjt.mm.mysql.Driver");  
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    request.setCharacterEncoding("UTF-8");
    String ctgType = request.getParameter("ctgType");  
    if(ctgType == null) ctgType = "category1";

    String sort = request.getParameter("sort");
    String orderClause = "";

    if ("low".equals(sort)) {
        orderClause = "ORDER BY prdPrice ASC";
    } else if ("high".equals(sort)) {
        orderClause = "ORDER BY prdPrice DESC";
    } else if ("skincare".equals(sort)) {
        orderClause = "ORDER BY CASE RIGHT(prdNo, 3) " +
                      "WHEN '004' THEN 1 " +
                      "WHEN '007' THEN 2 " +
                      "WHEN '001' THEN 3 " +
                      "WHEN '005' THEN 4 " +
                      "WHEN '008' THEN 5 " +
                      "WHEN '002' THEN 6 " +
                      "WHEN '003' THEN 7 " +
                      "WHEN '006' THEN 8 " +
                      "ELSE 9 END";
    }

    String jsql = "SELECT * FROM goods WHERE ctgType = ? " + orderClause + " LIMIT 8";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, ctgType);

    ResultSet rs = pstmt.executeQuery();
%>
<div class="wave-header">
  <h2>피부 타입별 추천 제품</h2>
  <p style="font-size: 17px; color: #444; margin-top: -150px;">
    피부 타입에 맞는 제품을 선택하면 효과는 배가됩니다.<br>
    본인에게 꼭 맞는 제품을 확인해보세요!
  </p>
   
</div>
<div class="product-container">
    
    <div class="category-nav">
        <a href="viewProduct.jsp?ctgType=category1" <%= "category1".equals(ctgType) ? "class='active'" : "" %>>건성</a>
        <a href="viewProduct.jsp?ctgType=category2" <%= "category2".equals(ctgType) ? "class='active'" : "" %>>지성</a>
        <a href="viewProduct.jsp?ctgType=category3" <%= "category3".equals(ctgType) ? "class='active'" : "" %>>중성</a>
        <a href="viewProduct.jsp?ctgType=category4" <%= "category4".equals(ctgType) ? "class='active'" : "" %>>민감성</a>
        <a href="viewProduct.jsp?ctgType=category5" <%= "category5".equals(ctgType) ? "class='active'" : "" %>>복합성</a>
    </div>
    <div class="sort-nav">
  <a href="viewProduct.jsp?ctgType=<%=ctgType%>&sort=low">낮은가격순</a> 
  <a href="viewProduct.jsp?ctgType=<%=ctgType%>&sort=high">높은가격순</a> 
  <a href="viewProduct.jsp?ctgType=<%=ctgType%>&sort=skincare">스킨케어순</a>
</div>

    <h2 class="section-title">
        <% 
            String typeName = "";
            switch(ctgType) {
                case "category1": typeName = "건성"; break;
                case "category2": typeName = "지성"; break;
                case "category3": typeName = "중성"; break;
                case "category4": typeName = "민감성"; break;
                case "category5": typeName = "복합성"; break;
                default: typeName = "제품";
            }
            out.print(typeName + " 제품");
        %>
    </h2>
    
    <div class="product-grid">
        <% while(rs.next()) { %>
        <div class="product-card">
            <a href="viewDetailProduct.jsp?prdNo=<%=rs.getString("prdNo")%>">
                <img src="images/<%=rs.getString("prdNo")%>.jpg" alt="<%=rs.getString("prdName")%>" class="product-image">
                <div class="product-info">
    <h3 class="product-name"><%=rs.getString("prdName")%></h3>
    <p style="margin: 5px 0; font-size: 14px; color: #666;"><%=rs.getString("prdSummary")%></p>

    <%
    int price = rs.getInt("prdPrice");
	int discount = rs.getInt("discountRate");
	int original = rs.getInt("originalPrice");

%>

<% if (discount > 0 && original > 0) { %>
    <p class="product-price">
      <span style="color: #999; text-decoration: line-through; font-size: 14px;">
        <%= String.format("%,d원", original) %>
      </span>
      <br>
      <span style="color: red; font-weight: bold;">
        <%= discount %>% ↓ <%= String.format("%,d원", price) %>
      </span>
    </p>
<% } else { %>
    <p class="product-price"><%= String.format("%,d원", price) %></p>
<% } %>

</div>

            </a>
        </div>
        <% } %>
    </div>
</div>
<% } catch (Exception e) { %>
    <div class="container">
        <p style="color:red;">오류가 발생했습니다: <%= e.getMessage() %></p>
    </div>
<% } %>
		<div style="margin-bottom: 100px;"></div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>