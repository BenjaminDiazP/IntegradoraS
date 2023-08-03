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
  <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">
</head>

<body>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Registro de Vehiculo</h2>
      <nav>
        <a href="RegistrarUsuario.jsp" class="nav_link">Regresar</a>
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
            <div class="form-group col-md-4">
              <label for="fechaEntrada">Fecha de Entrada</label>
              <input type="date" class="form-control" id="fechaEntrada" required>
            </div>
            <div class="form-group col-md-4">
              <center><label for="imagen">Imagen</label></center>
              <input type="file" class="form-control" id="imagen" required accept="image/*">
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
                <th>Acciones</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>1</td>
                <td><img src="img/Logo.png" width="90px" height="90px"></td>
                <td>ABC123</td>
                <td>Toyota</td>
                <td>Corolla</td>
                <td>2018</td>
                <td>Blanco</td>
                <td>XYZ789</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button" onclick="toggleMenu('menu-1')">Opciones</button>
                    <div class="menu-content" id="menu-1">
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-6')">Modificar</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                      <div class="boton-modal-eliminar">
                        <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                      </div>
                      <input type="checkbox" id="btn-modal-eliminar">
                      <div class="boton-modal-vermas">
                        <button class="menu-button" onclick="abrirModal('modal-3')">Ver más</button>
                      </div>
                      <input type="checkbox" id="btn-modal-vermas">
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>2</td>
                <td><img src="img/Logo.png" width="90px" height="90px"></td>
                <td>XYZ456</td>
                <td>Honda</td>
                <td>Accord</td>
                <td>2015</td>
                <td>Plata</td>
                <td>JKL321</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button" onclick="toggleMenu('menu-2')">Opciones</button>
                    <div class="menu-content" id="menu-2">
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-6')">Modificar</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                      <div class="boton-modal-eliminar">
                        <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                      </div>
                      <input type="checkbox" id="btn-modal-eliminar">
                      <div class="boton-modal-vermas">
                        <button class="menu-button" onclick="abrirModal('modal-3')">Ver más</button>
                      </div>
                      <input type="checkbox" id="btn-modal-vermas">
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>3</td>
                <td><img src="img/Logo.png" width="90px" height="90px"></td>
                <td>LMN789</td>
                <td>Ford</td>
                <td>Mustang</td>
                <td>2020</td>
                <td>Azul</td>
                <td>QWE987</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button" onclick="toggleMenu('menu-3')">Opciones</button>
                    <div class="menu-content" id="menu-3">
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-6')">Modificar</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                      <div class="boton-modal-eliminar">
                        <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                      </div>
                      <input type="checkbox" id="btn-modal-eliminar">
                      <div class="boton-modal-vermas">
                        <button class="menu-button" onclick="abrirModal('modal-3')">Ver más</button>
                      </div>
                      <input type="checkbox" id="btn-modal-vermas">
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>4</td>
                <td><img src="img/Logo.png" width="90px" height="90px"></td>
                <td>PQR987</td>
                <td>Chevrolet</td>
                <td>Cruze</td>
                <td>2017</td>
                <td>Rojo</td>
                <td>ABC456</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button" onclick="toggleMenu('menu-4')">Opciones</button>
                    <div class="menu-content" id="menu-4">
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-6')">Modificar</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                      <div class="boton-modal-eliminar">
                        <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                      </div>
                      <input type="checkbox" id="btn-modal-eliminar">
                      <div class="boton-modal-vermas">
                        <button class="menu-button" onclick="abrirModal('modal-3')">Ver más</button>
                      </div>
                      <input type="checkbox" id="btn-modal-vermas">
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>5</td>
                <td><img src="img/Logo.png" width="90px" height="90px"></td>
                <td>DEF789</td>
                <td>Nissan</td>
                <td>Altima</td>
                <td>2019</td>
                <td>Negro</td>
                <td>RST654</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button" onclick="toggleMenu('menu-5')">Opciones</button>
                    <div class="menu-content" id="menu-5">
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-6')">Modificar</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                      <div class="boton-modal-eliminar">
                        <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                      </div>
                      <input type="checkbox" id="btn-modal-eliminar">
                      <div class="boton-modal-vermas">
                        <button class="menu-button" onclick="abrirModal('modal-3')">Ver más</button>
                      </div>
                      <input type="checkbox" id="btn-modal-vermas">
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>6</td>
                <td><img src="img/Logo.png" width="90px" height="90px"></td>
                <td>GHI123</td>
                <td>Hyundai</td>
                <td>Elantra</td>
                <td>2016</td>
                <td>Gris</td>
                <td>UVW321</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button" onclick="toggleMenu('menu-6')">Opciones</button>
                    <div class="menu-content" id="menu-6">
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-6')">Modificar</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                      <div class="boton-modal-eliminar">
                        <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                      </div>
                      <input type="checkbox" id="btn-modal-eliminar">
                      <div class="boton-modal-vermas">
                        <button class="menu-button" onclick="abrirModal('modal-3')">Ver más</button>
                      </div>
                      <input type="checkbox" id="btn-modal-vermas">
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>7</td>
                <td><img src="img/Logo.png" width="90px" height="90px"></td>
                <td>JKL987</td>
                <td>BMW</td>
                <td>X5</td>
                <td>2022</td>
                <td>Blanco</td>
                <td>LMN321</td>
                <td>
                  <div class="menu-container">
                    <button class="menu-button" onclick="toggleMenu('menu-7')">Opciones</button>
                    <div class="menu-content" id="menu-7">
                      <div class="boton-modal">
                        <button class="menu-button" onclick="abrirModal('modal-6')">Modificar</button>
                      </div>
                      <input type="checkbox" id="btn-modal">
                      <div class="boton-modal-eliminar">
                        <button class="menu-button" onclick="abrirModal('modal-2')">Eliminar</button>
                      </div>
                      <input type="checkbox" id="btn-modal-eliminar">
                      <div class="boton-modal-vermas">
                        <button class="menu-button" onclick="abrirModal('modal-3')">Ver más</button>
                      </div>
                      <input type="checkbox" id="btn-modal-vermas">
                    </div>
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

