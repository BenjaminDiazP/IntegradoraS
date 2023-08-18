<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comprar</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/css/bootstrap.min.css">
    <!-- Incluye SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="assets/css/cssVentas/cssVentas.css" type="text/css">
    <link rel="stylesheet" href="assets/css/cssVentas/cssVentas2.css" type="text/css">
    <link rel="stylesheet" href="assets/css/cssVentas/cssVentas3.css" type="text/css">
    <link rel="stylesheet" href="assets/css/cssVentas/cssVentas4.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        $(document).ready(function () {
            function llenarTabla(mantenimiento) {
                $("#serviciosTable tbody").empty();
                var $row = $("<tr>");
                $row.append($("<td>").text(mantenimiento.nombreCliente));
                $row.append($("<td>").text(mantenimiento.apellido1));
                $row.append($("<td>").text(mantenimiento.apellido2));
                $row.append($("<td class='correo-celda'>").text(mantenimiento.correo));

                $("#serviciosTable tbody").append($row);
                $("#catalog-container").show();
                $("#no-results-message").hide();
            }

            $("#search-button").click(function () {
                var searchInput = $("#search-input").val();

                $.ajax({
                    type: "GET",
                    url: "VentasServlet?tipo=query",
                    data: { query: searchInput },
                    dataType: "json",
                    success: function (mantenimiento) {
                        if (mantenimiento.marca == null) {
                            $("#serviciosTable tbody").empty();
                            $("#catalog-container").hide();
                            $("#no-results-message").show();
                            $("#register-button").show();
                            console.log(mantenimiento);
                        } else {
                            llenarTabla(mantenimiento);
                            $("#register-button").hide();
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error en la solicitud AJAX:", error);
                    },
                });
            });
        });
        $(document).ready(function () {

            $("#productosTabla").on("change", "input[type='checkbox']", function () {
                var $row = $(this).closest("tr");
                var nombreArticulo = $row.find("td:eq(1)").text();
                var precioArticulo = $row.find("td:eq(2)").text();
                var categoriaArticulo = $row.find("td:eq(3)").text();

                if (this.checked) {
                    var $pedidoRow = $("<tr>");
                    $pedidoRow.append($("<td>").text(nombreArticulo));
                    $pedidoRow.append($("<td>").text(precioArticulo));
                    $pedidoRow.append($("<td>").text(categoriaArticulo));
                    $pedidoRow.append(
                        $("<td>").html(
                            '<button class="btn btn-danger eliminar-articulo" title="Eliminar"><i class="fas fa-trash-alt"></i></button>'
                        )
                    );
                    $("#comprasTable tbody").append($pedidoRow);
                } else {
                    $("#comprasTable tbody tr:contains('" + nombreArticulo + "')").remove();
                    articulosSeleccionados = articulosSeleccionados.filter(function (articulo) {
                        return articulo.nombre !== nombreArticulo;
                    });
                    $row.remove();
                }

                actualizarTotal();
            });

            // Al hacer clic en un botón "Eliminar" en la tabla de pedido
            $("#comprasTable").on("click", ".eliminar-articulo", function () {
                var nombreArticulo = $(this).closest("tr").find("td:eq(0)").text();
                $(this).closest("tr").remove();
                actualizarTotal();
                habilitarAgregar(nombreArticulo);
            });
            function calcularTotal() {
                var total = 0;
                $("#comprasTable tbody tr").each(function () {
                    var precioArticulo = parseFloat($(this).find("td:eq(1)").text().replace("$", ""));
                    total += precioArticulo;
                });
                return total;
            }
            function actualizarTotal() {
                var total = calcularTotal();
                $("#totalInput").val("$" + total.toFixed(2));
            }
            function habilitarAgregar(nombreArticulo) {
                $("#productosTabla tbody tr").each(function () {
                    if ($(this).find("td:eq(1)").text() === nombreArticulo) {
                        $(this).find(".agregar-articulo").prop("disabled", false);
                        return false;
                    }
                });
            }
            actualizarTotal();


            $("#registro-mantenimiento-form").submit(function (event) {
                event.preventDefault(); // Prevenir el comportamiento de envío predeterminado del formulario
                var productosSeleccionados = [];
                var total = $('#totalInput').val();
                var correo = $('.correo-celda').text();
                var tipo = $('#tipoP').val();

                $("#comprasTable tbody tr").each(function () {
                    var nombre = $(this).find("td:eq(0)").text().trim();
                    var precio = parseFloat($(this).find("td:eq(1)").text().replace("$", ""));
                    var categoria = $(this).find("td:eq(2)").text().trim();

                    productosSeleccionados.push({
                        nombre: nombre,
                        precio: precio,
                        categoria: categoria,
                    });
                });

                // Verificar si todos los datos tienen valor
                if (!total || !correo || !tipo || productosSeleccionados.length === 0) {
                    Swal.fire("Error", "Debes completar todos los campos y seleccionar al menos un producto antes de registrar el pago.", "error");
                    return; // Detener la ejecución si falta algún dato
                }

                // Si todos los datos tienen valor, realizar la solicitud AJAX
                $.ajax({
                    url: "VentasServlet", // Reemplaza con la URL correcta
                    method: "POST",
                    data: {
                        productos: JSON.stringify(productosSeleccionados),
                        total: total,
                        correo: correo,
                        tipo: tipo
                    },
                    success: function (response) {
                        Swal.fire("Éxito", "Datos registrados correctamente", "success");
                    },
                    error: function (xhr, status, error) {
                        console.error("Error al enviar productos: " + error);
                    },
                });
            });
        });
    </script>

    <style>
        .catalog-table th {
            background-color: #141e30;
            color: white;
            text-align: left;
        }
    </style>

