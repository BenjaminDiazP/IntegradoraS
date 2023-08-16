<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrar Vehiculo</title>
  <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">
</head>

<body>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Registro de Vehiculo</h2>
      <nav>
        <c:choose>
          <c:when test="${tipoSesion == 'Gerente'}">
            <a href="Gerente.jsp" class="nav_link">Regresar</a>
          </c:when>
          <c:otherwise>
            <a href="Recepcionista.jsp" class="nav_link">Regresar</a>
          </c:otherwise>
        </c:choose>
      </nav>
    </div>
    <div class="card-body">
      <div class="row">
        <form id="registroForm" method="post" action="RegistroVehiculoServlet" enctype="multipart/form-data">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="noSerie">Numero de serie</label>
              <input type="text" class="form-control" name="noSerie" required>
            </div>
            <div class="form-group col-md-4">
              <label for="marca">Marca</label>
              <input type="text" class="form-control" name="marca" required>
            </div>
            <div class="form-group col-md-4">
              <label for="modelo">Modelo</label>
              <input type="text" class="form-control" name="modelo" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="color">Color</label>
              <input type="text" class="form-control" name="color" required>
            </div>
            <div class="form-group col-md-4">
              <label for="placas">Placas</label>
              <input type="text" class="form-control" name="placas" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="tipoCombustible">Tipo de Combustible</label>
              <input type="text" class="form-control" name="tipoCombustible" required>
            </div>
            <div class="form-group col-md-4">
              <label for="tipoTransmision">Tipo de Transmision</label>
              <input type="text" class="form-control" name="tipoTransmision" required>
            </div>
            <div class="form-group col-md-4">
              <label for="noMotor">Numero de motor</label>
              <input type="text" class="form-control" name="noMotor" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="tipo">Tipo de vehiculo</label>
              <input type="text" class="form-control" name="tipo" required>
            </div>
            <div class="form-group col-md-4">
              <label for="fechaEntrada">Fecha de Registro</label>
              <input type="date" class="form-control" name="fecharegistro" required>
            </div>
            <div class="form-group col-md-4">
              <center><label >Imagen</label></center>
              <input type="file" class="form-control" name="imagen" required>
            </div>
            <div class="form-group col-md-4">
              <label for="tipo"></label>
              <input type="hidden" class="form-control" name="id_cliente" value="${clienteID}" required>
            </div>
          </div>
          <div class="footer">
            <div class="col-12 d-flex justify-content-center">
              <input type="submit" value="Agregar vehiculo" class="btn btn-primary">
              <input type="hidden" value="Agregar vehiculo" name="accion" class="btn btn-primary">
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
          <form id="searchForm" action="" method="get">
            <div class="search-container">
              <input type="search" id="search" name="q" placeholder="Buscar vehiculo" />
              <button class="btn btn-primary" type="submit">Buscar</button>
              <button type="button" id="clearSearch" class="btn btn-danger">X</button>
            </div>
          </form>
          <h2 class="catalog-title">Vehiculos</h2>
          <div class="catalog-slider">
            <table class="catalog-table" id="serviciosTable">
              <thead>
              <tr>
                <th>No</th>
                <th>Imagen</th>
                <th>Numero de serie</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Año</th>
                <th>Color</th>
                <th>Placas</th>
                <th>Estados</th>
                <th>Acciones</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="Vehiculo" items="${listaVehiculo}" varStatus="status">
                <tr>
                  <td>${Vehiculo.identificador}</td>
                  <td><img src="data:imagen/png;base64, ${Vehiculo.imagen}" style="width: 90px; height: 90px; border-radius: 50%; border: 2px solid #ccc; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);"  ></td>
                  <td>${Vehiculo.noSerie}</td>
                  <td>${Vehiculo.marca}</td>
                  <td>${Vehiculo.modelo}</td>
                  <td>${Vehiculo.fechaRegistro}</td>
                  <td>${Vehiculo.color}</td>
                  <td>${Vehiculo.placas}</td>
                  <td>
                    <c:choose>
                      <c:when test="${Vehiculo.estado == 1}">
                        Disponible
                      </c:when>
                      <c:otherwise>
                        No Disponible
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button" onclick="toggleMenu('menu-${status.index}')">Opciones</button>
                      <div class="menu-content" id="menu-${status.index}">

                        <div class="boton-modal">
                          <button class="menu-button" onclick="abrirModal('modal-6${Vehiculo.noSerie}')">Modificar</button>
                        </div>
                        <input type="checkbox" id="btn-modal">

                        <div class="boton-modal-eliminar">
                          <button class="menu-button"
                                  onclick="abrirModal('modal-2${Vehiculo.noSerie}')">Estado</button>
                        </div>
                        <input type="checkbox" id="btn-modal-eliminar">

                        <div class="boton-modal-vermas">
                          <button class="menu-button" onclick="abrirModal('modal-3${Vehiculo.noSerie}')">Ver más</button>
                        </div>
                        <input type="checkbox" id="btn-modal-vermas">

                      </div>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<c:forEach var="Vehiculo" items="${listaVehiculo}" varStatus="status">
