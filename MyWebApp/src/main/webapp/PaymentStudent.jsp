<%-- 
    Document   : PaymentStudent
    Created on : Dec 2, 2024, 8:13:48 AM
    Author     : NAMPC
--%>

<%@page import="com.mywebapp.dao.RegistrationDAO"%>
<%@page import="com.mywebapp.model.Registration"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String stuId = request.getParameter("studentId");
    if (stuId == null || stuId.isEmpty()) {
        response.sendRedirect("Payment.jsp");
    }
    List<Registration> registrationList = new ArrayList<>();
    RegistrationDAO registrationDAO = new RegistrationDAO();
    registrationList = registrationDAO.getStudentPaymentInfo(stuId);
    System.out.println(registrationList);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Student</title>
    </head>
    <body>
        <h1>Học phí</h1>
        <form action="confirmPayment.jsp" method="post">
            <table border ="1">
                <tr>
                    <th>ID</th>
                    <th>Lớp học phần</th>
                    <th>Tên lớp học phần</th>
                    <th>Miễn giảm</th>
                    <th>Đã thu</th>
                    <th>Phải thu</th>
                    <th>Giá tiền</th>
                   
                </tr>
                <tbody>
                    <%
                        int totalDiscount = 0;
                        int totalPrice = 0;
                        int totalPaid = 0;
                        for (int i = 0; i < registrationList.size(); i++) {
                            Registration reg = registrationList.get(i);
                            totalPaid += reg.getPaid();
                            totalDiscount += reg.getDiscount();
                            totalPrice += reg.getPrice();
                    %>
                    <tr>
                        <td><%= reg.getId()%></td>
                        <td><%= reg.getLhp().getMaLHP()%></td>
                        <td><%= reg.getLhp().getTenLHP()%></td>
                        <td>
                            <input type="number" name="discount_<%= i%>" value="<%= reg.getDiscount()%>" 
                                   min="0" max="<%= reg.getPrice() - reg.getPaid()%>" required />
                        </td>
                        <td><%= reg.getPaid()%></td>
                        <td>
                            <input type="number" name="have_to_pay_<%= i%>" value="<%= reg.getPrice() - reg.getPaid() - reg.getDiscount()%>" 
                                  min="0" max="<%= reg.getPrice() - reg.getPaid() - reg.getDiscount()%>" required />
                        </td>
                        <td><%= reg.getPrice()%></td>
                <input type="hidden" name="id_<%= i%>" value="<%= reg.getId()%>" />
                </tr>
                <% }%>

                <tr>
                    <td colspan="3"><strong>Tổng cộng</strong></td>
                    <td><%= totalDiscount%> </td>
                    <td></td>
                    <td></td>
                    <td><%= totalPrice%> </td>
                    <td></td>
                </tr>
                </tbody>
                <button type="submit">Lưu</button>

            </table>
        </form>
    </body>
</html>
