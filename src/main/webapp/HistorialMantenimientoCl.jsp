<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Historial de Mantenimientos</title>
  <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/css-HistorialesProductos/styleProductos%20(3).css" type="text/css">

</head>
<style>
.container-modal-ticket {
                      width: 600px;
                      height: 300px;
                      position: fixed;
                      top: 25%;
                      left: 50%;
                      transform: translate(-50%, -50%);
                      display: none;
                      justify-content: center;
                      align-items: center;
                      z-index: 100;
}

  .ticket-style {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
    max-width: 500px;
    margin: 0 auto;
  }

  .ticket-message {
    font-size: 18px;
    font-weight: bold;
  }

  .btn-cerraar {
    text-align: center;
    margin-top: 15px;
  }

  .btn-secondaryy {
    background-color: #6c757d;
    border: none;
  }

  .btn-secondaryy:hover {
    background-color: #545b62;
  }

  .item-list {
    list-style: none;
    padding: 0;
  }

  .item-list li {
    display: flex;
    justify-content: space-between;
    margin-bottom: 5px;
  }

  .item-price {
    font-weight: bold;
  }

  .special-item {
    position: relative;
    display: flex;
    align-items: center;
  }

  .special-item::after {
    content: '';
    display: block;
    width: 100%;
    height: 2px;
    background-color: black;
    position: absolute;
    bottom: 0;
    left: 0;
  }

  hr.special-hr {
    height: 3px;
    background-color: rgb(0, 0, 0);
  }

  .ticket-total {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .list-header {
    display: grid;
    grid-template-columns: max-content auto auto;
    column-gap: 10px;
    align-items: center;
  }

  .item-price {
    margin-left: 20px;
  }

  .list-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
  }

  .left-column,
  .middle-column,
  .right-column {
    list-style-type: none;
    padding: 0;
    margin: 0;
  }


  .item-category {
    margin-left: 20px;
  }

  .container-modal-ticket {
    position: fixed;
    top: 478px;
    padding: 10%;
    width: 100%;
    height: 100%;
    justify-content: center;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    overflow: hidden;
  }

</style>
<body>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Historial de Mantenimientos</h2>
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
          <h2 class="catalog-title">Mantenimientos</h2>
          <div class="catalog-slider">
            <table class="catalog-table" id="serviciosTable">
              <thead>
              <tr>
                <th>Cliente</th>
                <th>Mecanico</th>
                <th>Vehiculo</th>
                <th>Categoria de paquete</th>
                <th>Paquete</th>
                <th>Inicio de mantenimiento</th>
                <th>Opciones</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach varStatus="status" var="man" items="${MostrarMantenimientosCliente}">
                <c:if test="${man.proceso > 75 }">
                  <tr>
                  <td>${man.nombreCliente}</td>
                  <td>${man.apellido1}${man.apellido2}</td>
                  <td>${man.marca}</td>
                  <td>${man.categoria}</td>
                  <td>${man.nombrePaquete}</td>
                  <td>${man.fechaInicio}</td>
                    <td>
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-2${man.id_mantenimiento}')">Ver
                          ticket</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                    </td>
                </c:if>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<c:forEach varStatus="status" var="man" items="${MostrarMantenimientosCliente}">
  <div class="container-modal-ticket" id="modal-2${man.id_mantenimiento}" style="overflow-y: scroll;">
    <div class="content-modal ticket-style">
      <div class="ticket-header">
        <br>
        <h5 style="margin-left: 25px;">Sistema Gestor de Mantenimiento Automotriz</h5>
        <span style="font-size: 14px;">
          <strong>Cliente:</strong> ${man.nombreCliente} <br>
          <strong>Vehículo con matrícula:</strong> ${man.noSerie}<br>
          <strong>Paquete:</strong> ${man.nombrePaquete}<br>
          <strong>Fecha Inicio:</strong> ${man.fechaInicio}<br>
          <strong>Marca:</strong> ${man.marca}<br>
          <strong>Descripcion:</strong> ${man.descripcion}
        </span>
      </div>
      <div class="modal-content-scrollable">
        <div class="ticket-details">
          <br>
          <ul class="item-list">
            <li id="special-li" class="special-item"><strong>Producto</strong> <span class="item-price">Precio</span></li>
            <c:forEach var="pro" items="${man.listaProductosExtra}" varStatus="status">
              <li>${pro.nombre}<span class="item-price">$${pro.precio}</span></li>
            </c:forEach>
          </ul>
          <hr class="special-hr">
          <strong>Total de productos extra: $<span class="item-price">
            <c:set var="totalPrice" value="0" />
            <c:forEach var="pro" items="${man.listaProductosExtra}">
              <c:set var="totalPrice" value="${totalPrice + pro.precio}" />
            </c:forEach>
            ${totalPrice}
            <br>
          </span>Precio paquete:$${man.costopaquete} </strong>
        </div>
        <div class="ticket-total">
          <br>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <strong>GRACIAS POR ELEGIRNOS!</strong>
            <img src="assets/img/imagesPaginaPrincipal/logo.png" style="width: 80px; height: 70px;">
          </div>
        </div>
        <div class="btn-cerraar">
          <button class="btn btn-secondaryy" onclick="cerrarModal('modal-2${man.id_mantenimiento}')">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</c:forEach>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsHistorialProductos/scriptHistoriales.js"></script>
</body>

</html>
