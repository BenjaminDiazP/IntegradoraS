<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Historial de compras</title>
  <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/css-HistorialesProductos/styleProductos%20(3).css" type="text/css">

</head>

<body>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Historial de Compras</h2>
      <nav>
        <a href="Cliente.jsp" class="nav_link">Regresar</a>
      </nav>
    </div>
    <div class="card-body">
      <div class="row">

        <div class="catalog-container">
          <form id="searchForm">
            <div class="search-container">
              <input type="search" id="search" name="q" placeholder="Buscar" />
              <button class="btn btn-primary" type="submit">Buscar</button>
              <button type="button" id="clearSearch" class="btn btn-danger">X</button>
            </div>
          </form>
          <h2 class="catalog-title">Compras Productos</h2>
          <div class="catalog-slider">
            <table class="catalog-table" id="serviciosTable">
              <thead>
              <tr>
                <th>Cliente</th>
                <th>Correo</th>
                <th>Fecha de compra</th>
                <th>Productos</th>
                <th>Precio total</th>
                <th>Opciones</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>John Doe</td>
                <td>john.doe@example.com</td>
                <td>2023-08-13</td>
                <td>3</td>
                <td>$75.00</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button"> Generar Ticket</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td>John Doe</td>
                <td>john.doe@example.com</td>
                <td>2023-08-13</td>
                <td>3</td>
                <td>$75.00</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button"> Generar Ticket</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td>John Doe</td>
                <td>john.doe@example.com</td>
                <td>2023-08-13</td>
                <td>3</td>
                <td>$75.00</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button"> Generar Ticket</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td>John Doe</td>
                <td>john.doe@example.com</td>
                <td>2023-08-13</td>
                <td>3</td>
                <td>$75.00</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button"> Generar Ticket</button>
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
<script src="assets/js/jsHistorialProductos/scriptHistoriales.js"></script>
</body>

</html>
