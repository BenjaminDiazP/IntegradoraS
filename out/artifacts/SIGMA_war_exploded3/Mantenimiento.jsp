
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de mantenimiento</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/cssMantenimiento/Mantenimiento.css" type="text/css">
    <link rel="stylesheet" href="assets/css/cssMantenimiento/Mantenimiento2.css" type="text/css">
    <script src="assets/js/JsMantenimietno/scriptMantenimiento.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function () {
            // Función para llenar la tabla con los datos de mantenimiento
            function llenarTabla(mantenimiento) {
                $("#serviciosTable tbody").empty(); // Limpiamos el contenido del tbody

                var $row = $("<tr>"); // Crear una nueva fila
                $row.append($("<td>").text(mantenimiento.nombreCliente)); // Agregar celda de nombre
                $row.append($("<td class='correo-celda'>").text(mantenimiento.correo)); // Agregar celda de correo
                $row.append($("<td>").text(mantenimiento.placas)); // Agregar celda de placas
                $row.append($("<td>").text(mantenimiento.marca)); // Agregar celda de marca

                // Agregar la fila a la tabla
                $("#serviciosTable tbody").append($row);

                // Mostrar la tabla
                $("#catalog-container").show();

                // Mostrar el formulario de descripción
                $("#descripcion-row").show();

                // Ocultar el mensaje de no resultados
                $("#no-results-message").hide();
            }

            // Evento para el clic en el botón de búsqueda
            $("#search-button").click(function () {
                var searchInput = $("#search-input").val();


                $.ajax({
                    type: "GET",
                    url: "MantenimientoServlet?tipo=query",
                    data: { query: searchInput },
                    dataType: "json",
                    success: function (mantenimiento) {
                        if (mantenimiento.marca == null ) { // Verificar si el JSON está vacío
                            // Mostrar mensaje de usuario no encontrado
                            $("#serviciosTable tbody").empty(); // Limpiar la tabla
                            $("#catalog-container").hide(); // Ocultar la tabla
                            $("#descripcion-row").hide(); // Ocultar el formulario de descripción
                            $("#no-results-message").show(); // Mostrar el mensaje de no resultados
                            $("#register-button").show();
                            console.log(mantenimiento);
                        } else {

                            // Llenar la tabla con los datos del mantenimiento
                            llenarTabla(mantenimiento);
                            // Habilitar el campo de descripción
                            $("#descripcion").prop("disabled", false);
                            $("#register-button").hide();
                            console.log(mantenimiento);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error en la solicitud AJAX:", error);
                    }
                });
            });

            // Validar el campo de descripción antes de enviar el formulario
            $("#registro-mantenimiento-form").submit(function (event) {
                if ($("#descripcion").val().trim() === "") {
                    alert("Por favor, ingresa una descripción antes de enviar el formulario.");
                    event.preventDefault(); // Evitar el envío del formulario
                }
            });
        });
        document.addEventListener('DOMContentLoaded', function() {
            const mecanicoSelect = document.getElementById('mecanico');
            const catalogContainer = document.getElementById('catalog-container-mecanico');
            const mecanicosTable = document.getElementById('mecanicosTable');

            mecanicoSelect.addEventListener('change', () => {
                const selectedOption = mecanicoSelect.value;
                const nombreColumn = document.querySelectorAll('#mecanicosTable tbody tr td:first-child');

                nombreColumn.forEach((nombre) => {
                    const row = nombre.closest('tr');
                    const nombreText = nombre.textContent.trim();

                    if (nombreText === selectedOption) {
                        row.style.display = 'table-row';
                    } else {
                        row.style.display = 'none';
                    }
                });

                catalogContainer.style.display = 'block';
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#categoria").change(function () {
                var selectedCategoria = $(this).val();
                var paqueteSelect = $("#paquete");
                paqueteSelect.empty();
                paqueteSelect.append($("<option>").text("Elige un paquete").attr("disabled", "true").attr("selected", "true"));

                // Realizar una petición AJAX para obtener los paquetes basados en la categoría seleccionada
                $.ajax({
                    type: "GET",
                    url: "MantenimientoServlet?tipo=categoria", // Reemplaza con la URL de tu servlet
                    data: { categoria: selectedCategoria },
                    dataType: "json",
                    success: function (paquetesList) {
                        $.each(paquetesList, function(index, paquete) {
                            paqueteSelect.append($("<option>").attr("value", paquete).text(paquete));
                        });
                    },
                    error: function (xhr, status, error) {
                        console.error("Error en la solicitud AJAX:", error);
                    }
                });
            });
            $("#paquete").change(function () {
                var selectedPaquete = $(this).val();
                var precioInput = $("#precioP");

                // Realizar una petición AJAX para obtener el precio del paquete seleccionado
                $.ajax({
                    type: "GET",
                    url: "MantenimientoServlet?tipo=paquete", // Reemplaza con la URL adecuada para obtener el precio
                    data: { paquete: selectedPaquete },
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        var precio = data.precio; // Extraer el valor de precio del objeto JSON
                        precioInput.val(precio); // Establecer el valor del campo de precio
                    },
                    error: function (xhr, status, error) {
                        console.error("Error en la solicitud AJAX:", error);
                    }
                });
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $("#registro-mantenimiento-form").submit(function(event) {
                event.preventDefault();

                // Obtener valores de los elementos
                var categoria = $("#categoria").val();
                var paquete = $("#paquete").val();
                var descripcion = $("#descripcion").val();
                var nombreCorreoCelda = $(".correo-celda").text();
                var mecanico =$("#mecanico").val();
                var fecha = $("#fecha").val();
                var idMecanico = $("#mecanico option:selected").data("id");
                var total = $("#precioP").val();
                console.log(categoria,paquete,descripcion,nombreCorreoCelda,mecanico,fecha,idMecanico,total)

                // Ejecutar solicitud Ajax
                $.ajax({
                    type: "POST",
                    url: "MantenimientoServlet",
                    data: {
                        categoria: categoria,
                        paquete: paquete,
                        descripcion: descripcion,
                        nombreCorreoCelda: nombreCorreoCelda,
                        mecanico: mecanico,
                        fecha: fecha,
                        idMecanico: idMecanico,
                        precio:total

                    },

                    success: function(response) {
                        if (response.includes("correctamente")) {
                            // Muestra una ventana emergente de éxito
                            Swal.fire({
                                icon: 'success',
                                title: 'Éxito',
                                text: response,
                                onClose: function() {
                                    // Restablecer el formulario después de cerrar la ventana emergente
                                    document.getElementById('registro-mantenimiento-form').reset();
                                }
                            });
                        } else {
                            // Muestra una ventana emergente de error
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: response
                            });
                        }

                    },
                    error: function(xhr, status, error) {
                        console.error("Error en la solicitud Ajax registro :", error);
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container my-3">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h2>Registro de mantenimiento</h2>
            <nav>
                <a href="Recepcionista.jsp" class="nav_link">Regresar</a>
            </nav>
        </div>
        <!-- Parte 1 -->
        <form id="registro-mantenimiento-form">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="search-container">
                            <i class="fas fa-search"></i>
                            <input type="text" id="search-input" placeholder="Buscar usuario" required>
                            <button type="button" id="search-button">Aceptar</button>
                            <a href="RegistrarUsuario.html" class="custom-button" id="register-button">Registrar usuario</a>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="catalog-container" id="catalog-container" style="display: none;">
                            <div class="catalog-slider">
                                <table class="catalog-table" id="serviciosTable">
                                    <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Correo</th>
                                        <th>Placa de vehiculo</th>
                                        <th>Marca</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="form-row" id="descripcion-row" style="display: none; margin-left: 18px;">
                            <div class="form-group col-md-11">
                                <label for="descripcion">Descripcion vehiculo</label>
                                <input type="text" class="form-control" id="descripcion" required>
                            </div>
                        </div>

                        <div id="no-results-message" class="message-box" style="display: none;">
                            Sin datos
                        </div>
                    </div>

                </div>
            </div>
            <!-- Parte 2 -->
            <div class="card-body">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="mecanico">Mecanicos</label>
                        <select class="form-control" id="mecanico" name="mecanico" required>
                            <option value="" selected disabled>Elige una opción</option>
                            <c:forEach items="${mecanicosList}" var="mecanico">
                                <option data-id="${mecanico.id_usuario}" data-nombre="${mecanico.nombre} ${mecanico.apellido1}">
                                        ${mecanico.nombre} ${mecanico.apellido1}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-8">
                        <div class="catalog-container" id="catalog-container-mecanico" style="display: none;">
                            <div class="catalog-slider">
                                <table class="catalog-table" id="mecanicosTable">
                                    <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Correo</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${mecanicosList}" var="mecanico" varStatus="status">
                                        <tr>
                                            <td>${mecanico.nombre} ${mecanico.apellido1}</td>
                                            <td>${mecanico.correo}</td>
                                            <td> <input value="${mecanico.id_usuario}" name="id_mecanico" id="id_mecanico" type="hidden"> </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">

                    <div class="form-group col-md-3">
                        <label for="fecha">Inicio de mantenimiento</label>
                        <input type="date" class="form-control" id="fecha" required name="fecha">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="categoria">Categoria</label>
                        <select class="form-control" id="categoria" name="categoria" required>
                            <option value="" selected disabled>Elige una opción</option>
                            <option value="bronce">Categoria Bronce</option>
                            <option value="plata">Categoria Plata</option>
                            <option value="oro">Categoria Oro</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="paquete">Paquete</label>
                        <select class="form-control" id="paquete"  name="paquete" required>
                            <option  selected disabled>Elige una opción</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="precioP">Precio del paquete</label>
                        <input type="text" class="form-control" id="precioP" name="precioP" disabled>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="col-12 d-flex justify-content-center">
                    <input type="submit" value="Iniciar mantenimiento" class="btn btn-primary">
                </div>
            </div>
        </form>
        <br>
    </div>
</div>
</body>
</html>
