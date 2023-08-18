
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mantenimientos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssConsulaMantenimiento/cssConsulta.css" type="text/css">
</head>

<body>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Mantenimientos</h2>
            <nav>
                <a href="Mecanico.jsp" class="nav_link">Regresar</a>
            </nav>
        </div>
        <c:forEach var="registro" items="${registrosDeMantenimiento}" varStatus="status">

            <c:if test="${registro.proceso < 100}">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="assets/img/imagesPaginaPrincipal/rines.jpg" alt="Descripción de la imagen" class="img-fluid">
                        </div>
                        <div class="col-md-8">
                            <form id="registroForm" action="ConsultaMantenimientoServlet" method="get">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="nombreCliente">Nombre del cliente</label>
                                        <input type="text" class="form-control" id="nombreCliente" value="${registro.nombreCliente}" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="placasVehiculo">Numero de Serie</label>
                                        <input type="text" class="form-control" id="placasVehiculo" value="${registro.noSerie}" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="categoria">Categoria</label>
                                        <input type="text" class="form-control" id="categoria" value="${registro.categoria}" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="paquete">Paquete</label>
                                        <input type="text" class="form-control" id="paquete" value="${registro.nombrePaquete}" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inicioMantenimiento">Registro de Mantenimiento</label>
                                        <input type="date" class="form-control" id="inicioMantenimiento" value="${registro.fechaInicio}" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="descripcion">Descripción</label>
                                        <input type="text" class="form-control" id="descripcion" value="${registro.descripcion}" disabled>
                                    </div>
                                    <input type="hidden" class="form-control" name="id_mantenimiento" value="${registro.id_mantenimiento}" >
                                </div>
                                <br>
                                <br>
                                <button type="submit" name="tipo" value="listar" class="btn btn-primary" style="margin-left: 90px;">Agregar productos extra</button>
                            </form>
                        </div>
                    </div>
                </div>
                <hr class="style-hr">
            </c:if>
</c:forEach>
        <c:if test="${empty registrosDeMantenimiento || todosProcesosCompletos}">
            <div class="message-box">
                <h1>No hay mantenimientos pendientes</h1>
                <p>Todos los procesos han sido completados.</p>
            </div>
        </c:if>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>

