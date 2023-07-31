<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Panel de Recepcionista</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/cssRecepcionista/styles.css">
</head>

<body>
<div class="container my-3">
    <div class="card">
        <div class="card-header">
            <h2>Bienvenido Recepcionista</h2>
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
                                <p><strong>Nombre: ${usuario}</strong> <span id="nombreEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Apellido Materno: ${apellido1}</strong> <span id="apellidoEmpleado"></span></p>
                            </div>
                            <div class="info-row d-flex">
                                <p><strong>Apellido Paterno: ${apellido2}</strong> <span id="rolEmpleado"></span></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-row d-flex">
                                <p><strong>Edad:</strong> <span id="edadEmpleado"></span></p>
                            </div>
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
                        <p><a href="#" class="btn btn-primary mb-2">Cambiar contraseña</a></p>
                        <p><a href="#" class="btn btn-primary">Cambiar correo</a></p>
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
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card mb-3">
                        <a href="RegistrarUsuario.jsp" class="funcion">
                            <div class="card-body">
                                <h4 class="card-title">Registrar Cliente</h4>
                                <p class="card-text"></p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card mb-3">
                        <a href="#" class="funcion">
                            <div class="card-body">
                                <h4 class="card-title">Consultar Cliente</h4>
                                <p class="card-text"></p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-2">
                    <a href="InicioSesion.jsp" id="cerrarSesion" class="btn btn-block">Cerrar sesión</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>