<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Extra</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssConsulaMantenimiento/cssConsulta.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function mostrarProductosExtra() {
            var checkboxes = $("input[name^='articulo_']:checked");
            var selectedArticulos = checkboxes.map(function() {
                return $(this).val();
            }).get();

            if (selectedArticulos.length > 0) {
                var confirmText = "¿Deseas agregar los siguientes artículos como productos extra?\n\n";
                selectedArticulos.forEach(function(articulo) {
                    confirmText += "- Artículo: " + articulo + "\n";
                });

                Swal.fire({
                    title: 'Confirmación',
                    text: confirmText,
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Sí',
                    cancelButtonText: 'No'
                }).then((result) => {
                    if (result.isConfirmed) {
                        var idMantenimiento = $('#id_mantenimiento').val();

                        // Elimina comillas adicionales de los valores
                        var nombresSinComillas = selectedArticulos.map(function(articulo) {
                            return articulo.replace(/"/g, "");
                        });

                        $.ajax({
                            type: "POST",
                            url: "ConsultaMantenimientoServlet",
                            data: {
                                id_mantenimiento: idMantenimiento,
                                articulos: JSON.stringify(nombresSinComillas) // Envía los nombres sin comillas
                            },
                            dataType: "json",
                            success: function(response) {
                                if (typeof response === 'object' && response.status === 'success') {
                                    const detalles = response.detalles;

                                    detalles.forEach(function(detallesArticulo) {
                                        const nombre = detallesArticulo.nombre;
                                        const categoria = detallesArticulo.categoria;

                                        const fila = $("<tr>");
                                        fila.append($("<td>").text(nombre));
                                        fila.append($("<td>").text(categoria));

                                        $("#productosExtra tbody").append(fila);
                                    });

                                    // Realizar otras acciones o mostrar mensajes si es necesario
                                } else {
                                    // Manejar respuesta en caso de error u otro estado
                                }
                            },
                            error: function(xhr, status, error) {
                                // Manejo de error si es necesario
                            }
                        });
                    }
                });
            }
        }
    </script>
</head>

<body>

<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Productos</h2>
            <nav>
                <a href="#" class="nav_link">Regresar</a>
            </nav>
        </div>
        <form id="productosForm">
            <div class="card-body">
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
                                        <td>${articuloP.costo}</td>
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
                                    <th>Nombre</th>
                                    <th>Categoría</th>
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
                    <div class="col-12 d-flex justify-content-center">
                        <button type="button" onclick="mostrarProductosExtra()" class="btn btn-primary">Productos Extra</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<c:forEach var="man" items="${oneMantenimiento}" varStatus="status">
<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Mantenimiento</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <img src="img/carro.jpg" alt="Descripción de la imagen" class="img-fluid">
                </div>
                <div class="col-md-8">
                    <form id="registroForm">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nombreCliente">Nombre del cliente</label>
                                <input type="text" class="form-control" id="nombreCliente" value="${man.nombreCliente}" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="placasVehiculo">Numero de Serie</label>
                                <input type="text" class="form-control" id="placasVehiculo" value="${man.noSerie}" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="categoria">Categoria</label>
                                <input type="text" class="form-control" id="categoria" value="${man.categoria}" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="paquete">Paquete</label>
                                <input type="text" class="form-control" id="paquete" value="${man.nombrePaquete}" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inicioMantenimiento">Registro de Mantenimiento</label>
                                <input type="date" class="form-control" id="inicioMantenimiento" value="${man.fechaInicio}" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="descripcion">Descripción</label>
                                <input type="text" class="form-control" id="descripcion" value="${man.descripcion}" disabled>
                            </div>
                            <input type="hidden" class="form-control" name="id_mantenimiento" id="id_mantenimiento" value="${man.id_mantenimiento}" >

                        </div>
                    </form>
                </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-8 mx-auto">
            <div class="catalog-container">
                <h2 class="catalog-title">Productos Extra</h2>
                <div class="catalog-slider">
                    <table class="catalog-table" id="productosExtra">
                        <thead>
                        <tr>
                            <th>Nombre del producto</th>
                            <th>Categoria</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach varStatus="status" items="${listaExtras}" var="extra">
                            <tr>
                                <td>${extra.nombre}</td>
                                <td>${extra.categoria}</td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>

        <hr class="my-4">
        <h4>
            <center>Progreso del Mantenimiento</center>
        </h4>
        <br>
        <div class="col-md-8 mx-auto">
            <div class="progress-bar-container">
                <div class="progress-bar" id="myProgressBar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div id="porcentajeTexto" class="text-center mt-2"></div>
            <br>
            <button id="avanzarBoton" class="btn btn-primary">Avanzar</button>
        </div>
    </div>
</div>

<script>
    var porcentaje = 0;
    const incremento = 25;

    // Función para actualizar la barra de progreso visualmente
    function actualizarBarraProgreso(porcentaje) {
        const barra = document.getElementById("myProgressBar");
        const porcentajeNumero = document.getElementById("porcentajeNumero");

        barra.style.width = porcentaje + "%";
        porcentajeTexto.innerHTML = porcentaje + "%";
        porcentajeNumero.textContent = porcentaje + "%"; // Actualiza el número de porcentaje
        if (porcentaje >= 100) {
            barra.style.backgroundColor = "green"; // Cambia el color de la barra cuando alcanza el 100%
        }
    }

    // Función para cargar el progreso actual del mantenimiento
    function cargarProgresoMantenimiento() {
        var idMantenimiento = $('#id_mantenimiento').val();
        $.ajax({
            type: "GET",
            url: "ProcesoServlet",
            data: { id_mantenimiento: idMantenimiento },
            success: function(response) {
                if (response.status === "success") {
                    const porcentajeActual = response.porcentaje;
                    porcentaje = porcentajeActual; // Actualiza la variable global de porcentaje
                    actualizarBarraProgreso(porcentajeActual);
                }
            },
            error: function(xhr, status, error) {
                // Manejo de error si es necesario
            }
        });
    }

    // Función para actualizar el progreso del mantenimiento
    function actualizarProgresoMantenimiento() {
        var idMantenimiento = $('#id_mantenimiento').val();
        $.ajax({
            type: "POST",
            url: "ProcesoServlet",
            data:  { id_mantenimiento: idMantenimiento, porcentaje: porcentaje }, // Utiliza la variable global
            success: function(response) {
                // Actualizar la barra de progreso después de actualizar el progreso en la base de datos
                cargarProgresoMantenimiento();
            },
            error: function(xhr, status, error) {
                // Manejo de error si es necesario
            }
        });
    }

    // Manejar evento del botón "Avanzar"
    document.getElementById("avanzarBoton").addEventListener("click", function() {
        if (porcentaje + incremento >= 100) {
            Swal.fire({
                title: 'Confirmación',
                text: '¿Deseas finalizar el mantenimiento?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.isConfirmed) {
                    porcentaje = 100;
                    actualizarProgresoMantenimiento();
                }
            });
        } else {
            Swal.fire({
                title: 'Confirmación',
                text: '¿Deseas avanzar?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Sí',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.isConfirmed) {
                    porcentaje += incremento;
                    actualizarProgresoMantenimiento();
                }
            });
        }
    });

    $(document).ready(function() {
        cargarProgresoMantenimiento();
    });
</script>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>
