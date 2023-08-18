<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Cliente</title>
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">

</head>

<body>
<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de Cliente</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <form id="registroForm"  method="post" action="RegistroServlet" >
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label>Nombre</label>
                            <input type="text" class="form-control" name="nombre" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Apellido Paterno</label>
                            <input type="text" class="form-control" name="apellidoPaterno" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Apellido Materno</label>
                            <input type="text" class="form-control" name="apellidoMaterno">
                        </div>
                        <div class="form-group col-md-3">
                            <label >CURP</label>
                            <input type="text" class="form-control" name="curp" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label >RFC</label>
                            <input type="text" class="form-control" name="rfc" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Sexo</label>
                            <select class="form-control" name="sexo" required>
                                <option value="M">M</option>
                                <option value="F">F</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Número Telefónico</label>
                            <input type="text" class="form-control" name="telefono" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Correo Electrónico</label>
                            <input type="email" class="form-control" name="correo" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label >Fecha de Nacimiento</label>
                            <input type="date" class="form-control" name="fechaNacimiento" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Dirección</label>
                            <input type="text" class="form-control" name="direccion" required>
                        </div>
                    </div>
                    <div class="footer">
                        <div class="col-12 d-flex justify-content-center">
                            <div class="mr-3">
                                <input type="submit" value="Agregar usuario" class="btn btn-primary">
                                <input type="hidden" value="Agregar usuario" name="Registrar" class="btn btn-primary">
                            </div>
                            <div class="custom-div">
                                <a href="RegistroVehiculoServlet?tipo=Vehiculo" class="btn btn-primary">Siguiente</a>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Datos</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="catalog-container">
                    <form id="searchForm" action="" method="get">
                        <div class="search-container">
                            <input type="search" id="search" name="q" placeholder="Buscar" />
                            <button class="btn btn-primary" type="submit">Buscar</button>
                            <button type="button" id="clearSearch" class="btn btn-danger">X</button>
                        </div>
                    </form>
                    <h2 class="catalog-title">Clientes</h2>
                    <div class="catalog-slider">
                        <table class="catalog-table" id="serviciosTable">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th>Nombre</th>
                                <th>Sexo</th>
                                <th>Correo Electronico</th>
                                <th>Número de Telefono</th>
                                <th>Direccion</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="Cliente" items="${listaCliente}" varStatus="status">
                                <tr>
                                    <td>${Cliente.identificador}</td>
                                    <td>${Cliente.nombre}</td>
                                    <td>${Cliente.sexo}</td>
                                    <td>${Cliente.correo}</td>
                                    <td>${Cliente.noTelefono}</td>
                                    <td>${Cliente.direccion}</td>
                                    <td><c:choose>
                                        <c:when test="${Cliente.estado == 1}">
                                            Disponible
                                        </c:when>
                                        <c:otherwise>
                                            No Disponible
                                        </c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td>
                                        <div class="menu-container">
                                            <button class="menu-button" onclick="toggleMenu('menu-${status.index}')">Opciones</button>
                                            <div class="menu-content" id="menu-${status.index}">
                                                <div class="boton-modal">
                                                    <!-- Establecemos el ID del botón "Modificar" para abrir el modal correspondiente -->
                                                    <button class="menu-button" onclick="abrirModal('modal-${Cliente.id_usuario}')">Modificar</button>
                                                </div>
                                                <div class="boton-modal-eliminar">
                                                    <button class="menu-button" onclick="abrirModal('modal-2${Cliente.id_usuario}')">Estado</button>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:forEach var="Cliente1" items="${listaCliente}" varStatus="status">
<div class="container-modal-eliminar" id="modal-2${Cliente1.id_usuario}">
    <div class="content-modal">

        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between"></div>
                <div class="card-body">
                    <div class="row">
                        <form id="eliminarForm" method="post" action="RegistroServlet" >
                            <div class="form-row d-flex justify-content-center">
                                <label>Seguro que quieres cambiar el estaso de: ${Cliente1.nombre}?</label>
                            </div>
                            <div class="form-group col-md-3">
                                <label></label>
                                <input type="hidden" class="form-control" name="rfc" required value="${Cliente1.rfc}">
                            </div>
                            <br>
                            <div class="footer">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="mr-3">
                                        <input type="submit" value="Cambiar Estado" class="btn btn-primary">
                                        <input type="hidden" value="Estado cliente" name="Registrar" class="btn btn-primary">
                                    </div>
                                </div>
                                <br>
                            </div>
                        </form>
                        <div class="btn-cerrar">
                            <button class="btn btn-primary" onclick="cerrarModal('modal-2${Cliente1.id_usuario}')">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</c:forEach>

<c:forEach var="Cliente2" items="${listaCliente}" varStatus="status">
<div class="container-modal" id="modal-${Cliente2.id_usuario}">
    <div class="content-modal">

        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    Modificar Usuario
                </div>
                <div class="card-body">
                    <div class="row">
                        <form id="modificarForm" method="post" action="RegistroServlet" >
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label >Nombre</label>
                                    <input type="text" class="form-control" name="nombre" required value="${Cliente2.nombre}">
                                </div>
                                <div class="form-group col-md-3">
                                    <label >Apellido Paterno</label>
                                    <input type="text" class="form-control" name="apellidoPaterno" required value="${Cliente2.apellido1}">
                                </div>
                                <div class="form-group col-md-3">
                                    <label >Apellido Materno</label>
                                    <input type="text" class="form-control" name="apellidoMaterno" value="${Cliente2.apellido2}">
                                </div>
                                <div class="form-group col-md-3">
                                    <label >Dirección</label>
                                    <input type="text" class="form-control" name="direccion" required value="${Cliente2.direccion}">
                                </div>
                                <div class="form-group col-md-3">
                                    <label></label>
                                    <input type="hidden" class="form-control" name="rfc" required value="${Cliente2.rfc}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label >Sexo</label>
                                    <select class="form-control" name="sexo" required value="${Cliente2.sexo}">
                                        <option value="M">M</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label >Número Telefónico</label>
                                    <input type="text" class="form-control" name="telefono" required value="${Cliente2.noTelefono}">
                                </div>
                                <div class="form-group col-md-3">
                                    <label >Correo Electrónico</label>
                                    <input type="email" class="form-control" name="correo" required value="${Cliente2.correo}">
                                </div>
                            </div>
                            <div class="footer">
                                <div class="col-12 d-flex justify-content-center">
                                    <input type="submit" value="Modificar cliente" class="btn btn-primary">
                                    <input type="hidden" value="Modificar cliente" name = "Registrar" class="btn btn-primary">
                                </div>
                            </div>
                        </form>
                        <div class="btn-cerrar">
                            <button class="btn btn-primary" onclick="cerrarModal('modal-${Cliente2.id_usuario}')">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</c:forEach>

<c:choose>
    <c:when test="${not empty mensajeError}">
        <script>
            swal({
                title: "Error de registro!",
                text: "Hubo un error al insertar el cliente en la base de datos.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeError" scope="session" />
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
                text: "Se ha registrado un cliente correctamente.",
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
    <c:when test="${not empty mensajeErrorUpdate}">
        <script>
            swal({
                title: "Error de registro!",
                text: "Hubo un error al modificar el Empleado en la base de datos.",
                icon: "error",
            });
            // Elimina el atributo de sesión después de mostrar el mensaje
            <c:remove var="mensajeErrorUpdate" scope="session" />
            // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
            setTimeout(function() {
                location.reload();
            }, 2000);
        </script>
    </c:when>
</c:choose>




<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>