<%@page import="java.util.List"%>
 <%@ page import="java.io.*" %>
<%@ page import="Model.Movie" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DAO.MyDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Categories</title>
	<%! Movie movie; %>
	<%
		MyDao myDao = new MyDao();
		List<?> movies = myDao.select();
	%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="Logout.jsp"%>
	<div align="center" id="edit">
		<h1>Movies</h1>
		<table border="1">
			<tr>
				<th width="150">Movie Name</th>
				<th width="100">Movie Price</th>
				<th width="200">Movie Year</th>
				<th width="80">Edit</th>
				<th width="80">Delete</th>
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
					href="../EditMovieServlet?movieId=<%=movie.getMovieId()%>">
						<button type="button">Edit</button>
				</a></td>
				<td align="center"><a
					href="../DeleteMovieServlet?movieId=<%=movie.getMovieId()%>">
						<button type="button">Delete</button>
				</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%@ include file = "../footer.jsp" %>

