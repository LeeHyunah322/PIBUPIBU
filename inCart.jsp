<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*" %>

<%
    String myid = (String)session.getAttribute("sid");  

    if (myid == null) {
    response.sendRedirect("login.jsp");
    return;
} 
  
        try {
            String DB_URL="jdbc:mysql://localhost:3306/project";
            String DB_ID="root"; 
            String DB_PASSWORD="1234";
            Class.forName("org.gjt.mm.mysql.Driver");  
            Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

            String memId = (String)session.getAttribute("sid");    
            String prdNo = request.getParameter("prdNo");
            int ctQty = Integer.parseInt(request.getParameter("qty"));

   
            String prdName = request.getParameter("prdName");
            int price = Integer.parseInt(request.getParameter("price"));
			
			String prdImage = request.getParameter("prdImage");


            String jsql = "select * from cart where memId = ? and prdNo = ?";
            PreparedStatement pstmt = con.prepareStatement(jsql);
            pstmt.setString(1, memId);
			pstmt.setString(2, prdNo);
            ResultSet rs = pstmt.executeQuery(); 

            if (rs.next()) {
                int sum = rs.getInt("ctQty") + ctQty;
                String jsql2 = "update cart set ctQty=? where memId=? and prdNo=?";
                PreparedStatement pstmt2 = con.prepareStatement(jsql2);
                pstmt2.setInt(1, sum);
                pstmt2.setString(2, memId);
                pstmt2.setString(3, prdNo);
                pstmt2.executeUpdate();
            } else {
                String jsql3 = "insert into cart (memId, prdNo, prdName, price, ctQty, prdImage) values (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt3 = con.prepareStatement(jsql3);
                pstmt3.setString(1, memId);
                pstmt3.setString(2, prdNo);
                pstmt3.setString(3, prdName);
                pstmt3.setInt(4, price);
                pstmt3.setInt(5, ctQty);
				pstmt3.setString(6, prdImage);
                pstmt3.executeUpdate();
            }
            response.sendRedirect("showCart.jsp");

        } catch(Exception e) {
            out.println(e);
        }
%>
