<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Articulos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssRegistroArticu/styleArticu.css" type="text/css">
</head>

<body>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de Articulos</h2>
            <nav>
                <a href="" class="nav_link">Regresar</a>
            </nav>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="container mx-auto">
                    <form  action="RegistroArticulosServlet" method="post">
                        <div class="form-row d-flex justify-content-center">
                            <div class="form-group col-md-3">
                                <label >Nombre</label>
                                <input type="text" class="form-control" name="nombre" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label >Precio</label>
                                <input type="number" class="form-control" name="costo" required>
                            </div>
                        </div>
                        <div class="form-row d-flex justify-content-center">
                            <div class="form-group col-md-3">
                                <label>Categoria</label>
                                <input type="text" class="form-control" name="categoria" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label >Cantidad</label>
                                <input type="number" class="form-control" name="stock" required>
                            </div>
                        </div>
                        <div class="footer">
                            <div class="col-12 d-flex justify-content-center">
                                <div class="mr-3">
                                    <input type="submit" value="Agregar Articulo" class="btn btn-primary">
                                    <input type="hidden" name="RegistrarA" value="AgregarArticulo">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="container my-3">

    <div class="card">

        <div class="card-header d-flex justify-content-between">
            <h2>Inventario</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="catalog-container">
                    <form action="" method="get">
                        <label for="search">Articulos:</label>
                        <input type="search" id="search" name="q" />
                        <button class="btn btn-primary"  type="submit">Buscar</button>
                    </form>

                    <div id="results">
                        <!-- Aquí se supone que deben salir los resultados
                        pinche berraco-->
                    </div>
                    <h2 class="catalog-title">Productos</h2>
                    <div class="catalog-slider">
                        <table class="catalog-table" id="serviciosTable">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th>Nombre </th>
                                <th>Categoria</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="articulo" items="${listaArticulos}" varStatus="status">
                                <tr>
                                    <td>${articulo.identificador}</td>
                                    <td>${articulo.nombre}</td>
                                    <td>${articulo.costo}</td>
                                    <td>${articulo.categoria}</td>
                                    <td>${articulo.stock}</td>
                                    <td>
                                        <div class="menu-container">
                                            <button class="menu-button" onclick="toggleMenu('menu-${status.index}')">Opciones</button>
                                            <div class="menu-content" id="menu-${status.index}">
                                                <div class="boton-modal">
                                                    <!-- Establecemos el ID del botón "Modificar" para abrir el modal correspondiente -->
                                                    <button class="menu-button" onclick="abrirModal('modal-${articulo.id_producto}')">Modificar</button>
                                                </div>
                                                <input type="checkbox" id="btn-modal">
                                                <button class="menu-button">Eliminar</button>
                                                <input href="">
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

<!-- Modales -->
<c:forEach var="articulo" items="${listaArticulos}" varStatus="status">
    <!-- Asignamos un ID único al modal usando el id_producto del artículo -->
    <div class="container-modal" id="modal-${articulo.id_producto}">
        <div class="content-modal">
            <div class="container my-3">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <h2>Modificar Articulo</h2>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <form id="formularioModificar" action="ActualizarArticulosServlet" method="post">
                                <div class="form-row d-flex justify-content-center">
                                    <div class="form-group col-md-3">
                                        <label>Modificar nombre</label>
                                        <input type="text" class="form-control" name="nombre" required value="${articulo.nombre}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Modificar precio</label>
                                        <input type="number" class="form-control" name="costo" required value="${articulo.costo}">
                                    </div>
                                </div>
                                <div class="form-row d-flex justify-content-center">
                                    <div class="form-group col-md-3">
                                        <label>Modificar categoria</label>
                                        <input type="text" class="form-control" name="categoria" required value="${articulo.categoria}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Modificar cantidad</label>
                                        <input type="number" class="form-control" name="stock" required value="${articulo.stock}">
                                    </div>

                                </div>
                                <div class="footer">
                                    <div class="col-12 d-flex justify-content-center">
                                        <div class="mr-3">
                                            <input type="submit" value="Modificar Articulo" class="btn btn-primary">
                                            <input type="hidden" value="Modificar Articulo" class="btn btn-primary">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-3">

                                        <input type="hidden" class="form-control" name="id_producto" required value="${articulo.id_producto}">
                                    </div>
                                    <div class="btn-cerrar">
                                        <!-- Llamamos a la función cerrarModal() para cerrar el modal -->
                                        <button class="btn btn-primary" onclick="cerrarModal('modal-${articulo.id_producto}')">Cerrar</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jsArticulos/scriptMenu.js"></script>
</body>




</html>
