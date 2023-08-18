<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RestaurarContraseña</title>
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
    <link rel="stylesheet" href="assets/css/css-iniciosesion/style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

<div class="login-box">
    <center><img src="assets/img/img-iniciosesion/Logo.png" width="140px" height="100px"></center>
    <h3>Restablecer contraseña</h3>
    <br>
    <form method="post" action="RegistroServlet">
        <div class="user-box">
            <input type="text" name="codigoS">
            <label>Ingresa el código de seguridad</label>
        </div>
        <div class="user-box">
            <input type="hidden" name="correo" id="correoInput">
            <label></label>
        </div>
        <center><input type="submit" value="Enviar" class="login-box-form-submit"></center>
        <input type="hidden" value="ComprobarCodigoSec" name="Registrar">
    </form>

</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var correoFromURL = getParameterByName("correo");
        var correoInput = document.getElementById("correoInput");
        if (correoFromURL) {
            correoInput.value = correoFromURL;
        }
    });

    function getParameterByName(name, url = window.location.href) {
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
</script>



<c:choose>
    <c:when test="${not empty mensajeError}">
        <script>
            swal({
                title: "Error de Codigo!",
                text: "El codigo no concide.",
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
</body>
</html>