<div class="container-modal" id="modal-6${Vehiculo.noSerie}">
  <div class="content-modal">
    <div class="container my-3">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <h2>Modificar Vehiculo</h2>
        </div>
        <div class="card-body">
          <div class="row">
            <form id="modificarForm" method="post" action="RegistroVehiculoServlet">
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="noSerie">Numero de serie</label>
                  <input type="text" class="form-control" name="noSerie"  value="${Vehiculo.noSerie}">
                </div>
                <div class="form-group col-md-4">
                  <label for="marca">Marca</label>
                  <input type="text" class="form-control" name="marca" value="${Vehiculo.marca}">
                </div>
                <div class="form-group col-md-4">
                  <label for="modelo">Modelo</label>
                  <input type="text" class="form-control"  name="modelo" value="${Vehiculo.modelo}">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="color">Color</label>
                  <input type="text" class="form-control" name="color" value="${Vehiculo.color}">
                </div>
                <div class="form-group col-md-4">
                  <label >Placas</label>
                  <input type="text" class="form-control" name="placas"  value="${Vehiculo.placas}" >
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="tipoCombustible">Tipo de Combustible</label>
                  <input type="text" class="form-control" name="tipoCombustible" value="${Vehiculo.tipoCombustible}">
                </div>
                <div class="form-group col-md-4">
                  <label for="tipoTransmision">Tipo de Transmision</label>
                  <input type="text" class="form-control" name="tipoTransmision" value="${Vehiculo.tipoTransmision}">
                </div>
                <div class="form-group col-md-4">
                  <label for="noMotor">Numero de motor</label>
                  <input type="text" class="form-control" name="noMotor" value="${Vehiculo.noMotor}">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="tipo">Tipo de vehiculo</label>
                  <input type="text" class="form-control" name="tipo" value="${Vehiculo.tipo}">
                </div>
              </div>
              <div class="footer">
                <div class="col-12 d-flex justify-content-center">
                  <input type="submit" value="Modificar vehiculo" class="btn btn-primary">
                  <input type="hidden" value="Modificar Vehiculo"  name="accion" class="btn btn-primary">
                </div>
              </div>
            </form>
            <div class="btn-cerrar">
              <button class="btn btn-primary" onclick="cerrarModal('modal-6${Vehiculo.noSerie}')">Cerrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</c:forEach>

<c:forEach var="Vehiculo" items="${listaVehiculo}" varStatus="status">
<div class="container-modal-eliminar" id="modal-2${Vehiculo.noSerie}">
  <div class="content-modal">

    <div class="container my-3">
      <div class="card">
        <div class="card-header d-flex justify-content-between"></div>
        <div class="card-body">
          <div class="row">
            <form id="eliminarForm" method="post" action="RegistroVehiculoServlet">
              <div class="form-row d-flex justify-content-center">
                <label>Seguro que quieres Cambiar el estado con
                  numero de serie: ${Vehiculo.noSerie} ?</label>
              </div>
              <div class="form-group col-md-4">
                <label for="noSerie"></label>
                <input type="hidden" class="form-control" name="noSerie"  value="${Vehiculo.noSerie}">
              </div>
              <br>
              <div class="footer">
                <div class="col-12 d-flex justify-content-center">
                  <div class="mr-3">
                    <input type="submit" value="Cambiar Estado" class="btn btn-primary">
                    <input type="hidden" value="Cambiar Estado" name="accion" class="btn btn-primary">
                  </div>
                </div>
                <br>
              </div>
            </form>
            <div class="btn-cerrar">
              <button class="btn btn-primary" onclick="cerrarModal('modal-2${Vehiculo.noSerie}')">Cerrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</c:forEach>


