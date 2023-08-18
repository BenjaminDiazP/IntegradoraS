<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>RestaurarContraseña</title>

  <link rel="stylesheet" href="assets/css/css-iniciosesion/style.css" type="text/css">
  <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.png">
  <link rel="stylesheet" href="assets/css/css-iniciosesion/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

<div class="login-box">
  <center><img src="assets/img/img-iniciosesion/Logo.png" width="140px" height="100px"></center>
  <h3>Recuperar contraseña</h3>
  <form method="post" action="RegistroServlet">
    <div class="user-box">
      <input type="email" name ="correo">
      <label>Correo Electrónico</label>
    </div>
    <center><input type="submit" value="enviar" class="login-box-form-submit"></center>
    <center><input type="Hidden" value="Reestablecer Contrasenia E" name="Registrar"  class="login-box-form-submit"></center>
  </form>
</div>

  <c:choose>
    <c:when test="${not empty mensajeError}">
      <script>
        swal({
          title: "Error de correo!",
          text: "${mensajeError}",
          icon: "error",
        });
        // Elimina el atributo de sesión después de mostrar el mensaje
        <c:remove var="mensajeError" scope="session"/>
        // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
        setTimeout(function() {
          location.reload();
        }, 2000);
      </script>
    </c:when>
  <c:when test="${not empty mensajeExito}">
  <script>
    swal({
      title: "Registro Existoso!",
      text: "Se ha registrado un Empleado correctamente.",
      icon: "success",
    });
    // Elimina el atributo de sesión después de mostrar el mensaje
    <c:remove var="mensajeExito" scope="session" />
    // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
    setTimeout(function() {
      location.reload();
    }, 2000);
  </script>
  </c:when>
  </c:choose>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 </body>
</html>
