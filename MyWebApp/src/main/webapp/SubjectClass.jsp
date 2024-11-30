<%-- 
    Document   : SubjectClass
    Created on : Nov 29, 2024, 9:19:19 AM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.model.Student"%>
<%@page import="com.mywebapp.dao.RegistrationDAO"%>
<%@page import="com.mywebapp.model.BuoiHoc"%>
<%@page import="com.mywebapp.dao.BuoiHocDAO"%>
<%@page import="com.mywebapp.dao.SubjectClassDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mywebapp.model.SubjectClass"%>
<%@page import="com.mywebapp.model.Registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Student student = (Student) session.getAttribute("studentTmp");
    String studentId = student.getStudentId();
    if (studentId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String maMon = request.getParameter("subjectId");
    List<SubjectClass> scList = new ArrayList<>();

    String action = request.getParameter("action");
    String maLHP = request.getParameter("maLHP");

    if ("register".equals(action)) {
    
        SubjectClass subjectClass = null;
        for (SubjectClass sc : scList) {
            if (sc.getMaLHP().equals(maLHP)) {
                subjectClass = sc;
                break;
            }
        }

        if (subjectClass != null) {
            RegistrationDAO registrationDAO = new RegistrationDAO();
            Registration regTmp = new Registration();
            regTmp.setHocVien(student);
            regTmp.setLhp(subjectClass);

            boolean success = registrationDAO.updateRegistrationSC(regTmp);
            if (success) {
                out.println("<script>alert('Đăng ký thành công!');</script>");
            } else {
                out.println("<script>alert('Đăng ký thất bại!');</script>");
            }
        }
    } else if ("unregister".equals(action)) {
        RegistrationDAO registrationDAO = new RegistrationDAO();
        boolean success = registrationDAO.deleteRegistration(studentId, maLHP);
        if (success) {
            out.println("<script>alert('Hủy đăng ký thành công!');</script>");
        } else {
            out.println("<script>alert('Hủy đăng ký thất bại!');</script>");
        }
    }

    if (maMon != null && !maMon.isEmpty()) {
        SubjectClassDAO subjectClassDAO = new SubjectClassDAO();
        scList = subjectClassDAO.getSubjectClasByMa(maMon);

        BuoiHocDAO buoiHocDAO = new BuoiHocDAO();
        for (SubjectClass sc : scList) {
            List<BuoiHoc> buoiHocs = buoiHocDAO.getBuoiHocByMaLHP(sc.getMaLHP());
            sc.setBuoiHocs(buoiHocs);

            boolean isRegistered = false;
            for (Registration reg : registrations) {
                if (reg.getLhp().getMaLHP().equals(sc.getMaLHP())) {
                    isRegistered = true;
                    break;
                }
            }
            sc.setRegistered(isRegistered);
        }
        session.setAttribute("subjectClasses", scList);
    }
    System.out.println(scList);
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
                        <th>Ngày bắt đầu</th>
                        <th>Lựa chọn</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (scList != null && !scList.isEmpty()) {
                            for (SubjectClass subjectClass : scList) {
                    %>
                    <tr>
                        <td><%= subjectClass.getId()%></td>
                        <td><%= subjectClass.getMaLHP()%></td>
                        <td><%= subjectClass.getTenLHP()%></td>
                        <td><%= subjectClass.getSiSoMax()%></td>
                        <td><%= subjectClass.getSiSoThuc()%></td>

                        <td><%= subjectClass.getBuoiHocs().get(0).getDay().getTen()%></td>
                        <td>
                            <!-- comment    <form action="Registration.jsp" method="POST">
                                <input type="hidden" name="maLHP" value="<%= //subjectClass.getMaLHP()%>" />

                            </form>
                            -->
                            <form action="SubjectClass.jsp" method="POST">
                                <input type="hidden" name="maLHP" value="<%= subjectClass.getMaLHP()%>" />
                                <% if (subjectClass.isRegistered()) { %>
                                <button type="submit" name="action" value="unregister">Xoá</button>
                                <% } else { %>
                                <button type="submit" name="action" value="register">Đăng ký</button>
                                <% } %>
                            </form>
                        </td>
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
