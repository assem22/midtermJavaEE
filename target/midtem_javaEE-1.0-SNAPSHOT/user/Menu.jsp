<%@ page import="Model.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: assemmukhamadi
  Date: 12.03.2021
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In Page</title>
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
    </head>
    <% List<?> movies = (List<?>) request.getSession().getAttribute("movies");%>
    <%! Movie movie; %>

    <%! User user; %>
    <%
        //        Movie movie = new Movie();
        user = (User) request.getSession().getAttribute("logged_user");
        if (user == null) {
            request.getSession().setAttribute("message",
                    "Error!!!!!!!! Select Product First.");
            response.sendRedirect("Login.jsp");
        }
        assert user != null;%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="../user/Logout.jsp"%>
<div align="center" id="edit">
    <h3 class="text-center font-weight-bold text-white text-uppercase pb-2 mb-4"
        style="margin-top: 100px">Movies</h3>
    <hr class="w-header my-4 white">
    <!-- Section description -->
    <h3 class="lead text-center text-white pt-2 mb-5">Welcome, <%out.print(user.getUsername());%></h3>
    <div class="container p-3" style="background-color: white">
    <table class="table align-middle">
        <tr>
            <th width="150" scope="col">Movie Name</th>
            <th width="100" scope="col">Movie Price</th>
            <th width="200" scope="col">Movie Year</th>
            <th width="80" scope="col">Detail</th>
        </tr>
        <%
            for (Object obj : movies) {
                movie = (Movie) obj;
        %>
        <tr>
            <td align="center"><%=movie.getMovieName()%></td>
            <td align="center"><%=movie.getMoviePrice()%></td>
            <td align="center"><%=movie.getMovieYear()%></td>
            <td align="center"><a
                    href="../MovieDetailServlet?movieId=<%=movie.getMovieId()%>">
                <button type="button" class="btn btn-danger btn-sm px-3"><i class="fas fa-info-circle"></i></button>
            </a></td>
        </tr>
        <%
            }
        %>
    </table>
    </div>
</div>
<jsp:include page="../footer.jsp"/>