<div class="container-modal" id="modal-6">
  <div class="content-modal">
    <div class="container my-3">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <h2>Modificar Vehiculo</h2>
        </div>
        <div class="card-body">
          <div class="row">
            <form id="modificarForm">
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
                <div class="form-group col-md-4">
                  <center><label for="imagen">Imagen</label></center>
                  <input type="file" class="form-control" id="imagen" required accept="image/*">
                </div>
              </div>
              <div class="footer">
                <div class="col-12 d-flex justify-content-center">
                  <input type="submit" value="Modificar vehiculo" class="btn btn-primary">
                </div>
              </div>
              <div class="btn-cerrar">
                <button class="btn btn-primary" onclick="cerrarModal('modal-6')">Cerrar</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container-modal-eliminar" id="modal-2">
  <div class="content-modal">

    <div class="container my-3">
      <div class="card">
        <div class="card-header d-flex justify-content-between"></div>
        <div class="card-body">
          <div class="row">
            <form id="eliminarForm">
              <div class="form-row d-flex justify-content-center">
                <label>Seguro que quieres eliminar el vehiculo con
                  numero de serie: ?</label>
              </div>
              <br>
              <div class="footer">
                <div class="col-12 d-flex justify-content-center">
                  <div class="mr-3">
                    <input type="submit" value="Eliminar Vehiculo" class="btn btn-primary">
                  </div>
                </div>
                <br>
              </div>
            </form>
            <div class="btn-cerrar">
              <button class="btn btn-primary" onclick="cerrarModal('modal-2')">Cerrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container-modal-vermas" id="modal-3">
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
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="noSerie">Numero de serie:</label>
                    <input type="text" id="noSerie" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="marca">Marca:</label>
                    <input type="text" id="marca" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="modelo">Modelo:</label>
                    <input type="text" id="modelo" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="placa">Placas:</label>
                    <input type="text" id="placa" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="anio">Año:</label>
                    <input type="text" id="anio" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="color">Color:</label>
                    <input type="text" id="color" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="tipoCombustible">Combustible:</label>
                    <input type="text" id="tipoCombustible" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="tipoTransmision">Transmision:</label>
                    <input type="text" id="tipoTransmision" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="noMotor">Numero de motor:</label>
                    <input type="text" id="noMotor" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="tipo">Tipo de vehiculo:</label>
                    <input type="text" id="tipo" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="fechaEntrada">Fecha de Entrada</label>
                    <input type="date" id="fechaEntrada" class="form-control">
                  </div>
                </div>
              </div>
            </div>
            <div class="btn-cerrar">
              <button class="btn btn-primary" onclick="cerrarModal('modal-3')">Cerrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>