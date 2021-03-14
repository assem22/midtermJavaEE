<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Page</title>
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
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark" style="background-color: cornflowerblue">
    <a class="navbar-brand" href="main.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
            aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>

<section class="p-5  text-center"
         style="background-size: cover; background-color: cornflowerblue; height: 810px">

    <!-- Section heading -->
    <h3 class="text-center font-weight-bold text-white text-uppercase pb-2 mb-4"
        style="margin-top: 100px">Sign up</h3>
    <hr class="w-header my-4 white">
    <!-- Section description -->
    <h3 class="lead text-center text-white pt-2 mb-5">Welcome!</h3>

    <form class="mb-5 mx-md-5" action="UserRegisterServlet" method="POST">

        <div class="col-md-4 mb-4" style="margin: auto;">

            <!-- Name -->
            <input type="text" class="form-control" placeholder="Name" name="form-username"/>

        </div>
        <div class="col-md-4 mb-4" style="margin: auto;">

            <!-- Email -->
            <input type="email" class="form-control" placeholder="Email" name="form-email"/>
        </div>

        <div class="col-md-4 mb-4" style="margin: auto;">

            <!-- Subject -->
            <input type="password" class="form-control" placeholder="Password" name="form-password"/>
        </div>

        <div class="col-md-4 mb-4" style="margin: auto;">

            <!-- Subject -->
            <input type="password" id="password1" class="form-control" placeholder="Repeat password"
                   name="confirm-password">

        </div>

        <div class="text-center">
            <button class="btn btn-elegant" type="submit">Sign up</button>
        </div>
    </form>

</section>
<!--Section: Content-->
</body>
</html>
