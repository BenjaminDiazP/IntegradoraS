<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Empleado</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">
</head>

<body>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de Empleados</h2>
            <nav>
                <a href="" class="nav_link">Regresar</a>
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
                                <option value="Taller mecánico">Taller mecánico</option>
                                <option value="Recepción">Recepción</option>
                                <option value="Caja">Caja</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label >ID de Empleado</label>
                            <input type="text" class="form-control" name="idEmpleado" readonly>
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
                    <form action="" method="get">
                        <label for="search">Consulta:</label>
                        <input type="search" id="search" name="q" />
                        <button class="btn btn-primary" type="submit">Buscar</button>
                    </form>

                    <div id="results">
                        <!-- Aquí se supone que deben salir los resultados
                                pinche berraco-->
                    </div>
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
                                            <a href="ModificarEmpleado.html" class="menu-button">Modificar</a>
                                            <button class="menu-button">Eliminar</button>
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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>