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
</head>

<body>
<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Catálogo de paquetes</h2>
      <nav>
        <a href="" class="nav_link">Regresar</a>
      </nav>
    </div>

    <div class="card-body">
      <form id="totalForm" action="RegistroArticulosServlet" method="post">
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
                  <th>Categoría</th>
                  <th>Agregar</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="articuloP" items="${listaProductos}" varStatus="status">
                  <tr>
                    <td>${articuloP.nombre}</td>
                    <td>${articuloP.categoria}</td>
                    <td><input type="checkbox" name="articulo_${articuloP.id_producto}" value="${articuloP.nombre}"></td>
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
                  <th>Categoria</th>
                  <th>Agregar</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="articuloS" items="${listaServicios}" varStatus="status">
                  <tr>
                    <td>${articuloS.nombre}</td>
                    <td>${articuloS.categoria}</td>
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
          <input type="submit" value="Agregar Paquete" name="accion" class="btn btn-primary">
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
                  <tr>

                  </tr>
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

<script>
  document.addEventListener('DOMContentLoaded', () => {
    const agregarArticulosBtn = document.getElementById('agregarArticulos');
    const consultaPaquetesTable = document.getElementById('consultaPaquetes');
    const infoForm = document.getElementById('infoForm');
    const productosTable = document.getElementById('productosTabla');
    const serviciosTable = document.getElementById('serviciosTabla');

    agregarArticulosBtn.addEventListener('click', () => {
      const nombre = infoForm.querySelector('#nombreP').value;
      const precio = infoForm.querySelector('#precio').value;
      const categoria = infoForm.querySelector('#Categoria').value;

      // Verificar si hay campos vacíos o no hay checkbox seleccionados
      if (!nombre || !precio || !categoria) {
        alert('Por favor, completa todos los campos.');
        return; // No se agrega el paquete si falta información
      }

      const productosSeleccionados = Array.from(productosTable.querySelectorAll('input[type="checkbox"]:checked'))
              .map(checkbox => checkbox.closest('tr').querySelector('td:nth-child(1)').textContent);

      const serviciosSeleccionados = Array.from(serviciosTable.querySelectorAll('input[type="checkbox"]:checked'))
              .map(checkbox => checkbox.closest('tr').querySelector('td:nth-child(1)').textContent);

      // Verificar si no hay productos ni servicios seleccionados
      if (productosSeleccionados.length === 0 && serviciosSeleccionados.length === 0) {
        alert('Selecciona al menos un producto o servicio.');
        return; // No se agrega el paquete si no hay productos ni servicios seleccionados
      }

      const newRow = consultaPaquetesTable.insertRow();
      const nombreCell = newRow.insertCell();
      const precioCell = newRow.insertCell();
      const categoriaCell = newRow.insertCell();
      const serviciosProductosCell = newRow.insertCell();

      nombreCell.textContent = nombre;
      precioCell.textContent = precio;
      categoriaCell.textContent = categoria;

      const serviciosProductosText = productosSeleccionados.concat(serviciosSeleccionados).join(', ');
      serviciosProductosCell.textContent = serviciosProductosText;

      // Limpiar los campos del formulario después de agregar el paquete
      infoForm.reset();

      // Desmarcar los checkboxes de productos y servicios
      productosTable.querySelectorAll('input[type="checkbox"]:checked').forEach(checkbox => checkbox.checked = false);
      serviciosTable.querySelectorAll('input[type="checkbox"]:checked').forEach(checkbox => checkbox.checked = false);
    });
  });
</script>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>
