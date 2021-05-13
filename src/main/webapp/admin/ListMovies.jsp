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

	<%! Movie movie; %>
	<%
		MyDao myDao = new MyDao();
		List<?> movies = myDao.select();
	%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="Logout.jsp"%>
	<div align="center" id="edit">
		<h3 class="text-center font-weight-bold text-white text-uppercase pb-2 mb-4"
			style="margin-top: 100px">Movies</h3>
		<hr class="w-header my-4 white">
		<!-- Section description -->
		<h3 class="lead text-center text-white pt-2 mb-5">Here you can edit or delete a movie</h3>
		<div class="container p-3" style="background-color: white">
			<table border="1" class="table align-middle">
			<tr>
				<th width="150" scope="col">Movie Name</th>
				<th width="100" scope="col">Movie Price</th>
				<th width="200" scope="col">Movie Year</th>
				<th width="80" scope="col">Edit</th>
				<th width="80" scope="col">Delete</th>
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
						<button type="button" class="btn btn-danger btn-sm px-3"><i class="fas fa-cog"></i></button>
				</a></td>
				<td align="center">
					<a href="../DeleteMovieServlet?movieId=<%=movie.getMovieId()%>">
						<button type="button" class="btn btn-danger btn-sm px-3"><i class="fas fa-times"></i></button>
					</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		</div>
	</div>
<%@ include file = "../footer.jsp" %>

