<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";

    String user = "root";
    String password = "1234";
    Class.forName("com.mysql.jdbc.Driver");
%>