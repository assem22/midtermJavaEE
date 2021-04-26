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
<div align="center">
    <h2>Buy Ticket</h2>
</div>
<div>
    <form action="../BuyTicketServlet" method="post">
        <table align="center">
            <tr>
                <td>Movie Name :</td>
                <td><%=movie.getMovieName()%></td>
            </tr>
            <tr>
                <td>Movie Price :</td>
                <td><%=movie.getMovieName()%></td>
            </tr>
            <tr>
                <td>Ticket amount :</td>
                <td><input type="text" name="amount" required="true" /></td>
            </tr>
            <tr>
                <td>Your email:</td>
                <td><input type="text" name="user_email" required="true" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input value="Buy"
                                                      type="submit" /></td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="../footer.jsp"/>
