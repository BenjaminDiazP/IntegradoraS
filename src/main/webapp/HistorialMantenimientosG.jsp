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

<body>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Historial de Mantenimientos</h2>
      <nav>
        <a href="Gerente.jsp" class="nav_link">Regresar</a>
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
                <th>Productos extra?</th>
                <th>Opciones</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach varStatus="status" var="man" items="${MostrarMantenimientoTodos}">
                <c:if test="${man.proceso > 75 }">
                  <tr>
                  <td>${man.nombreCliente}</td>
                  <td>${man.apellido1}${man.apellido2}</td>
                  <td>${man.marca}</td>
                  <td>${man.categoria}</td>
                  <td>${man.nombrePaquete}</td>
                  <td>${man.fechaInicio}</td>
                  <c:choose>
                    <c:when test="${man.extras != 0}">
                      <td>Si</td>
                      <td>
                        <div class="boton-modal">
                          <button class="menu-button" onclick="abrirModal('modal-${man.id_mantenimiento}')">Productos
                            extra</button>
                        </div>
                        <input type="checkbox" id="btn-modal">
                      </td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <td>No</td>
                      <td><div class="boton-modal">
                        <button disabled class="menu-button" onclick="abrirModal('')">Productos
                          extra</button>
                      </div>
                        <input type="checkbox" id="btn-modal"></td>
                    </c:otherwise>
                  </c:choose>
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

<c:forEach varStatus="status" var="man" items="${MostrarMantenimientoTodos}">
<div class="container-modal" id="modal-${man.id_mantenimiento}">
  <div class="content-modal">
    <div class="container my-3">
      <div class="card">
        <div class="card-header d-flex justify-content-between"></div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center">
              <img src="assets/img/imagesPaginaPrincipal/logo.png" alt="Imagen" style="max-width: 100%;" class="small-image">
            </div>
            <div class="col-md-8">
              <div class="row">
                <div class="catalog-container">
                  <h2 class="catalog-title">Productos extra</h2>
                  <div class="catalog-slider">
                    <table class="catalog-table" id="serviciosTable">
                      <thead>
                      <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="producto" items="${man.listaProductosExtra}">
                        <tr>
                          <td>${producto.nombre}</td>
                          <td>${producto.precio}</td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="btn-cerrar">
              <button class="btn btn-primary" onclick="cerrarModal('modal-${man.id_mantenimiento}')">Cerrar</button>
            </div>
          </div>
        </div>
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