<c:forEach var="Vehiculo" items="${listaVehiculo}" varStatus="status">
<div class="container-modal-vermas" id="modal-3${Vehiculo.noSerie}">
  <div class="content-modal">
    <div class="container my-3">
      <div class="card">
        <div class="card-header d-flex justify-content-between"></div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center">
              <img src="data:imagen/png;base64, ${Vehiculo.imagen}" style="width: 300px; height: 300px; border-radius: 50%; border: 2px solid #ccc; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);">
            </div>
            <div class="col-md-8">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="noSerie">Numero de serie:</label>
                    <input type="text" id="noSerie" class="form-control"  value="${Vehiculo.noSerie}" >
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="marca">Marca:</label>
                    <input type="text" id="marca" class="form-control" value="${Vehiculo.marca}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="modelo">Modelo:</label>
                    <input type="text" id="modelo" class="form-control"  value="${Vehiculo.modelo}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="placa">Placas:</label>
                    <input type="text" id="placa" class="form-control"  value="${Vehiculo.placas}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="anio">Fecha de Registro</label>
                    <input type="text" id="anio" class="form-control"  value="${Vehiculo.fechaRegistro}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="color">Color:</label>
                    <input type="text" id="color" class="form-control"  value="${Vehiculo.color}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="tipoCombustible">Combustible:</label>
                    <input type="text" id="tipoCombustible" class="form-control"  value="${Vehiculo.tipoCombustible}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="tipoTransmision">Transmision:</label>
                    <input type="text" id="tipoTransmision" class="form-control" value="${Vehiculo.tipoTransmision}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="noMotor">Numero de motor:</label>
                    <input type="text" id="noMotor" class="form-control" value="${Vehiculo.noMotor}">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="tipo">Tipo de vehiculo:</label>
                    <input type="text" id="tipo" class="form-control" value="${Vehiculo.tipo}">
                  </div>
                </div>
              </div>
            </div>
            <div class="btn-cerrar">
              <button class="btn btn-primary" onclick="cerrarModal('modal-3${Vehiculo.noSerie}')">Cerrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</c:forEach>


<c:choose>
<c:when test="${not empty mensajeError}">
  <script>
    swal({
      title: "Error de registro!",
      text: "Hubo un error al insertar el Empleado en la base de datos.",
      icon: "error",
    });
    // Elimina el atributo de sesión después de mostrar el mensaje
    <c:remove var="mensajeError" scope="session" />
    // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
    setTimeout(function() {
      location.reload();
    }, 2000);
  </script>
</c:when>
<c:when test="${not empty mensajeExito}">
  <script>
    swal({
      title: "Registro Existoso!",
      text: "Se ha registrado un Empleado correctamente.",
      icon: "success",
    });
    // Elimina el atributo de sesión después de mostrar el mensaje
    <c:remove var="mensajeExito" scope="session" />
    // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
    setTimeout(function() {
      location.reload();
    }, 2000);
  </script>
</c:when>
<c:when test="${not empty mensajeErrorUpdate}">
  <script>
    swal({
      title: "Error de registro!",
      text: "Hubo un error al modificar el Empleado en la base de datos.",
      icon: "error",
    });
    // Elimina el atributo de sesión después de mostrar el mensaje
    <c:remove var="mensajeErrorUpdate" scope="session" />
    // Recarga la página después de un breve retraso (por ejemplo, 2 segundos)
    setTimeout(function() {
      location.reload();
    }, 2000);
  </script>
</c:when>
</c:choose>



<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>