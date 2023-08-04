<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Empleado</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">
</head>

<body >

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de Empleados</h2>
            <nav>
                <a href="#" class="nav_link">Regresar</a>
            </nav>
        </div>
        <div class="card-body">
            <div class="row">
                <form id="registroForm" method="post" action="RegistroServlet" >
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label >Nombre</label>
                            <input type="text" class="form-control" name="nombre" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Apellido Paterno</label>
                            <input type="text" class="form-control" name="apellidoPaterno" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label >Apellido Materno</label>
                            <input type="text" class="form-control" name="apellidoMaterno" required>
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
                                <option value="">Selecciona</option>
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
                        <div class="form-group col-md-3">
                            <label >Rol</label>
                            <select class="form-control" name="rol" required>
                                <option value="">Seleccionar Rol</option>
                                <option value="Taller mecanico">Taller mecánico</option>
                                <option value="Recepcion">Recepción</option>
                                <option value="Caja">Caja</option>
                            </select>
                        </div>
                    </div>
                    <div class="footer">
                        <div class="col-12 d-flex justify-content-center">
                            <input type="submit" value="Agregar Empleado" class="btn btn-primary">
                            <input type="hidden" value="Agregar Empleado" name="Registrar" class="btn btn-primary">
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
                    <h2 class="catalog-title">Empleados</h2>
                    <div class="catalog-slider">
                        <table class="catalog-table" id="serviciosTable">
                            <thead>
                            <tr>
                                <th>ID Empleado</th>
                                <th>Nombre de Empleado</th>
                                <th>Sexo</th>
                                <th>Correo Electronico</th>
                                <th>Número de Telefono</th>
                                <th>Direccion</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="empleado" items="${listaEmpleado}" varStatus="status">
                                <tr>
                                    <td>${empleado.identificador}</td>
                                    <td>${empleado.nombre}</td>
                                    <td>${empleado.sexo}</td>
                                    <td>${empleado.correo}</td>
                                    <td>${empleado.noTelefono}</td>
                                    <td>${empleado.direccion}</td>
                                    <td>${empleado.rol}</td>
                                    <td>
                                        <div class="menu-container">
                                            <button class="menu-button" onclick="toggleMenu('menu-${status.index}')">Opciones</button>
                                            <div class="menu-content" id="menu-${status.index}">
                                                <div class="boton-modal">
                                                    <!-- Establecemos el ID del botón "Modificar" para abrir el modal correspondiente -->
                                                    <button class="menu-button" onclick="abrirModal('modal-${empleado.id_usuario}')">Modificar</button>
                                                </div>
                                                <input type="checkbox" id="btn-modal">
                                                <button class="menu-button">Eliminar</button>
                                                <input id="boton-modal-eliminar" type="checkbox">
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

<div class="container-modal-eliminar" id="modal-2">
    <div class="content-modal">
        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between"></div>
                <div class="card-body">
                    <div class="row">
                        <form id="eliminarForm">
                            <div class="form-row d-flex justify-content-center">
                                <label>Seguro que quieres eliminar el empleado: Pancho ?</label>
                            </div>
                            <br>
                            <div class="footer">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="mr-3">
                                        <input type="submit" value="Eliminar Empleado" class="btn btn-primary">
                                    </div>
                                </div>
                                <br>
                            </div>
                        </form>
                        <div class="btn-cerrar">
                            <button class="btn btn-primary" onclick="cerrarModal('modal-2')">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modales -->
<c:forEach var="emp" items="${listaEmpleado}" varStatus="status">
    <div class="container-modal" id="modal-${emp.id_usuario}">
        <div class="content-modal">

            <div class="container my-3">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        Modificar Empleado
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <form id="modificarForm" action="RegistroServlet" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label>Nombre</label>
                                        <input type="text" class="form-control" name="nombre" required value="${emp.nombre}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label >Apellido Paterno</label>
                                        <input type="text" class="form-control" name="apellidoPaterno" required value="${emp.nombre}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label >Apellido Materno</label>
                                        <input type="text" class="form-control" name="apellidoMaterno" value="${emp.nombre}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label >Dirección</label>
                                        <input type="text" class="form-control" name="direccion" required value="${emp.nombre}">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label >Sexo</label>
                                        <select class="form-control" name="sexo" required value="${emp.nombre}">
                                            <option value="M">M</option>
                                            <option value="F">F</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label >Número Telefónico</label>
                                        <input type="text" class="form-control" name="telefono" required value="${emp.nombre}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label >Correo Electrónico</label>
                                        <input type="email" class="form-control" name="correo" required value="${emp.nombre}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label >Rol</label>
                                        <select class="form-control" name="rol" required value="${emp.nombre}">
                                            <option value="Taller mecanico">Taller mecanico</option >
                                            <option value="Recepcion">Recepcion</option>
                                            <option value="Caja">Caja</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="footer">
                                    <div class="col-12 d-flex justify-content-center">
                                        <input type="submit" value="Modificar empleado" class="btn btn-primary">
                                    </div>
                                </div>
                            </form>
                            <div class="btn-cerrar">
                                <button class="btn btn-primary" onclick="cerrarModal('modal-${emp.id_usuario}')">Cerrar</button>
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



<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>