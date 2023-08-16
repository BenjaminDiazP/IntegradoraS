<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Panel de Empleado</title>
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="assets/css/cssGerente/styles.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
<div class="container my-3">
    <div class="card">
        <div class="card-header">
            <h2>Bienvenido Gerente</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <img id="fotoEmpleado" src="assets/img/imgGerente/usuario.png" alt="Foto de Empleado" class="img-thumbnail">
                </div>
                <c:if test ="${not empty usuario}">
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="info-row d-flex">
                                <p><strong>Nombre: ${ usuario}</strong> <span id="nombreEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Apellido Paterno: ${apellido1}</strong> <span id="apellidoEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Apellido Materno: ${apellido2}</strong> <span id="rolEmpleado"></span></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-row d-flex">
                                <p><strong>Email: ${correo}</strong> <span id="emailEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Dirección: ${direccion}</strong> <span id="direccionEmpleado"></span></p>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    <div class="row">
                        <div class="col-md-12 d-flex justify-content-end">
                            <button type="button" class="btn btn-link" data-toggle="collapse"
                                    data-target="#moreInfo">Cambiar contraseña</button>
                        </div>
                    </div>
                    <div id="moreInfo" class="collapse mt-3">
                        <p><strong>Estás a punto de cambiar tu contraseña o correo</strong></p>
                        <!-- Aquí puedes agregar más información sobre el gerente -->
                        <div class="menu-container">
                            <div class="boton-modal">
                                <button class="btn btn-primary" onclick="abrirModal('modal-1')">Modificar
                                    contraseña</button>
                            </div>
                            <input type="checkbox" id="btn-modal">
                            <br>
                            <div class="boton-modal">
                                <button class="btn btn-primary" onclick="abrirModal('modal-2')">Modificar
                                    correo</button>
                            </div>
                            <input type="checkbox" id="btn-modal">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-header">
            <h2>Acciones</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="card mb-3">
                        <a href="#" class="funcion" data-toggle="collapse" data-target="#extraFunciones1">
                            <div class="card-body">
                                <h4 class="card-title">Consultar usuarios</h4>
                                <p class="card-text">Podras crear,eliminar,modificar usuarios</p>
                            </div>
                        </a>
                        <div id="extraFunciones1" class="collapse extra-funciones">
                            <div class="card">
                                <a href="RegistroServlet?tipo=empleado" class="funcion">
                                    <div class="card-body">
                                        <h4 class="card-title">Empleados</h4>

                                    </div>
                                </a>
                            </div>
                            <div class="card">
                                <a href="RegistroServlet?tipo=cliente" class="funcion">
                                    <div class="card-body">
                                        <h4 class="card-title">Clientes</h4>

                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <a href="VentasServlet?tipo=inicio" class="funcion">
                            <div class="card-body">
                                <h4 class="card-title">Generar Venta</h4>
                                <p class="card-text">Podras cobrar </p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mb-3">
                        <a href="#" class="funcion" data-toggle="collapse" data-target="#extraFunciones2">
                            <div class="card-body">
                                <h4 class="card-title">Consultar Servicios</h4>
                                <p class="card-text">Creacion,eliminacion,modificacion de productos y paquetes </p>
                            </div>
                        </a>
                        <div id="extraFunciones2" class="collapse extra-funciones">
                            <div class="card">
                                <a href="RegistroArticulosServlet?tipo=paquetes" class="funcion">
                                    <div class="card-body">
                                        <h4 class="card-title">Paquetes</h4>

                                    </div>
                                </a>
                            </div>
                            <div class="card">
                                <a href="RegistroArticulosServlet?tipo=articulos" class="funcion">
                                    <div class="card-body">
                                        <h4 class="card-title">Articulos</h4>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <a href="#" class="funcion" data-toggle="collapse" data-target="#extraFunciones4">
                            <div class="card-body">
                                <h4 class="card-title">Historial</h4>
                                <p class="card-text">Podras ver el historial de ventas </p>
                            </div>
                        </a>
                        <div id="extraFunciones4" class="collapse extra-funciones">
                            <div class="card">
                                <a href="HistorialMantenimientosG.jsp" class="funcion">
                                    <div class="card-body">
                                        <h4 class="card-title">Mantenimientos</h4>

                                    </div>
                                </a>
                            </div>
                            <div class="card">
                                <a href="TablasVentasMPServlet?tipo=VentasP" class="funcion">
                                    <div class="card-body">
                                        <h4 class="card-title">Productos</h4>

                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ... -->

            <div class="row justify-content-center">
                <div class="col-md-2">
                    <a href="LogoutServlet" id="cerrarSesion" class="btn btn-block">Cerrar sesión</a>
                </div>
            </div>

            <!-- ... -->
        </div>
    </div>
