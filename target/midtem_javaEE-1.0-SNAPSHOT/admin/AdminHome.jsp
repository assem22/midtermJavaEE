<%@ page import="Model.Admin" %><%--
  Created by IntelliJ IDEA.
  User: assemmukhamadi
  Date: 14.03.2021
  Time: 01:51
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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

    <title>Admin Home Page</title>
    <%! String admin; %>
    <%
        //        Movie movie = new Movie();
        admin = (String) request.getSession().getAttribute("admin_name");
        if (admin == null) {
            request.getSession().setAttribute("message",
                    "Error!!!!!!!! Select Product First.");
            response.sendRedirect("Login.jsp");
        }
        assert admin != null;%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="Logout.jsp"%>
<div class="container py-3 z-depth-1 rounded" style="margin-top: 200px; margin-bottom: 100px; background-color: aliceblue">
    <section class="dark-grey-text">
        <h1 class="text-center font-weight-bold pb-2">Admin Home Page</h1>
        <h3 class="text-center w-responsive mx-auto pb-2">My Login: <%out.print(admin);%></h3>
        <hr style="width: 200px">
        <h5 class="text-center text-muted w-responsive mx-auto mb-5 mt-4">Menu</h5>
        <div class="d-grid gap-2 d-md-block" style="text-align: center">
            <a class="btn btn-primary" href="AddMovie.jsp">New Movie</a>
            <a class="btn btn-primary" href="ListMovies.jsp">List Movie</a>
        </div>
    </section>
</div>
<%@ include file = "../footer.jsp" %>

