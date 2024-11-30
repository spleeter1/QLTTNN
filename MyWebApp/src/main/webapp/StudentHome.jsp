<%-- 
    Document   : StudentHome
    Created on : Nov 25, 2024, 10:51:48 AM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.dao.MemberDAO"%>
<%@page import="com.mywebapp.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mywebapp.model.Member"%>

<%
    Member member = (Member) session.getAttribute("student");
//    System.out.println(studMember.getUsername());

    if (member == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Student student = new Student();

    student.setId(member.getId());
    student.setUsername(member.getUsername());
//    student.setPassword(member.getPassword());
    student.setHoTen(member.getHoTen());
    student.setEmail(member.getEmail());
    student.setSdt(member.getSdt());
    student.setNoiSinh(member.getNoiSinh());
    student.setRole(member.getRole());
    student.setDob(member.getDob());

    int id = student.getId();
    MemberDAO dao = new MemberDAO();
    String stuID = dao.geStudentInfor(id);
     session.setAttribute("currStudentID",stuID );
    student.setStudentId(stuID);
    
   
    session.setAttribute("student", student);
    
    Student studentTmp = new Student(student.getId(), student.getUsername(),"", student.getHoTen(), student.getEmail(), student.getSdt(), student.getNoiSinh(), "",student.getDob(), student.getStudentId());
    session.setAttribute("studentTmp", studentTmp);
    
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Home</title>
    </head>
    <body>
        <h1>Welcome, <%= student.getStudentId() %></h1>
        <ul>
            <li><a href="personalInfor.jsp">Manage Profile</li>
            <li><a href="Registration.jsp">Registration</li>
            <li><a href="logout.jsp">Logout</li>
        </ul>
    </body>
</html>
