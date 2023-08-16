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
              <tr>
                <td>Juanito Perez</td>
                <td>Pablo Rivera</td>
                <td>Toyota Corolla</td>
                <td>Mantenimiento Completo</td>
                <td>Paquete Gold</td>
                <td>2023-08-10</td>
                <td>Si</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
              </tr>
              <tr>
                <td>Maria Rodriguez</td>
                <td>Luis Martinez</td>
                <td>Ford Mustang</td>
                <td>Revisión Básica</td>
                <td>Paquete Silver</td>
                <td>2023-08-11</td>
                <td>No</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
                </td>
              </tr>
              <tr>
                <td>Pedro Sanchez</td>
                <td>Ana Garcia</td>
                <td>Chevrolet Cruze</td>
                <td>Cambio de Aceite</td>
                <td>Paquete Bronce</td>
                <td>2023-08-12</td>
                <td>No</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
                </td>
              </tr>
              <tr>
                <td>Laura Gomez</td>
                <td>Ana Garcia</td>
                <td>Nissan Sentra</td>
                <td>Reparación Completa</td>
                <td>Paquete Platinum</td>
                <td>2023-08-09</td>
                <td>Si</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
                </td>
              </tr>
              <tr>
                <td>Sofia Morales</td>
                <td>Pablo Rivera</td>
                <td>Hyundai Elantra</td>
                <td>Revisión Básica</td>
                <td>Paquete Silver</td>
                <td>2023-08-07</td>
                <td>Si</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
                </td>
              </tr>
              <tr>
                <td>Miguel Torres</td>
                <td>Pablo Rivera</td>
                <td>Toyota Camry</td>
                <td>Cambio de Aceite</td>
                <td>Paquete Bronze</td>
                <td>2023-08-06</td>
                <td>No</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
                </td>
              </tr>
              <tr>
                <td>Ana Fernandez</td>
                <td>Luis Ramirez</td>
                <td>Ford Focus</td>
                <td>Revisión Completa</td>
                <td>Paquete Gold</td>
                <td>2023-08-05</td>
                <td>Si</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
                </td>
              </tr>
              <tr>
                <td>Jorge Fernandez</td>
                <td>Ana Garcia</td>
                <td>Honda Civic</td>
                <td>Cambio de Frenos</td>
                <td>Paquete Gold</td>
                <td>2023-08-08</td>
                <td>Si</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
                </td>
              </tr>
              <tr>
                <td>Maria Rodriguez</td>
                <td>Luis Martinez</td>
                <td>Ford Mustang</td>
                <td>Revisión Básica</td>
                <td>Paquete Silver</td>
                <td>2023-08-11</td>
                <td>No</td>
                <td>
                  <div class="boton-modal">
                    <button class="menu-button" onclick="abrirModal('modal-1')">Productos
                      extra</button>
                  </div>
                  <input type="checkbox" id="btn-modal">
                </td>
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


<div class="container-modal" id="modal-1">
  <div class="content-modal">
    <div class="container my-3">
      <div class="card">
        <div class="card-header d-flex justify-content-between"></div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center">
              <img src="img/Logo.png" alt="Imagen" style="max-width: 100%;" class="small-image">
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
                      <tr>
                        <td>Aceite de motor</td>
                        <td>$12.99</td>
                      </tr>
                      </tbody>
                    </table>
                  </div>
                </div>


              </div>
            </div>

            <div class="btn-cerrar">
              <button class="btn btn-primary" onclick="cerrarModal('modal-1')">Cerrar</button>
            </div>
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