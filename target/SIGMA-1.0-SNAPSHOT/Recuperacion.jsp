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
</head>
<body>

<div class="login-box">
  <center><img src="assets/img/img-iniciosesion/Logo.png" width="140px" height="100px"></center>
  <h3>Recuperar contraseña</h3>
  <form>
    <div class="user-box">
      <input type="email" name ="correo">
      <label>Correo Electrónico</label>
    </div>
    <center><input type="submit" value="enviar" class="login-box-form-submit" name="RecuperarCon"></center>
    <center><input type="Hidden" value="enviar" class="login-box-form-submit" name="RecuperarCon"></center>
  </form>


 </body>
</html>