</head>
<body>
<div id="mensajeError" style="color: red;"></div>
<form id="registro-mantenimiento-form">
    <div class="container my-3">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h2>Catálogo de productos</h2>
                <nav>
                    <c:choose>
                        <c:when test="${tipoSesion == 'Gerente'}">
                            <a href="Gerente.jsp" class="nav_link">Regresar</a>
                        </c:when>
                        <c:otherwise>
                            <a href="Caja.jsp" class="nav_link">Regresar</a>
                        </c:otherwise>
                    </c:choose>
                </nav>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="search-container">
                                    <i class="fas fa-search"></i>
                                    <input type="text" id="search-input" placeholder="Buscar usuario">
                                    <button type="button" id="search-button">Aceptar</button>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="catalog-container" id="catalog-container" style="display: none;">
                                    <div class="catalog-slider">
                                        <table class="catalog-table" id="serviciosTable">
                                            <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Apellido Paterno</th>
                                                <th>Apellido Materno</th>
                                                <th>Correo </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="no-results-message" class="message-box" style="display: none;">
                                    El usuario no está registrado.
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="search-container">
                            <input type="search" id="busquedaInput" name="q" placeholder="Busca tu articulo" />
                            <button class="btn btn-primary" type="submit" id="search-Form">Buscar</button>
                            <button type="button" id="clearSearch" class="btn btn-danger">X</button>
                        </div>
                        <h2 class="catalog-title" >Productos</h2>
                        <div class="catalog-slider">
                            <table class="catalog-table" id="productosTabla"  >
                                <thead>
                                <tr>
                                    <th>Imagen</th>
                                    <th>Nombre de Articulo</th>
                                    <th>Precio</th>
                                    <th>Categoría</th>
                                    <th>Agregar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="art" items="${ListaArticulos}" varStatus="status">
                                    <tr>
                                        <td><img src="data:imagen/png;base64, ${art.imagen} " style="width: 90px; height: 90px; border-radius: 50%; border: 2px solid #ccc; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);"></td>
                                        <td>${art.nombre}</td>
                                        <td>${art.costo}</td>
                                        <td>${art.categoria}</td>
                                        <td>
                                            <label class="custom-checkbox">
                                                <input type="checkbox">
                                                <span class="checkmark"></span>
                                            </label>
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

    <div class="container my-3">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h2>Pedido</h2>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-8 mx-auto">
                        <div class="catalog-container">
                            <h2 class="catalog-title">Pedido</h2>
                            <div class="catalog-slider">
                                <table class="catalog-table" id="comprasTable">
                                    <thead>
                                    <tr>
                                        <th>Nombre de Artículo</th>
                                        <th>Precio</th>
                                        <th>Categoria</th>
                                        <th>Eliminar</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Filas de productos seleccionados se agregarán aquí -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex flex-column justify-content-center">
                        <center><label for="totalInput">Total</label></center>
                        <input type="text" id="totalInput" class="form-control mt-3" placeholder="$0.00" disabled>
                        <br>
                        <select class="form-control" id="tipoP" required>
                            <option value="" selected disabled>Elige un tipo de pago</option>
                            <option value="Tarjeta">Pago con tarjeta</option>
                            <option value="Efectivo">Pago en efectivo</option>
                        </select>
                        <button type="submit" class="btn btn-primary mt-3">Registrar Pago</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</form>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén referencias a los elementos relevantes
        var productosTabla = document.getElementById("productosTabla");
        var searchForm = document.getElementById("search-Form");
        var searchInput = document.getElementById("busquedaInput");
        var clearSearchBtn = document.getElementById("clearSearch");

        // Función para filtrar las filas según el término de búsqueda
        function filtrarFilas(filtro) {
            // Obtén todas las filas de la tabla de productos
            var filasProductos = productosTabla.querySelectorAll("tbody tr");
            var seEncontraronResultados = false;

            // Mostrar todas las filas inicialmente
            filasProductos.forEach(function (fila) {
                fila.style.display = "table-row";
            });

            // Si el término de búsqueda está vacío, no se necesita filtrar
            if (filtro === "") {
                return true; // Se considera como éxito de búsqueda
            }

            // Recorre las filas y muestra/oculta según el término de búsqueda
            filasProductos.forEach(function (fila) {
                var nombre = fila.children[1].textContent.toLowerCase();
                var categoria = fila.children[3].textContent.toLowerCase();
                var coincidencia = nombre.includes(filtro) || categoria.includes(filtro);

                if (!coincidencia) {
                    fila.style.display = "none"; // Oculta la fila que no coincide
                } else {
                    seEncontraronResultados = true; // Marca que se encontraron resultados
                }
            });

            return seEncontraronResultados;
        }

        // Función para borrar la búsqueda y mostrar todas las filas
        function borrarBusqueda() {
            searchInput.value = ""; // Limpiar el campo de búsqueda
            filtrarFilas(""); // Mostrar todas las filas nuevamente
        }

        // Manejar envío del formulario de búsqueda
        searchForm.addEventListener("click", function (event) {
            event.preventDefault();
            var filtro = searchInput.value.trim().toLowerCase();

            // Mostrar alerta si el campo de búsqueda está vacío
            if (filtro === "") {
                alert("Ingresa un término de búsqueda antes de buscar.");
                return;
            }

            var seEncontraronResultados = filtrarFilas(filtro);

            // Mostrar todas las filas si no se encontraron resultados
            if (!seEncontraronResultados) {
                alert("No se encontraron productos que coincidan con la búsqueda.");
                filtrarFilas(""); // Mostrar todas las filas
            }
        });

        // Manejar clic en el botón "X" para borrar la búsqueda
        clearSearchBtn.addEventListener("click", borrarBusqueda);

        // Mostrar u ocultar el botón "X" según el contenido del campo de búsqueda
        searchInput.addEventListener("input", function () {
            clearSearchBtn.style.display = this.value.trim() === "" ? "none" : "block";
        });

    });
</script>

<script src="assets/js/jsRegistrarEU/scriptMenu.js"></script>
</body>

</html>


