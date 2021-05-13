<%@ page import="Model.Movie" %><%--
  Created by IntelliJ IDEA.
  User: assemmukhamadi
  Date: 14.03.2021
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Movie</title>
<%--    <%! Movie movie; %>--%>
    <jsp:useBean id="movie" class="Model.Movie" scope="session"/>
<%--    <%--%>
<%--//        Movie movie = new Movie();--%>
<%--        movie = (Movie) request.getSession().getAttribute("movie");--%>
<%--        if (movie == null) {--%>
<%--            request.getSession().setAttribute("message",--%>
<%--                    "Error!!!!!!!! Select Product First.");--%>
<%--            response.sendRedirect("Menu.jsp");--%>
<%--        }--%>
<%--        assert movie != null;%>--%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="../user/Logout.jsp"%>
<%--<div align="center">--%>
<%--    <h2>Movie Detail</h2>--%>
<%--</div>--%>
<%--<div>--%>
<%--    <form action="../MovieDetailServlet" method="post">--%>
<%--        <table align="center">--%>
<%--            <tr>--%>
<%--                <td>Movie Id :</td>--%>
<%--                <td><jsp:getProperty name="movie" property="movieId"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Movie Name :</td>--%>
<%--                <td><jsp:getProperty name="movie" property="movieName"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Movie Price :</td>--%>
<%--                <td><jsp:getProperty name="movie" property="moviePrice"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Movie Year :</td>--%>
<%--                <td><jsp:getProperty name="movie" property="movieYear"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td align="center"><a--%>
<%--                        href="../BuyTicketServlet?movieId=<jsp:getProperty name="movie" property="movieId"/>">--%>
<%--                    <button type="button">Buy Tickets</button>--%>
<%--                </a></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>
<section class="text-center"
         style="background-size: cover; height: 810px">

    <!-- Section heading -->
    <h3 class="text-center font-weight-bold text-white text-uppercase pb-2 mb-4"
        style="margin-top: 100px">Movie Detail</h3>
    <hr class="w-header my-4 white">
    <!-- Section description -->
    <h3 class="lead text-center text-white pt-2 mb-5">Welcome!</h3>

    <form class="mb-5 mx-md-5" action="../BuyTicketServlet" method="post">
        <div class="col-md-4 pt-4 pb-4 mb-4" style="background-color: white; width: 400px; margin: auto; ">
            <%--        <div class="col-md-4 mb-4" style="margin: auto;">--%>
                <h3 class="lead text-center"> Movie ID: <jsp:getProperty name="movie" property="movieId"/></h3>
            <h3 class="lead text-center"> Movie Name: <jsp:getProperty name="movie" property="movieName"/></h3>
            <%--        </div>--%>
            <%--        --%>
            <%--        <div class="col-md-4 mb-4" style="margin: auto;">--%>
            <h3 class="lead text-center pt-2">Movie Price: <jsp:getProperty name="movie" property="moviePrice"/></h3>
            <%--        </div>--%>

            <%--        <div class="col-md-4 mb-4" style="margin: auto;">--%>
            <h3 class="lead text-center pt-2 mb-2">Movie Year: <jsp:getProperty name="movie" property="movieYear"/></h3>
            <%--        </div>--%>
        </div>

        <div class="text-center">

            <a
                    href="../BuyTicketServlet?movieId=<jsp:getProperty name="movie" property="movieId"/>">
                <button class="btn btn-elegant" type="button">Buy</button>
            </a>

        </div>
    </form>

</section>
<jsp:include page="../footer.jsp"/>
