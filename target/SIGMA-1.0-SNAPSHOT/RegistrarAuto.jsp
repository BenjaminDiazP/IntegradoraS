<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrar Vehiculo</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/StylePanelRegistro/stylePaneles.css" type="text/css">
</head>
<body>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Registro de Vehiculo</h2>
      <nav>
        <a href="" class="nav_link">Inicio</a>
      </nav>
    </div>
    <div class="card-body">
      <div class="row">
        <form id="registroForm">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="noSerie">Numero de serie</label>
              <input type="text" class="form-control" id="noSerie" required>
            </div>
            <div class="form-group col-md-4">
              <label for="marca">Marca</label>
              <input type="text" class="form-control" id="marca" required>
            </div>
            <div class="form-group col-md-4">
              <label for="modelo">Modelo</label>
              <input type="text" class="form-control" id="modelo" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="anio">Año</label>
              <input type="date" class="form-control" id="anio" required>
            </div>
            <div class="form-group col-md-4">
              <label for="color">Color</label>
              <input type="text" class="form-control" id="color" required>
            </div>
            <div class="form-group col-md-4">
              <label for="placas">Placas</label>
              <input type="text" class="form-control" id="placas" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="tipoCombustible">Tipo de Combustible</label>
              <input type="text" class="form-control" id="tipoCombustible" required>
            </div>
            <div class="form-group col-md-4">
              <label for="tipoTransmision">Tipo de Transmision</label>
              <input type="text" class="form-control" id="tipoTransmision" required>
            </div>
            <div class="form-group col-md-4">
              <label for="noMotor">Numero de motor</label>
              <input type="text" class="form-control" id="noMotor" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="tipo">Tipo de vehiculo</label>
              <input type="text" class="form-control" id="tipo" required>
            </div>
          </div>
          <div class="footer">
            <div class="col-12 d-flex justify-content-center">
              <input type="submit" value="Agregar vehiculo" class="btn btn-primary">
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>