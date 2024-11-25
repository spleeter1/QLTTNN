<%-- 
    Document   : personalInfor
    Created on : Nov 25, 2024, 9:54:12 PM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Student student = (Student) session.getAttribute("student");%>
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
                vertical-align: middle; /* Căn chỉnh nội dung theo chiều dọc */
            }
            .label {
                font-weight: bold;
            }
            h1{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Thông tin cá nhân</h1>
        <table>
            <tr>
                <td class="label">Mã học viên:</td>
                <td><%= student.getStudentId()%></td>
            </tr>
            <tr>
                <td class="label">Họ và tên:</td>
                <td><%= student.getHoTen()%></td>
            </tr>
            <tr>
                <td class="label">Email:</td>
                <td><%= student.getEmail()%></td>
            </tr>
            <tr>
                <td class="label">Số điện thoại:</td>
                <td><%= student.getSdt()%></td>
            </tr>
            <tr>
                <td class="label">Ngày sinh:</td>
                <td><%= student.getDob()%></td>
            </tr>
            <tr>
                <td class="label">Nơi sinh:</td>
                <td><%= student.getNoiSinh()%></td>
            </tr>
        </table>
        <div>
            <button>Back</button>
            <button>Sửa</button> 
            <button>Lưu</button> 
        </div>
    </body>
</html>
