<%@page	import="Model.Movie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Product Details</title>
	<%-- Here I used declaration scriptlet to declare Movie object (also I can do it also in
	statement scriptlet), and here I used comment scriptlet --%>
	<%! Movie movie; %>
	<%
//		Movie movie;
		movie = (Movie) request.getSession().getAttribute("movie");
		if (movie == null) {
			request.getSession().setAttribute("message",
					"Error!!!!!!!! Select Product First.");
			response.sendRedirect("AdminHome.jsp");
		}
		assert movie != null;%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<%@ include file="Logout.jsp"%>
<div align="center">
	<h2>Update Movie</h2>
</div>
<div>
	<form action="../EditMovieServlet" method="post">
		<table align="center">
			<tr>
				<td>Movie Id :</td>
				<td><input type="text" name="movie_id" readonly="readonly"
						   value="<%=movie.getMovieId()%>" /></td>
			</tr>
			<tr>
				<td>Movie Name :</td>
				<td><input type="text" name="movie_name" required="true"
						   value="<%=movie.getMovieName()%>" /></td>
			</tr>
			<tr>
				<td>Movie Price :</td>
				<td><input type="text" name="movie_price" required="true"
						   value="<%=movie.getMoviePrice()%>" pattern="[0-9.]+" /></td>
			</tr>
			<tr>
				<td>Movie Year :</td>
				<td><input type="text" name="movie_year" required="true"
						   value="<%=movie.getMovieYear()%>" pattern="[0-9.]+" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input value="Update Product"
													  type="submit" /></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file = "../footer.jsp" %>

