<%--
  Created by IntelliJ IDEA.
  User: carlo
  Date: 13/08/2023
  Time: 04:09 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrar Paquete</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#agregarPaqueteBtn').on('click', function(e) {
        e.preventDefault();
        console.log('Botón Agregar Paquete clickeado.');

        const nombre = $('#nombreP').val(); // Obtener el valor del campo de nombre
        const categoria = $('#categoria').val(); // Obtener el valor del campo de categoría

        // Verificar si los campos obligatorios están llenos
        if (nombre && categoria) {
          const data = $('#totalForm').serialize();

          // Obtener los elementos seleccionados
          const elementosSeleccionados = $('input[name^="articulo_"]:checked')
                  .map(function() {
                    return this.value;
                  })
                  .get();

          // Verificar si al menos un artículo o servicio está seleccionado
          if (elementosSeleccionados.length > 0) {
            $.ajax({
              type: 'POST',
              url: 'RegistroPaquetesServlet',
              data: data,
              dataType: "json",
              success: function(response) {
                console.log(response);

                if (typeof response === 'object') {
                  // Utiliza directamente las propiedades del objeto JSON
                  const nombre = response.nombre;
                  const precio = response.precio;
                  const categoria = response.categoria;
                  const elementos = response.elementos;

                  const $row = $('<tr>'); // Crear una nueva fila

                  // Agregar celdas a la fila
                  $row.append($('<td>').text(nombre));
                  $row.append($('<td>').text(precio));
                  $row.append($('<td>').text(categoria));
                  $row.append($('<td>').text(elementos.join(', ')));

                  // Agregar la fila a la tabla
                  $('#consultaPaquetes tbody').append($row);

                  // Borrar los datos del formulario
                  $('#nombreP').val('');
                  $('#categoria').val('');

                  // Desmarcar elementos seleccionados
                  $('input[name^="articulo_"]').prop('checked', false);

                  // Mostrar alerta de éxito
                  $('#alertaExito').fadeIn().delay(2000).fadeOut();
                } else {
                  console.log("La respuesta no es un objeto JSON válido.");
                }
              },
              error: function() {
                alert('Ha ocurrido un error al procesar la solicitud.');
              }
            });
          } else {
            // Mostrar alerta de que se debe seleccionar al menos un artículo o servicio
            $('#alertaSeleccion').fadeIn().delay(2000).fadeOut();
          }
        } else {
          // Mostrar alerta de campos incompletos
          $('#alertaCampos').fadeIn().delay(2000).fadeOut();
        }
      });
    });
  </script>
</head>

<body>
<div id="alertaExito" class="alert alert-success" style="display: none;">
  ¡Paquete registrado con éxito!
</div>
<div id="alertaCampos" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
  Por favor, completa todos los campos obligatorios.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<div id="alertaSeleccion" class="alert alert-warning alert-dismissible fade show" role="alert" style="display: none;">
  Debes seleccionar al menos un artículo o servicio.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">

      <h2>Catálogo de paquetes</h2>
      <nav>
        <a href="Gerente.jsp" class="nav_link">Regresar</a>
      </nav>
    </div>

    <div class="card-body">
      <form id="totalForm" action="#" method="post">
        <div class="d-flex justify-content-center">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="nombreP">Nombre</label>
              <input type="text" class="form-control" id="nombreP" name="nombreP" required>
            </div>
            <div class="form-group col-md-4">
              <label for="precioP">Precio</label>
              <input type="number" class="form-control" id="precioP" name="precioP" required>
            </div>
            <div class="form-group col-md-4">
              <label for="categoria">Categoria</label>
              <select class="form-control" id="categoria" name="categoria" required>
                <option value="" selected disabled>Elige una opción</option>
                <option value="bronce">Categoria Bronce</option>
                <option value="plata">Categoria Plata</option>
                <option value="oro">Categoria Oro</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <h2 class="catalog-title">Productos</h2>
            <div class="catalog-slider">
              <table class="catalog-table" id="productosTabla">
                <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Precio</th>
                  <th>Agregar</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="articuloP" items="${listaProductos}" varStatus="status">
                  <tr>
                    <td>${articuloP.nombre}</td>
                    <td>${articuloP.costo}</td>
                    <td><input type= "checkbox" name="articulo_${articuloP.id_producto}" value="${articuloP.nombre}"></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div class="col-md-6">
            <h2 class="catalog-title">Servicios</h2>
            <div class="catalog-slider">
              <table class="catalog-table" id="serviciosTabla">
                <thead>
                <tr>
                  <th>Nombre </th>
                  <th>Precio</th>
                  <th>Agregar</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="articuloS" items="${listaServicios}" varStatus="status">
                  <tr>
                    <td>${articuloS.nombre}</td>
                    <td>${articuloS.costo}</td>
                    <td><input type="checkbox" name="articulo_${articuloS.id_producto}" value="${articuloS.nombre}"></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            <br>
          </div>
        </div>
        <div class="col-12 d-flex justify-content-center">
          <input type="submit" id="agregarPaqueteBtn" value="Agregar Paquete" name="accion" class="btn btn-primary">
          <input type="hidden" value="Agregar Paquete" name="accion" class="btn btn-primary">
        </div>
      </form>
    </div>

  </div>
</div>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Paquetes</h2>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-8 mx-auto">
          <div class="catalog-container">
            <h2 class="catalog-title">Nuevo paquete</h2>
            <div class="catalog-slider">
              <form id="inventarioForm">
                <table class="catalog-table" id="consultaPaquetes">
                  <thead>
                  <tr>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Categoria</th>
                    <th>Servicios y productos</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="paquete" items="${paquetes}" varStatus="status">
                    <tr>
                      <td>${paquete.nombre}</td>
                      <td>${paquete.precio}</td>
                      <td>${paquete.categoria}</td>
                      <td>
                        <ul>
                          <c:forEach var="elemento" items="${paquete.elementos}" varStatus="status">
                            <li>${elemento}</li>
                          </c:forEach>
                        </ul>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>