<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Datos de cliente</title>
<<<<<<< HEAD
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
=======
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssCliente/styleCliente.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
>>>>>>> Benja
</head>

<body>

<div class="container">

    <div class="card">

        <h2>Información Personal</h2>
        <div class="profile-pic">
            <img src="assets/img/imgCliente/Pcliente.png" alt="Foto del cliente">
        </div>

<<<<<<< HEAD
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
=======
        <p><strong>Nombre:</strong> <span id="nombre">${usuario}</span></p>
        <p><strong>Apellidos:</strong> <span id="apellidos">${apellido1} ${apellido2}</span></p>
        <p><strong>Email:</strong> <span id="correo">${correo}</span></p>

>>>>>>> Benja
    </div>
    <div class="card">
<<<<<<< HEAD
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

=======
        <h2>Opciones de perfil</h2>
        <br>
        <button class="btn-menu" type="button" id="passwordMenuBtn">Cambiar contraseña</button>
        <div id="passwordMenu" class="menu-content" style="display: none;">
            <form method="post" action="CambiarContraCorreoECServlet">
                <div class="form-group">
                    <label >Nueva contraseña:</label>
                    <input type="password"  name="nuevacontra" required class="form-control">
                </div>
                <div class="form-group">
                    <label >Confirmar nueva contraseña:</label>
                    <input type="password"  name="nuevacontrac" required class="form-control">
                </div>
                <div class="form-group">
                <label ></label>
                <input type="hidden" class="form-control" name="rol" required value="${tipoSesion}">
                </div>
                <div class="form-group">
                    <label ></label>
                    <input type="hidden" class="form-control" name="correo" required value="${correo}">
                </div>
                <div class="form-actions text-center">
                    <button class="btn btn-secundary" type="submit">Guardar contraseña</button>
                    <input type="hidden" value="Cambiar contrasenia" name="accion" class="btn btn-primary">
                </div>
            </form>
        </div>
        <br>
        <button class="btn-menu" type="button" id="emailMenuBtn">Cambiar correo</button>
        <div id="emailMenu" class="menu-content" style="display: none;">
            <form method="post" action="CambiarContraCorreoECServlet">
                <div class="form-group">
                    <label >Nuevo correo electrónico:</label>
                    <input type="text"  name="correonuevo" required class="form-control">
                </div>
                <div class="form-group">
                    <label >Confirmar nuevo correo electrónico:</label>
                    <input type="text"  name="correonuevoc" required class="form-control">
                </div>
                <div class="form-actions text-center">
                    <input type="submit" value="Cambiar correo" class="btn btn-secundary">
                    <input type="hidden" value="Cambiar correocliente" name="accion" class="btn btn-primary">
                </div>
            </form>
        </div>
        <br>
        <button class="btn-menu" type="button" id="servicesMenuBtn">Servicios</button>
        <div id="servicesMenu" class="menu-content" style="display: none;">
            <a class="btn btn-secundary" href="HistorialMantenimientoCl.jsp">Historial mantenimientos</a>
            <a class="btn btn-secundary" href="HistorialComprasCl.jsp">Historial de compras</a>
            <a class="btn btn-secundary">Mostrar Tickets</a>
        </div>
        <br>
        <form method="get" action="LogoutServlet">
            <input type="submit" value="Cerrar sesión"  class="btn-menu">
            <input type="hidden" value="Agregar usuario" name="Registrar">
>>>>>>> Benja
        </form>

    </div>

</div>

<<<<<<< HEAD
</body>

</html>
=======

<c:choose>
    <c:when test="${not empty mensajeErrorNoseActualizocontrasenia}">
        <script>
            swal({
                title: "Error de contraseñas!",
                text: "La contrasenia no se actualizo.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeErrorNoseActualizocontrasenia" scope="session"/>
            // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
            setTimeout(function() {
                location.reload();
            }, 2000);
        </script>
    </c:when>
    <c:when test="${not empty mensajeErrorContrasenias}">
        <script>
            swal({
                title: "Error de contraseñas!",
                text: "Las contraseñas no coinciden.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeErrorContrasenias" scope="session"/>
            // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
            setTimeout(function() {
                location.reload();
            }, 2000);
        </script>
    </c:when>
    <c:when test="${not empty mensajeErrorNoseActualizoCorreo}">
        <script>
            swal({
                title: "Error de correo!",
                text: "No se logro actualizar el correo.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeErrorNoseActualizoCorreo" scope="session"/>
            // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
            setTimeout(function() {
                location.reload();
            }, 2000);
        </script>
    </c:when>
    <c:when test="${not empty mensajeErrorCorreos}">
        <script>
            swal({
                title: "Error de correo!",
                text: "No coinciden los correos.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeErrorCorreos" scope="session"/>
            // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
            setTimeout(function() {
                location.reload();
            }, 2000);
        </script>
    </c:when>
    <c:when test="${not empty mensajeExito}">
        <script>
            swal({
                title: "Cambio Existoso!",
                text: "Se a actualizado correctamente.",
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




<script src="assets/js/jsCliente/scriptCliente.js"></script>

</body>

</html>
>>>>>>> Benja
