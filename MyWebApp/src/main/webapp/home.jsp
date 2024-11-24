<%-- 
    Document   : home
    Created on : Nov 21, 2024, 2:29:24 PM
    Author     : NAMPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mywebapp.dao.DAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Welcome to Home Page</h1>
        <%
            DAO dao = new DAO();
            boolean isConnected = dao.testConnection();
            if (isConnected) {
        %>
        <p style="color: green;">Kết nối thành công!</p>
        <%
        } else {
        %>
        <p style="color: red;">Kết nối thất bại!</p>
        <%
            }
        %>
    </body>
</html>
