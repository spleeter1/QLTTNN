<%-- 
    Document   : ConfirmPersonalInfor.jsp
    Created on : Nov 26, 2024, 4:32:36 PM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.model.Member"%>
<%@page import="com.mywebapp.dao.MemberDAO"%>
<%@page import="com.mywebapp.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Student studentTmp = (Student) session.getAttribute("studentTmp");
    Student student = (Student) session.getAttribute("student");
    String action = request.getParameter("action");
    if ("confirm".equals(action)) {
        try {
            MemberDAO dao = new MemberDAO();
            Member member = new Member();
            member.setId(studentTmp.getId());
            member.setHoTen(studentTmp.getHoTen());
            member.setEmail(studentTmp.getEmail());
            member.setDob(studentTmp.getDob());
            member.setNoiSinh(studentTmp.getNoiSinh());
            member.setSdt(studentTmp.getSdt());

            boolean res = dao.updatePersonalInfor(member.getId(), member);
            if (res) {
                student.setHoTen(member.getHoTen());
                student.setDob(member.getDob());
                student.setEmail(member.getEmail());
                student.setSdt(member.getSdt());
                student.setNoiSinh(member.getNoiSinh());

                session.setAttribute("student", student);
                out.println("<script>");
                out.println("alert('Thông tin cá nhân đã được cập nhật thành công!');");
                out.println("window.location.href = 'StudentHome.jsp';");
                out.println("</script>");
//            response.sendRedirect("Student Home");
            } else {
                out.println("<script>");
                out.println("alert('Thông tin cá nhân đã được cập nhật thất bại!');");
                out.println("window.location.href = 'personalInfor.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {

        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 40%;
                margin: 100px auto;
                padding: 30px;
                background-color: white;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .title {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
            }
            .message {
                font-size: 18px;
                text-align: center;
                margin-bottom: 30px;
                color: #333;
            }
            .button-container {
                display: flex;
                justify-content: center;
                gap: 20px;
            }
            button {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .confirm-button {
                background-color: #4CAF50;
                color: white;
            }
            .confirm-button:hover {
                background-color: #45a049;
            }
            .cancel-button {
                background-color: #f44336;
                color: white;
            }
            .cancel-button:hover {
                background-color: #e53935;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="title">Xác nhận hành động</div>
            <div class="message">
                Bạn có chắc chắn muốn lưu thay đổi thông tin cá nhân không?
            </div>
            <div class="button-container">
                <form action="ConfirmPersonalInfor.jsp" method="post">
                    <button type="submit" name="action" value="confirm" class="confirm-button">Có</button>
                </form>
                <a href="personalInfor.jsp">
                    <button  class="cancel-button">Không</button>
                </a>
            </div>
        </div>
    </body>
</html>