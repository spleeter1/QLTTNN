<%-- 
    Document   : StudentHome
    Created on : Nov 25, 2024, 10:51:48 AM
    Author     : NAMPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mywebapp.model.Member"%>

<%
    Member studMember = (Member) session.getAttribute("student");
//    if (studMember == null) {
//        response.sendRedirect("login.jsp");
//        return;
//    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Home</title>
    </head>
    <body>
        <h1>Welcome, <%= studMember.getUsername() %></h1>
        <ul>
            <li><a href="Profile.jsp">Manage Profile</li>
            <li><a href="Registration.jsp">Registration</li>
            <li><a href="logout.jsp">Logout</li>
        </ul>
    </body>
</html>
