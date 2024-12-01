<%-- 
    Document   : Payment
    Created on : Dec 1, 2024, 3:10:56 PM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mywebapp.model.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MemberDAO memDAO = new MemberDAO();
    List<Student> stuList = (List<Student>) session.getAttribute("studentList");
    if (stuList == null) {
        stuList = memDAO.getListStudent();
        System.out.println(stuList);
    }
//    System.out.println(stuList);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Home</title>
        <style>
            table {
                border-collapse: collapse;
                width: 80%;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f5f5f5;
            }
        </style>
    </head>
    <body>
        <h1>List Student</h1>
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Date of Birth</th>
                    <th>Phone Number</th>
                </tr>
            </thead>
            <tbody>
                <%                    if (stuList != null && !stuList.isEmpty()) {
                        for (Student student : stuList) {
                %>
                <tr onclick="window.location = 'PaymentStudent.jsp?studentId=<%= student.getStudentId()%>'">
                    <td><%= student.getStudentId()%></td>
                    <td><%= student.getHoTen()%></td>
                    <td><%= student.getEmail()%></td>
                    <td><%= student.getDob()%></td>
                    <td><%= student.getSdt()%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" style="text-align: center;">No students found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
