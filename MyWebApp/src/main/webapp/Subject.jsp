<%-- 
    Document   : Subject
    Created on : Nov 29, 2024, 7:55:04 AM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.dao.SubjectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mywebapp.model.Subject"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String searchQuery = request.getParameter("searchSubject");

    SubjectDAO subjectDAO = new SubjectDAO();
    List<Subject> searchedSubjects = null;

    // Nếu có từ khóa tìm kiếm, gọi phương thức tìm kiếm
    if (searchQuery != null && !searchQuery.isEmpty()) {
        searchedSubjects = subjectDAO.findSubjects(searchQuery);
    }

    session.setAttribute("searchedSubjects", searchedSubjects);
    System.out.println(searchedSubjects);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject List</title>
    </head>
    <body>
        <h2>Kết quả tìm kiếm:</h2>
        <table border="solid">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã môn</th>
                    <th>Tên môn</th>
                    <th>Giá</th>
                    <th>Mô tả</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (searchedSubjects != null && !searchedSubjects.isEmpty()) {
                        for (Subject subject : searchedSubjects) {
                %>
                <tr>
                    
                    <td><a href="SubjectClass.jsp?subjectId=<%= subject.getMaMon()%>"><%= subject.getId()%></a></td>
                    <td><a href="SubjectClass.jsp?subjectId=<%= subject.getMaMon() %>"><%= subject.getMaMon()%></a></td>
                    <td><a href="SubjectClass.jsp?subjectId=<%= subject.getMaMon() %>"><%= subject.getTenMon()%></a></td>
                    <td><a href="SubjectClass.jsp?subjectId=<%= subject.getMaMon() %>"><%= subject.getGia()%></a></td>
                    <td><a href="SubjectClass.jsp?subjectId=<%= subject.getMaMon() %>"><%= subject.getMoTa()%></a></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5">Không tìm thấy môn học nào phù hợp.</td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>
