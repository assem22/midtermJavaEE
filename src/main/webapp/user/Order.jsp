<%@ page import="Model.Movie" %><%--
  Created by IntelliJ IDEA.
  User: assemmukhamadi
  Date: 12.03.2021
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>

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

    <%! Movie movie; %>
    <%
        movie = (Movie) request.getSession().getAttribute("movie");
        if (movie == null) {
            request.getSession().setAttribute("message",
                    "Error!!!!!!!! Select Product First.");
            response.sendRedirect("AdminHome.jsp");
        }
        assert movie != null;%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="../user/Logout.jsp"%>
<section class="text-center"
         style="background-size: cover; height: 810px">

    <!-- Section heading -->
    <h3 class="text-center font-weight-bold text-white text-uppercase pb-2 mb-4"
        style="margin-top: 100px">Buy Ticket</h3>
    <hr class="w-header my-4 white">
    <!-- Section description -->
    <h3 class="lead text-center text-white pt-2 mb-5">Welcome!</h3>

    <form class="mb-5 mx-md-5" action="../BuyTicketServlet" method="post">
    <div class="col-md-4 pt-4 pb-4 mb-4" style="background-color: white; width: 400px; margin: auto; ">
<%--        <div class="col-md-4 mb-4" style="margin: auto;">--%>
            <h3 class="lead text-center"> Movie Name: <%=movie.getMovieName()%></h3>
<%--        </div>--%>
<%--        --%>
<%--        <div class="col-md-4 mb-4" style="margin: auto;">--%>
            <h3 class="lead text-center pt-2">Movie Price: <%=movie.getMoviePrice()%></h3>
<%--        </div>--%>

<%--        <div class="col-md-4 mb-4" style="margin: auto;">--%>
            <h3 class="lead text-center pt-2 mb-2">Movie Year: <%=movie.getMovieYear()%></h3>
<%--        </div>--%>
    </div>
        <div class="col-md-4 mb-4" style="margin: auto;">
            <input type="text" name="amount" class="form-control" required="true" placeholder="Ticket amount"/>
        </div>

        <div class="col-md-4 mb-4" style="margin: auto;">
            <input type="text" name="user_email" class="form-control" required="true" placeholder="Your email"/>
        </div>

        <div class="text-center">
            <input class="btn btn-elegant" value="Buy"
                   type="submit" />

        </div>
    </form>

</section>
<jsp:include page="../footer.jsp"/>
