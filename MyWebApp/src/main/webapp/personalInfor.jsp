<%-- 
    Document   : personalInfor
    Created on : Nov 25, 2024, 9:54:12 PM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Student student = (Student) session.getAttribute("student");
    Student studentTmp = (Student) session.getAttribute("studentTmp");
    String action = request.getParameter("action");
    if ("cancel".equals(action)) {
        session.setAttribute("studentTmp", student);
        studentTmp = (Student) session.getAttribute("studentTmp");
        System.out.println(studentTmp);
    } else if ("save".equals(action)) {
        System.out.println(studentTmp);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin cá nhân</title>

        <style>
            table {
                width: 50%;
                margin: 0 auto;
                border-collapse: collapse;
            }
            td {
                padding: 10px;
                border: 1px solid #ccc;
                vertical-align: middle;
            }
            .label {
                font-weight: bold;
            }
            h1{
                text-align: center;
            }
            .label {
                font-weight: bold;
                color: #555;
            }
            input[type="text"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-top: 5px;
            }
            .button-container {
                text-align: center;
                margin-top: 20px;
            }
            button {
                padding: 10px 15px;
                font-size: 16px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin: 5px;
            }
            button:hover {
                background-color: #45a049;
            }
            .edit-input {
                display: none;
            }
        </style>
    </head>
    <body>
        <h1>Thông tin cá nhân</h1>
        <form action="personalInfor.jsp" method="post">
            <table>
                <tr>
                    <td class="label">Mã học viên:</td>
                    <td><%= studentTmp.getStudentId()%></td>
                </tr>
                <tr>
                    <td class="label">Họ và tên:</td>
                    <td><%= studentTmp.getHoTen()%></td>
                </tr>
                <tr>
                    <td class="label">Email:</td>
                    <td><%= studentTmp.getEmail()%></td>
                </tr>
                <tr>
                    <td class="label">Số điện thoại:</td>
                    <td><%= studentTmp.getSdt()%></td>
                </tr>
                <tr>
                    <td class="label">Ngày sinh:</td>
                    <td><%= studentTmp.getDob()%></td>
                </tr>
                <tr>
                    <td class="label">Nơi sinh:</td>
                    <td><%= studentTmp.getNoiSinh()%></td>
                </tr>
            </table>
            <div class="button-container">
                <button type="submit" name="action" value="cancel">Huỷ</button>
                <a href="editPersonalInfor.jsp"><button type="button" name="action" value="edit">Sửa</button></a>
                <a href="ConfirmPersonalInfor.jsp" ><button type="submit" name="action" value="save">Lưu</button></a>
            </div>
        </form>
    </body>
</html>
