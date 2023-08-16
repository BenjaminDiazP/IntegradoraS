<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caja</title>
  <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/StylePanelRegistro/styleCaja.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
</head>

<body>

<div class="container my-3">
  <div class="card">
    <div class="card-header d-flex justify-content-between">
      <h2>Consultas</h2>
      <nav>
        <a href="" class="nav_link">Inicio</a>
      </nav>
    </div>
    <div class="card-body">
      <div class="row">

        <div class="col-md-8 mx-auto">
          <div class="catalog-container">
            <h2 class="catalog-title">Tickets</h2>
            <div class="catalog-slider">
              <table class="catalog-table" id="serviciosTable">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Nombre de usuario</th>
                  <th>Fecha de pago</th>
                  <th>Consulta</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>Juanito Perez</td>
                  <td>14/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-1')">Opciones</button>
                      <div class="menu-content" id="menu-1">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Jaimito Sanchez</td>
                  <td>14/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-2')">Opciones</button>
                      <div class="menu-content" id="menu-2">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>Stuart Martinez</td>
                  <td>15/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-3')">Opciones</button>
                      <div class="menu-content" id="menu-3">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>Joaquin Guzman</td>
                  <td>15/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-4')">Opciones</button>
                      <div class="menu-content" id="menu-4">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>Marco Hernandez</td>
                  <td>15/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-5')">Opciones</button>
                      <div class="menu-content" id="menu-5">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>Maria Mendez</td>
                  <td>15/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-6')">Opciones</button>
                      <div class="menu-content" id="menu-6">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>7</td>
                  <td>Xiadani Cardenas</td>
                  <td>15/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-7')">Opciones</button>
                      <div class="menu-content" id="menu-7">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>8</td>
                  <td>Mara Beltran</td>
                  <td>15/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-8')">Opciones</button>
                      <div class="menu-content" id="menu-8">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>9</td>
                  <td>Briseida Dominguez</td>
                  <td>15/07/2023</td>
                  <td>
                    <div class="menu-container">
                      <button class="menu-button"
                              onclick="toggleMenu('menu-9')">Opciones</button>
                      <div class="menu-content" id="menu-9">
                        <a class="menu-button" href="Pago.html">Mostrar historial</a>
                        <button class="menu-button">Generar ticket</button>
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
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/jscajaticket"></script>
</body>

</html>