<%@page import="com.mywebapp.dao.MemberDAO"%>
<%@page import="com.mywebapp.model.Accountant"%>
<%@page import="com.mywebapp.model.Member"%>
<%
    Member member = (Member) session.getAttribute("accountant");
    if (member == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Accountant accountant = new Accountant();
    accountant.setId(member.getId());
    accountant.setUsername(member.getUsername());
    accountant.setHoTen(member.getHoTen());
    accountant.setEmail(member.getEmail());
    accountant.setSdt(member.getSdt());
    accountant.setNoiSinh(member.getNoiSinh());
    accountant.setRole(member.getRole());
    accountant.setDob(member.getDob());

    int id = accountant.getId();
    MemberDAO dao = new MemberDAO();
    String accountantID = dao.getAccountantInfor(id);
    session.setAttribute("currAccountantID", accountantID);
    accountant.setAccountantId(accountantID);

    session.setAttribute("accountant", accountant);

    Accountant accountantTmp = new Accountant(accountant.getId(), accountant.getUsername(), "", accountant.getHoTen(), accountant.getEmail(), accountant.getSdt(), accountant.getNoiSinh(), "", accountant.getDob(), accountant.getAccountantId());
    session.setAttribute("studentTmp", accountantTmp);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Welcome, <%= accountant.getAccountantId()%></h1>
        <ul>
            <li><a href="Payment.jsp">Payment</li>
            <li><a href="logout.jsp">Logout</li>
        </ul>
    </body>
</html>
