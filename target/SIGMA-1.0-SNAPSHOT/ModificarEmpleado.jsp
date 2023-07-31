<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Empleado</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">

</head>

<body>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Modificar Empleado</h2>
            <nav>
                <a href="RegistrarEmpleado.html" class="nav_link">Regresar</a>
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
                            <input type="text" class="form-control" id="apellidoMaterno" required>
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
                                <option value="">Selecciona</option>
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
                                <option value="">Seleccionar Rol</option>
                                <option value="Taller mecánico">Taller mecánico</option>
                                <option value="Recepción">Recepción</option>
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
            </div>
        </div>
    </div>
</div>
</body>

</html>