</div>

<!--Agrego modal de cambiar contrasena-->
<div class="container-modal" id="modal-1">
    <div class="content-modal">
        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h2>Cambiar contraseña</h2>
                </div>
                <form id="cambio-contrasenia-Form" method="post" action="CambiarContraCorreoECServlet">
                    <div class="form-row d-flex justify-content-center">
                        <div class="form-group col-md-6">
                            <label >Ingresa tu nueva contraseña</label>
                            <input type="text" class="form-control" name="nuevacontra" required>
                            <label >Repite tu contraseña</label>
                            <input type="text" class="form-control" name="nuevacontrac" required>
                            <label ></label>
                            <input type="hidden" class="form-control" name="correo" required value="${correo}">
                            <label ></label>
                            <input type="hidden" class="form-control" name="rol" required value="${tipoSesion}">
                        </div>
                    </div>
                    <div class="footer">
                        <div class="col-12 d-flex justify-content-center">

                            <div>
                                <input type="submit" value="Cambiar contraseña" class="btn btn-primary">
                                <input type="hidden" value="Cambiar contrasenia" name="accion" class="btn btn-primary">
                            </div>
                        </div>
                    </div>
                </form>
                <div class="btn-cerrar">
                    <button class="btn btn-primary" onclick="cerrarModal('modal-1')">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--el segundo modal-->
<div class="container-modal" id="modal-2">
    <div class="content-modal">
        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h2>Cambiar correo</h2>
                </div>
                <form id="cambio-correo-Form" method="post" action="CambiarContraCorreoECServlet">
                    <div class="form-row d-flex justify-content-center">
                        <div class="form-group col-md-6">
                            <label >Ingresa tu nuevo correo</label>
                            <input type="text" class="form-control" name="correonuevo" required>
                            <label >Repite tu correo</label>
                            <input type="text" class="form-control" name="correonuevoc" required>
                            <label ></label>
                            <input type="hidden" class="form-control" name="rol" required value="${tipoSesion}">

                        </div>
                    </div>
                    <div class="footer">
                        <div class="col-12 d-flex justify-content-center">

                            <div>
                                <input type="submit" value="Cambiar correo" class="btn btn-primary">
                                <input type="hidden" value="Cambiar correo" name="accion" class="btn btn-primary">
                            </div>
                        </div>
                    </div>
                </form>
                <div class="btn-cerrar">
                    <button class="btn btn-primary" onclick="cerrarModal('modal-2')">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-------------------------------------->

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
    <c:when test="${not empty mensajeErrorCambioCorreo}">
        <script>
            swal({
                title: "Error de correo!",
                text: "No se logro actualizar el correo.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeErrorCambioCorreo" scope="session"/>
            // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
            setTimeout(function() {
                location.reload();
            }, 2000);
        </script>
    </c:when>
    <c:when test="${not empty mensajeErrorNoCoincideCorreo}">
        <script>
            swal({
                title: "Error de correo!",
                text: "No coinciden los correos.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeErrorNoCoincideCorreo" scope="session"/>
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




<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>
