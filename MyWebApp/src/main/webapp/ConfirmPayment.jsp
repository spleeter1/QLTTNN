<%-- 
    Document   : ConfirmPayment
    Created on : Dec 2, 2024, 6:01:36 PM
    Author     : NAMPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mywebapp.dao.RegistrationDAO"%>

<%
    String action = request.getParameter("action");

    if ("no".equals(action)) {
        response.sendRedirect("PaymentStudent.jsp");
        return;
    }

    if ("yes".equals(action)) {
        RegistrationDAO registrationDAO = new RegistrationDAO();
        int i = 0;

        request.getParameterMap().forEach(( key,   
            values) -> {
                        for (String value : values) {
                System.out.println(key + ":" + value);
            } });
            System.out.println("dang xu ly thanh toan");
    }
//        while (request.getParameter("id_" + i) != null) {
//            try {
//                String id = request.getParameter("id_" + i);
//                int haveToPay = Integer.parseInt(request.getParameter("have_to_pay_" + i));
//                registrationDAO.updatePaymentInfo(Integer.parseInt(id), haveToPay);
//            } catch (NumberFormatException e) {
//                System.err.println("Lỗi định dạng số: " + e.getMessage());
//            }
//            i++;
//        }

//            response.sendRedirect("PaymentStudent.jsp?success=true");
//        }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Payment</title>
    </head>
    <body>
        <h1>Xác nhận thanh toán</h1>
        <div class="confirmation-box">
            <p>Bạn có chắc chắn muốn thực hiện thanh toán?</p>
            <form method="POST" action="confirmPayment.jsp">

                <%
                    request.getParameterMap().forEach(( key,   
                        values) -> {
                        for (String value : values) {
                %>
                <input type="hidden" name="<%= key%>" value="<%= value%>" />
                <%
                        }
                    });
                %>
                <div class="confirmation-buttons">
                    <button type="submit" name="action" value="yes" class="yes">Có</button>
                    <button type="submit" name="action" value="no" class="no">Không</button>
                </div>
            </form>
        </div>
    </body>
</html>