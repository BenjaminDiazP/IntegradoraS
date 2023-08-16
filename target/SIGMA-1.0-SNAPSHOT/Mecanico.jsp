<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Panel de Empleado</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/cssGerente/styles.css" type="text/css">

</head>

<body>
<div class="container my-3">
    <div class="card">
        <div class="card-header">
            <h2>Bienvenido Mecanico</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <img id="fotoEmpleado" src="" alt="Foto de Empleado" class="img-thumbnail">
                </div>
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="info-row d-flex">
                                <p><strong>Nombre:</strong> <span id="nombreEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Apellido Materno:</strong> <span id="apellidoEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Apellido Paterno:</strong> <span id="rolEmpleado"></span></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-row d-flex">
                                <p><strong>Edad:</strong> <span id="edadEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Email:</strong> <span id="emailEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Dirección:</strong> <span id="direccionEmpleado"></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 d-flex justify-content-end">
                            <button type="button" class="btn btn-link" data-toggle="collapse"
                                    data-target="#moreInfo">Cambiar contraseña</button>
                        </div>
                    </div>
                    <div id="moreInfo" class="collapse mt-3">
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

            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-3">
                            <a href="ConsultaMantenimientoServlet?tipo=inicio" class="funcion">
                                <div class="card-body">
                                    <h4 class="card-title">Mantenimientos</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-3">
                            <a href="ConsultaMantenimientoServlet?tipo=historial" class="funcion">
                                <div class="card-body">
                                    <h4 class="card-title">Historial de mantenimientos</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-2">
                    <a href="LogoutServlet" id="cerrarSesion" class="btn btn-block">Cerrar sesión</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-modal" id="modal-1">
    <div class="content-modal">
        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h2>Cambiar contraseña</h2>
                </div>
                <form id="cambio-contrasenia-Form">
                    <div class="form-row d-flex justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="contra1">Ingresa tu nueva contraseña</label>
                            <input type="text" class="form-control" id="contra1" required>
                            <label for="contra2">Repite tu contraseña</label>
                            <input type="text" class="form-control" id="contra2" required>
                        </div>
                    </div>
                    <div class="footer">
                        <div class="col-12 d-flex justify-content-center">

                            <div>
                                <input type="submit" value="Cambiar contraseña" class="btn btn-primary">
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

<div class="container-modal" id="modal-2">
    <div class="content-modal">
        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h2>Cambiar correo</h2>
                </div>
                <form id="cambio-correo-Form">
                    <div class="form-row d-flex justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="correo1">Ingresa tu nuevo correo</label>
                            <input type="text" class="form-control" id="correo1" required>
                            <label for="correo2">Repite tu correo</label>
                            <input type="text" class="form-control" id="correo2" required>
                        </div>
                    </div>
                    <div class="footer">
                        <div class="col-12 d-flex justify-content-center">

                            <div>
                                <input type="submit" value="Cambiar correo" class="btn btn-primary">
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


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

