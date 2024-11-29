<%-- 
    Document   : Registration.jsp
    Created on : Nov 28, 2024, 10:38:56 AM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.dao.SubjectDAO"%>
<%@page import="com.mywebapp.model.Subject"%>
<%@page import="java.util.List"%>
<%@page import="com.mywebapp.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Student student = (Student) session.getAttribute("studentTmp");
    SubjectDAO subjectDAO = new SubjectDAO();
    List<Subject> subjects = subjectDAO.getSubjects();

    session.setAttribute("subjectList", subjects);
    System.out.println(subjects);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <h2>Thông tin sinh viên: <%= student.getHoTen()%> - ID: <%= student.getStudentId()%></h2>
        <h2>Tìm kiếm: </h2>
        <form action="Subject.jsp" method="GET">
            <input type="text" name="searchSubject" placeholder="Nhập tên hoặc mã môn học" />
            <button type="submit" >Tìm kiếm</button>
        </form>

        <h2>Danh sách môn đăng kí</h2>
        <form>

        </form>


    </body>
</html>
