<%-- 
    Document   : SubjectClass
    Created on : Nov 29, 2024, 9:19:19 AM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.dao.SubjectClassDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mywebapp.model.SubjectClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String maMon = request.getParameter("subjectId");
    List<SubjectClass> scList = new ArrayList<>(); 

    if (maMon != null && !maMon.isEmpty()) {
        SubjectClassDAO subjectClassDAO = new SubjectClassDAO();
        scList = subjectClassDAO.getSubjectClasByMa(maMon);

        session.setAttribute("subjectClasses",scList);
    }
//    System.out.println(scList);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Class</title>
    </head>
    <body>
        <h1>Danh sách các lớp học phần</h1>
        <table><table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Mã LHP</th>
                <th>Tên LHP</th>
                <th>Sĩ số tối đa</th>
                <th>Sĩ số thực tế</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (scList != null && ! scList.isEmpty()) {
                    for (SubjectClass subjectClass : scList) {
            %>
            <tr>
                <td><%= subjectClass.getId() %></td>
                <td><%= subjectClass.getMaLHP() %></td>
                <td><%= subjectClass.getTenLHP() %></td>
                <td><%= subjectClass.getSiSoMax() %></td>
                <td><%= subjectClass.getSiSoThuc() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">Không tìm thấy lớp học phần cho môn học này.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    </body>
</html>
