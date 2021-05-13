<%--
  Created by IntelliJ IDEA.
  User: assemmukhamadi
  Date: 12.03.2021
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign In Page</title>
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

<%--<body style="background-image: url('https://audiokaif.ru/wp-content/uploads/2020/01/Популярные-Кинокомпании-1024x576.jpg')">--%>
<body style="background-image: url('https://mdbootstrap.com/img/Photos/Others/images/76.jpg')">
<%--<body style="background-image: url('https://www.teahub.io/photos/full/220-2205714_get-the-latest-movies-data-src-kodi-tv.jpg')">--%>
<%--<body style="background-image: url('https://rozetked.me/images/uploads/EjInsjCAt7xA.jpg')">--%>
    <div class="container py-3 z-depth-1 rounded" style="margin-top: 200px; margin-bottom: 100px; background-color: aliceblue">
        <section class="dark-grey-text">
            <h1 class="text-center font-weight-bold pb-2">Welcome!</h1>
            <hr style="width: 200px">
            <h5 class="text-center text-muted w-responsive mx-auto mb-5 mt-4">Sign in as</h5>
            <div class="d-grid gap-2 d-md-block" style="text-align: center">
                <a class="btn btn-primary" href="AdminLogin.jsp">admin</a>
                <a class="btn btn-primary" href="Login.jsp">user</a>
            </div>
        </section>
    </div>
</body>
</html>
