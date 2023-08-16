<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Integradora</title>
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.png">
    <link rel="stylesheet" href="assets/css/css-iniciosesion/style.css" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
<div class="login-box">
    <center><img src="assets/img/img-iniciosesion/Logo.png" width="140px" height="100px" ></center>
    <h3>Inicio de Sesión</h3>
    <form action="LoginServlet" method="post">
        <div class="user-box">
            <input type="email" name = "correo" required>
            <label>Correo</label>
        </div>
        <div class="user-box">
            <input type="password" name ="contra" required>

            <label>Contraseña</label>
        </div>
        <input type="hidden" name="accion" value="ingresar">

        <div class="btn-container">
            <input type="submit" value="ingresar" class="login-box-form-submit">
        </div>
        <a  href="Recuperacion.jsp" class="login-box-form-submit">Recuperar contraseña</a>
    </form>
    <br>
</div>

<c:if test="${not empty sessionScope.ErrorSesion}">
    <script>
        swal({
            title: "Error de Inicio de Sesión",
            text: "${sessionScope.ErrorSesion}",
            icon: "error",
            button: "Aceptar",
        });
    </script>
    <c:remove var="ErrorSesion" scope="session"/>
</c:if>


<script src="assets/js/bootstrap.bundle.min.js"></script>

</body>

</html>