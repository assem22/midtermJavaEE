<%@ page import="java.util.List" %>
<%@ page import="Model.Ticket" %><%--
  Created by IntelliJ IDEA.
  User: assemmukhamadi
  Date: 12.03.2021
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My tickets</title>
    <%
        List<?> tickets = (List<?>) request.getSession().getAttribute("tickets");
        Ticket ticket = new Ticket();
    %>
</head>
<body>
<div align="center" id="edit">
    <h1>History of buyed tickets</h1>
    <table border="1">
        <tr>
            <th width="150">Ticket id</th>
            <th width="100">Movie name</th>
            <th width="200">Movie price</th>
            <th width="80">Amount</th>
            <th width="80">Total cost</th>
        </tr>
        <%
            for (Object obj : tickets) {
                ticket = (Ticket) obj;
        %>
        <tr>
            <td align="center"><%=ticket.getTicket_id()%></td>
            <td align="center"><%=ticket.getMovie_name()%></td>
            <td align="center"><%=ticket.getCost()%></td>
            <td align="center"><%=ticket.getAmount()%></td>
            <td align="center"><%=ticket.getTotal_cost()%></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
