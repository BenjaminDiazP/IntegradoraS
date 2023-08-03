<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Cliente</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">

</head>

<body>
<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de Cliente</h2>
            <nav>
                <a href="Gerente.jsp" class="nav_link">Regresar</a>
            </nav>
        </div>
        <div class="card-body">
            <div class="row">
                <form id="registroForm">
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
                            <label for="curp">CURP</label>
                            <input type="text" class="form-control" id="curp" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="rfc">RFC</label>
                            <input type="text" class="form-control" id="rfc" required>
                        </div>
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
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="fechaNacimiento">Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="fechaNacimiento" required>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="direccion">Dirección</label>
                            <input type="text" class="form-control" id="direccion" required>
                        </div>
                        <div class="form-group col-md-3">
                            <center><label for="imagen">Imagen</label></center>
                            <input type="file" class="form-control" id="imagen" required accept="image/*">
                        </div>
                    </div>
                    <div class="footer">
                        <div class="col-12 d-flex justify-content-center">
                            <div class="mr-3">
                                <input type="submit" value="Agregar usuario" class="btn btn-primary">
                            </div>
                            <div class="custom-div">
                                <a href="RegistrarAuto.jsp" type="submit" class="btn btn-primary">Siguiente</a>
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
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-1')">Opciones</button>
                                        <div class="menu-content" id="menu-1">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-5')">Modificar</button>
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
                                <td>Julian Barraza</td>
                                <td>M</td>
                                <td>Julian@example.com</td>
                                <td>7779876585</td>
                                <td>Calle Juan Aldama</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-2')">Opciones</button>
                                        <div class="menu-content" id="menu-2">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-5')">Modificar</button>
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
                                <td>Marisa Rodriguez</td>
                                <td>F</td>
                                <td>marisa@example.com</td>
                                <td>8889876543</td>
                                <td>Calle Juárez</td>
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-3')">Opciones</button>
                                        <div class="menu-content" id="menu-3">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-5')">Modificar</button>
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
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-4')">Opciones</button>
                                        <div class="menu-content" id="menu-4">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-5')">Modificar</button>
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
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-5')">Opciones</button>
                                        <div class="menu-content" id="menu-5">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-5')">Modificar</button>
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
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-6')">Opciones</button>
                                        <div class="menu-content" id="menu-6">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-5')">Modificar</button>
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
                                <td>
                                    <div class="menu-container">
                                        <button class="menu-button" onclick="toggleMenu('menu-7')">Opciones</button>
                                        <div class="menu-content" id="menu-7">
                                            <div class="boton-modal">
                                                <button class="menu-button" onclick="abrirModal('modal-5')">Modificar</button>
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
                                <label>Seguro que quieres eliminar el usuario: Juanito?</label>
                            </div>
                            <br>
                            <div class="footer">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="mr-3">
                                        <input type="submit" value="Eliminar usuario" class="btn btn-primary">
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

<div class="container-modal" id="modal-5">
    <div class="content-modal">

        <div class="container my-3">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    Modificar Usuario
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
                                    <center><label for="imagen">Imagen</label></center>
                                    <input type="file" class="form-control" id="imagen" required accept="image/*">
                                </div>
                            </div>
                            <div class="footer">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="mr-3">
                                        <input type="submit" value="Modificar usuario" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="btn-cerrar">
                            <button class="btn btn-primary" onclick="cerrarModal('modal-5')">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>