<%@page	import="Model.Movie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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

<section class="p-5  text-center"
		 style="background-size: cover; height: 810px">

	<!-- Section heading -->
	<h3 class="text-center font-weight-bold text-white text-uppercase pb-2 mb-4"
		style="margin-top: 100px">Update Movie</h3>
	<hr class="w-header my-4 white">
	<!-- Section description -->
	<h3 class="lead text-center text-white pt-2 mb-5">Welcome!</h3>

	<form class="mb-5 mx-md-5" action="../EditMovieServlet" method="post">

		<div class="col-md-4 mb-4" style="margin: auto;">

			<input type="text" class="form-control" name="movie_id" readonly="readonly"
				   value="<%=movie.getMovieId()%>"  />

		</div>

		<div class="col-md-4 mb-4" style="margin: auto;">

			<input type="text" name="movie_name" class="form-control" required="true"
				   value="<%=movie.getMovieName()%>" />

		</div>
		<div class="col-md-4 mb-4" style="margin: auto;">

			<input type="text" name="movie_price" class="form-control" required="true"
				   value="<%=movie.getMoviePrice()%>" pattern="[0-9.]+" />
		</div>

		<div class="col-md-4 mb-4" style="margin: auto;">

			<input type="text" name="movie_year" class="form-control" required="true"
				   value="<%=movie.getMovieYear()%>" pattern="[0-9.]+"/>
		</div>

		<div class="text-center">
			<input class="btn btn-elegant" value="Update Movie"
				   type="submit" />
		</div>
	</form>

</section>
<%@ include file = "../footer.jsp" %>

