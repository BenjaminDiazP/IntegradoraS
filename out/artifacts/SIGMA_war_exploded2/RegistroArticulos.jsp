<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Articulos</title>
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssRegistroEU/cssRegistroEU.css" type="text/css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de Articulos</h2>
            <nav>
                <a href="Gerente.jsp" class="nav_link">Regresar</a>
            </nav>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="container mx-auto">
                    <form  action="RegistroArticulosServlet" method="post" enctype="multipart/form-data">
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
                        <div class="form-row d-flex justify-content-center">
                            <div class="form-group col-md-3">
                                <label >Imagen</label>
                                <input type="file" class="form-control" name="imagen" required>
                            </div>
                        </div>
                        <div class="footer">
                            <div class="col-12 d-flex justify-content-center">
                                <div class="mr-3">
                                    <input type="submit" value="Agregar Articulo" class="btn btn-primary">
                                    <input type="hidden" name="accion" value="AgregarArticulo">
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
                    <form id="searchForm" action="" method="get">
                        <div class="search-container">
                            <input type="search" id="search" name="q" placeholder="Busca tu articulo">
                            <button class="btn btn-primary" type="submit">Buscar</button>
                            <button type="button" id="clearSearch" class="btn btn-danger">X</button>
                        </div>
                    </form>
                    <h2 class="catalog-title">Productos</h2>
                    <div class="catalog-slider">
                        <table class="catalog-table" id="serviciosTable">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th> </th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Categoria</th>
                                <th>Cantidad</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="articulo" items="${listaArticulos}" varStatus="status">
                                <tr>
                                    <td>${articulo.identificador}</td>
                                    <td><img src="data:imagen/png;base64, ${articulo.imagen}" style="width: 90px; height: 90px; border-radius: 50%; border: 2px solid #ccc; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);"  ></td>
                                    <td>${articulo.nombre}</td>
                                    <td>${articulo.costo}</td>
                                    <td>${articulo.categoria}</td>
                                    <td>${articulo.stock}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${articulo.estado == 1 && articulo.stock >0}">
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
                                                    <!-- Establecemos el ID del botón "Modificar" para abrir el modal correspondiente -->
                                                    <button class="menu-button" onclick="abrirModal('modal-${articulo.id_producto}')">Modificar</button>
                                                </div>
                                                <input type="checkbox" id="btn-modal">

                                                <div class="boton-modal-eliminar">
                                                    <button class="menu-button"
                                                            onclick="abrirModal('modal2-${articulo.id_producto}')">Estado</button>
                                                </div>
                                                <input type="checkbox" id="btn-modal-eliminar">
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
<c:forEach var="articulo" items="${listaArticulos}" varStatus="status">
    <div class="container-modal-eliminar" id="modal2-${articulo.id_producto}">
        <div class="content-modal">
            <div class="container my-3">
                <div class="card">
                    <div class="card-header d-flex justify-content-between"></div>
                    <div class="card-body">
                        <div class="row">
                            <form id="eliminarForm" method="post" action="RegistroArticulosServlet">
                                <div class="form-row d-flex justify-content-center">
                                    <label>Seguro que quieres cambiar el estado <del></del> articulo: ${articulo.nombre}?</label>
                                </div>
                                <br>
                                <div class="footer">
                                    <div class="col-12 d-flex justify-content-center">
                                        <div class="mr-3">
                                            <input type="submit" value="Cambiar estado" name="accion" class="btn btn-primary">
                                            <input type="hidden" value="${articulo.id_producto}" name="id_producto">
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </form>
                            <div class="btn-cerrar">
                                <button class="btn btn-primary" onclick="cerrarModal('modal2-${articulo.id_producto}')">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>



<c:choose>
    <c:when test="${not empty mensajeExito}">
        <script>
            swal({
                title: "Registro de articulo Existoso!",
                text: "Se ha registrado correctamen el articulo.",
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
</c:choose>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>
</html>