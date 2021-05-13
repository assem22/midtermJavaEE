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

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <%
        List<?> tickets = (List<?>) request.getSession().getAttribute("tickets");
        Ticket ticket = new Ticket();
    %>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="../user/Logout.jsp"%>
<div align="center" id="edit">
    <h3 class="text-center font-weight-bold text-white text-uppercase pb-2 mb-4"
        style="margin-top: 100px">My tickets</h3>
    <hr class="w-header my-4 white">
    <!-- Section description -->
    <h3 class="lead text-center text-white pt-2 mb-5">History of buyed tickets</h3>
    <div class="container p-3" style="background-color: white">
        <table class="table align-middle">
        <tr>
            <th width="150" scope="col">Ticket id</th>
            <th width="100" scope="col">Movie name</th>
            <th width="200" scope="col">Movie price</th>
            <th width="80" scope="col">Amount</th>
            <th width="80" scope="col">Total cost</th>
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
</div>
<jsp:include page="../footer.jsp"/>
