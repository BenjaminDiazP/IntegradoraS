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

<body>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de Empleados</h2>
            <nav>
                <a href="Gerente.jsp" class="nav_link">Regresar</a>
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
                        <div class="form-group col-md-3">
                            <label >Rol</label>
                            <select class="form-control" name="rol" required>
                                <option value="Taller mecanico">Taller mecanico</option>
                                <option value="Recepcion">Recepcion</option>
                                <option value="Caja">Caja</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <center><label for="imagen">Imagen</label></center>
                            <input type="file" class="form-control" id="imagen" required accept="image/*">
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
                                <th>No</th>
                                <th>Nombre</th>
                                <th>Sexo</th>
                                <th>Correo Electronico</th>
                                <th>Número de Telefono</th>
                                <th>Direccion</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Juanito Perez</td>
                                <td>M</td>
                                <td>juanito@example.com</td>
                                <td>7776865476</td>
                                <td>Calle Reforma</td>
                                <td>Gerente</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-1')">Opciones</button>
                                        <div class="menu-content" id="menu-1">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-4')">Modificar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal">
                                            <div class="boton-modal-eliminar">
                                                <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal-eliminar">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Panchito Barraza</td>
                                <td>M</td>
                                <td>panchito@example.com</td>
                                <td>7779876585</td>
                                <td>Calle Juan Aldama</td>
                                <td>Recepcionista</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-2')">Opciones</button>
                                        <div class="menu-content" id="menu-2">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-4')">Modificar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal">
                                            <div class="boton-modal-eliminar">
                                                <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal-eliminar">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>María Rodriguez</td>
                                <td>F</td>
                                <td>maria@example.com</td>
                                <td>8889876543</td>
                                <td>Calle Juárez</td>
                                <td>Recepcionista</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-3')">Opciones</button>
                                        <div class="menu-content" id="menu-3">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-4')">Modificar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal">
                                            <div class="boton-modal-eliminar">
                                                <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal-eliminar">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Luis Gómez</td>
                                <td>M</td>
                                <td>luis@example.com</td>
                                <td>5557891234</td>
                                <td>Avenida Indep</td>
                                <td>Caja</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-4')">Opciones</button>
                                        <div class="menu-content" id="menu-4">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-4')">Modificar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal">
                                            <div class="boton-modal-eliminar">
                                                <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal-eliminar">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Pedro Gutiérrez</td>
                                <td>M</td>
                                <td>pedro@example.com</td>
                                <td>3334445556</td>
                                <td>Calle Progreso</td>
                                <td>Mecánico</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-5')">Opciones</button>
                                        <div class="menu-content" id="menu-5">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-4')">Modificar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal">
                                            <div class="boton-modal-eliminar">
                                                <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal-eliminar">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Carolina Méndez</td>
                                <td>F</td>
                                <td>carolina@example.com</td>
                                <td>2223334445</td>
                                <td>Calle del Bosque</td>
                                <td>Mecánico</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-6')">Opciones</button>
                                        <div class="menu-content" id="menu-6">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-4')">Modificar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal">
                                            <div class="boton-modal-eliminar">
                                                <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal-eliminar">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Ricardo López</td>
                                <td>M</td>
                                <td>ricardo@example.com</td>
                                <td>7778889990</td>
                                <td>Calle de la Luna</td>
                                <td>Mecánico</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-7')">Opciones</button>
                                        <div class="menu-content" id="menu-7">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-4')">Modificar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal">
                                            <div class="boton-modal-eliminar">
                                                <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                                            </div>
                                            <input type="checkbox" id="btn-modal-eliminar">
                                        </div>
                                    </div>
                            </tr>
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

<div class="container-modal" id="modal-4">
    <div class="content-modal">

        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    Modificar Empleado
                </div>
                <div class="card-body">
                    <div class="row">
                        <form id="modificarForm">
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="apellidoPaterno">Apellido Paterno</label>
                                    <input type="text" class="form-control" id="apellidoPaterno" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="apellidoMaterno">Apellido Materno</label>
                                    <input type="text" class="form-control" id="apellidoMaterno">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="direccion">Dirección</label>
                                    <input type="text" class="form-control" id="direccion" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="sexo">Sexo</label>
                                    <select class="form-control" id="sexo" required>
                                        <option value="Masculino">M</option>
                                        <option value="Femenino">F</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="telefono">Número Telefónico</label>
                                    <input type="text" class="form-control" id="telefono" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="correo">Correo Electrónico</label>
                                    <input type="email" class="form-control" id="correo" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="rol">Rol</label>
                                    <select class="form-control" id="rol" required>
                                        <option value="Taller mecanico">Taller mecanico</option>
                                        <option value="Recepcion">Recepcion</option>
                                        <option value="Caja">Caja</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <center><label for="imagenM">Imagen</label></center>
                                    <input type="file" class="form-control" id="imagenM" required accept="image/*">
                                </div>
                            </div>
                            <div class="footer">
                                <div class="col-12 d-flex justify-content-center">
                                    <input type="submit" value="Modificar empleado" class="btn btn-primary">
                                </div>
                            </div>
                        </form>
                        <div class="btn-cerrar">
                            <button class="btn btn-primary" onclick="cerrarModal('modal-4')">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<c:if test="${not empty mensajeError}">
    <script>
        swal({
            title: "Error de registro!",
            text: "Hubo un error al insertar el cliente en la base de datos.",
            icon: "error",

        });
    </script>

</c:if>
<c:if test="${not empty mensajeExito}">
    <script>
        swal({
            title: "Registro Existoso!",
            text: "Se ha registrado un Empleado correctamente.",
            icon: "success",

        });
    </script>

</c:if>




<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>