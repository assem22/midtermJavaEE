<%@ page import="Model.Movie" %>
<%@ page import="java.util.List" %><%--
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
    <%
        List<?> movies = (List<?>) request.getSession().getAttribute("movies");
        Movie movie = new Movie();
    %>
</head>
<body>
<h1>Menu for user</h1>
<div align="center" id="edit">
    <table border="1">
        <tr>
            <th width="150">Movie Name</th>
            <th width="100">Movie Price</th>
            <th width="200">Movie Year</th>
            <th width="80">Detail</th>
        </tr>
        <%
            for (Object obj : movies) {
                movie = (Movie) obj;
        %>
        <tr>
            <td align="center"><%=movie.getMovieName()%></td>
            <td align="center">Rs. <%=movie.getMoviePrice()%></td>
            <td align="center"><%=movie.getMovieYear()%></td>
            <td align="center"><a
                    href="../MovieDetailServlet?movieId=<%=movie.getMovieId()%>">
                <button type="button">Detail</button>
            </a></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<a href="../UserLogoutServlet">
    <button type="button">Logout</button>
</a>
</body>
</html>
