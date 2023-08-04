<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/cssCliente/styles.css">
    <script src="assets/js/jsCliente/JavaScript.js"></script>
    <title>Datos de cliente</title>
    <style>
        /* Estilos del botón */
        .mi-boton {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 4px;
            font-size: 16px;
        }

        footer {
            background-color:
            padding: 20px;
            text-align: center;
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h2>Información Personal</h2>

        <!-- Foto del cliente -->
        <div class="profile-pic">
            <img src="assets/img/imgCliente/pcliente.png" alt="Foto del cliente">
        </div>

        <p><strong>Nombre:</strong> <span id="first-name"></span></p>
        <p><strong>Apellidos:</strong> <span id="last-name"></span></p>
        <p><strong>Email:</strong> <span id="email"></span></p>
        <p><strong>Dirección:</strong></p><span id="location"></span></p>
        <p><strong>No. Telefónico:</strong></p><span id="phone"></span></p>

        <br>
        <br>
        <!-- Menú desplegable -->
        <div class="dropdown">
            <button onclick="myFunction()" class="dropbtn">Servicios</button>
            <div id="myDropdown" class="dropdown-content">
                <a href="#">Productos</a>
                <a href="#">Mantenimientos</a>
            </div>
        </div>
    </div>

    <div class="card">
        <h2>Cambiar contraseña</h2>
        <form>
            <input type="password" id="current-password" name="current-password" placeholder="Contraseña actual">
            <input type="password" id="new-password" name="new-password" placeholder="Nueva contraseña">
            <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirmar nueva contraseña">
            <br>
            <button type="submit">Cambiar contraseña</button>
            <button class="submit">Cerrar sesión</button>
            <div class="row justify-content-center">
            </div>

        </form>
    </div>
</div>

</body>

</html>
