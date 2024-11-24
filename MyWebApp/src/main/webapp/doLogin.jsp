<%-- 
    Document   : doLogin
    Created on : Nov 25, 2024, 12:06:28 AM
    Author     : NAMPC
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,com.mywebapp.dao.*,com.mywebapp.model.*"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Member tv = new Member();
    tv.setUsername(username);
    tv.setPassword(password);
    
    MemberDAO dao = new MemberDAO();
    boolean kq = dao.checkLogin(tv);
    
    if (kq) {
        if ("sinhvien".equalsIgnoreCase(tv.getRole())) {
            session.setAttribute("student", tv); 
            response.sendRedirect("sv/studentHome.jsp");
        } else if ("teacher".equalsIgnoreCase(tv.getRole())) {
            session.setAttribute("teacher", tv); 
            response.sendRedirect("gv/teacherHome.jsp");
        }
    } else {
        response.sendRedirect("gddangnhap.jsp?err=fail");
    }
    
%>

