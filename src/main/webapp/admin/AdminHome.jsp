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
<h1>Admin Home Page</h1>
<h1>My Login: <%out.print(admin);%></h1>
    <li><a href="AddMovie.jsp">New Movie</a></li>
    <li><a href="ListMovies.jsp">List Movie</a></li>
<%@ include file = "../footer.jsp" %>

