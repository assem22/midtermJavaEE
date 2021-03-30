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
    <%! Movie movie; %>
    <%
//        Movie movie = new Movie();
        movie = (Movie) request.getSession().getAttribute("movie");
        if (movie == null) {
            request.getSession().setAttribute("message",
                    "Error!!!!!!!! Select Product First.");
            response.sendRedirect("Menu.jsp");
        }
        assert movie != null;%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<div align="center">
    <h2>Add New Product</h2>
</div>
<div>
    <form action="../MovieDetailServlet" method="post">
        <table align="center">
            <tr>
                <td>Movie Id :</td>
                <td><%=movie.getMovieId()%></td>
            </tr>
            <tr>
                <td>Movie Name :</td>
                <td><%=movie.getMovieName()%></td>
            </tr>
            <tr>
                <td>Movie Price :</td>
                <td><%=movie.getMoviePrice()%></td>
            </tr>
            <tr>
                <td>Movie Year :</td>
                <td><%=movie.getMovieYear()%></td>
            </tr>
            <tr>
                <td align="center"><a
                        href="../BuyTicketServlet?movieId=<%=movie.getMovieId()%>">
                    <button type="button">Buy Tickets</button>
                </a></td>
            </tr>
        </table>
    </form>
</div>
<%@ include file = "../footer.jsp" %>

