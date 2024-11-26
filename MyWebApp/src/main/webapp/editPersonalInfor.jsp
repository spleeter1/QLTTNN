<%-- 
    Document   : editPersonalInfor.jsp
    Created on : Nov 26, 2024, 1:57:46 PM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   Student studentTmp = (Student) session.getAttribute("studentTmp");
    String action = request.getParameter("action");
    if ("close".equals(action)) {
        studentTmp = new Student();
        studentTmp.setHoTen(request.getParameter("hoTen"));
        studentTmp.setEmail(request.getParameter("email"));
        studentTmp.setSdt(request.getParameter("sdt"));
        studentTmp.setDob(request.getParameter("dob"));
        studentTmp.setNoiSinh(request.getParameter("noiSinh"));
        session.setAttribute("studentTmp", studentTmp);
        System.out.println(session.getAttribute("student"));
        response.sendRedirect("personalInfor.jsp");
    } else if ("cancel".equals(action)) {
        session.setAttribute("studentTmp",(Student) session.getAttribute("student"));
        response.sendRedirect("personalInfor.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa thông tin cá nhân</title>
        <style>
            form {
                width: 60%;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
            }
            label {
                font-weight: bold;
                display: block;
                margin-bottom: 8px;
            }
            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .button-container {
                text-align: center;
            }
            button {
                padding: 10px 15px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1 style="text-align: center;">Sửa thông tin cá nhân</h1>
        <form action="editPersonalInfor.jsp" method="post">
            <label for="hoTen">Họ và tên:</label>
            <input type="text" id="hoTen" name="hoTen" value="<%= studentTmp.getHoTen()%>">

            <label for="email">Email:</label>
            <input type="text" id="email" name="email" value="<%= studentTmp.getEmail()%>">

            <label for="sdt">Số điện thoại:</label>
            <input type="text" id="sdt" name="sdt" value="<%= studentTmp.getSdt()%>">

            <label for="dob">Ngày sinh:</label>
            <input type="text" id="dob" name="dob" value="<%= studentTmp.getDob()%>">

            <label for="noiSinh">Nơi sinh:</label>
            <input type="text" id="noiSinh" name="noiSinh" value="<%= studentTmp.getNoiSinh()%>">

            <div class="button-container">
                <button type="submit" name="action" value="close">Đóng</button>
                <button type="submit" name="action" value="cancel">Hủy</button>
            </div>
        </form>
    </body>
</html>