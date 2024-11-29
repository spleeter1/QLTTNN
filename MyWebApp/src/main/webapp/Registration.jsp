<%-- 
    Document   : Registration.jsp
    Created on : Nov 28, 2024, 10:38:56 AM
    Author     : NAMPC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mywebapp.dao.RegistrationDAO"%>
<%@page import="com.mywebapp.dao.SubjectDAO"%>
<%@page import="com.mywebapp.model.Subject"%>
<%@page import="java.util.List"%>
<%@page import="com.mywebapp.model.Student"%>
<%@page import="com.mywebapp.model.Registration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Student student = (Student) session.getAttribute("studentTmp");

//    List<Subject> subjects = (List<Subject>) session.getAttribute("subjectList");
//    if (subjects == null) {
//        SubjectDAO subjectDAO = new SubjectDAO();
//        subjects = subjectDAO.getSubjects();
//        session.setAttribute("subjectList", subjects);
//    }

    List<Registration> registrations = (List<Registration>) session.getAttribute("currRegistration");
    if (registrations == null) {
        RegistrationDAO registrationDAO = new RegistrationDAO();
        String stuID = student.getStudentId();
        registrations = registrationDAO.getRegistrationByStudentID(stuID);
        session.setAttribute("currRegistration", registrations); 
    }
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

        <table border="1">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã Môn</th>
                    <th>Mã LHP</th>
                    <th>Tên LHP</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int stt = 1;
                    for (Registration registration : registrations) {
                        String maMon = registration.getLhp().getMonHocMa();
                        String maLHP = registration.getLhp().getMaLHP(); 
                        String tenLHP = registration.getLhp().getTenLHP(); 
%>
                <tr>
                    <td><%= stt++%></td>
                    <td><%= maMon%></td>
                    <td><%= maLHP%></td>
                    <td><%= tenLHP%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>


    </body>
</html>
