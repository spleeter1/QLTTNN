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
        if ("Student".equalsIgnoreCase(tv.getRole())) {
            session.setAttribute("student", tv);
            response.sendRedirect("StudentHome.jsp");
        } else if ("Accountant".equalsIgnoreCase(tv.getRole())) {
            session.setAttribute("accountant", tv);
            response.sendRedirect("AccountantHome.jsp");
        }
    } else {

        response.sendRedirect("login.jsp?err=fail");
    }

%>
<script>
    console.log(<%= kq %>);
</script>
