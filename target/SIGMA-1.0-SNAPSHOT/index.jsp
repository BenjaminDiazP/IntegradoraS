<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIGMA</title>
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.png">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

</head>

<body>

<style>

    .navbar a {
        text-decoration: none;
        color: white;
    }

    .main-header {
        background-color: #000000;
        color: white;
        padding: 20px 0;
        text-align: center;
    }

    .main-header p {
        margin: 0;
        font-size: 24px;
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    .navbar {
        display: flex;
        justify-content: flex-end;
        padding: 10px 20px;
        background-color: #000000;
    }

    .nav-list {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .nav-item {
        margin: 0 15px;
    }

    .nav-item a {
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 18px;
    }

    .nav-item a:hover {
        color: #e4e4e4;
    }

    .paquetes-content {
        text-align: center;
        padding: 30px 0;
    }

    .paquetes-group {
        display: flex;
        justify-content: space-between;
        margin-bottom: 40px;
    }

    .paquetes-1 {
        flex: 1;
    }

    .paquetes-1 img {
        max-width: 100%;
        height: auto;
    }

    .image-container {
        position: relative;
        display: inline-block;
        margin: 20px;
        overflow: hidden;
    }

    .image-container img {
        width: 600px;
        height: 300px;
        transition: transform 0.3s ease;
    }

    .image-container:hover img {
        transform: scale(1.1);
    }

    .image-overlay {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        color: white;
        padding: 20px;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .image-container:hover .image-overlay {
        opacity: 1;
        bottom: 0;
    }

    .image-overlay p {
        font-size: 18px;
    }

    .paquetes {
        padding: 1%;
        background-color: #e1e2e6;
        position: relative;

    }
    .paquetes-content {
        text-align: center;
    }

    .paquetes-content h2 {
        font-size: 200%;
        line-height: 40px;
        color: #323337;
        text-transform: uppercase;
        margin-bottom: 15px;
    }

    .txt-p {
        text-align: justify;
        font-size: 16px;
        color: #414247;
        margin-bottom: 35px;
    }

    .paquetes-group {
        display: flex;
        justify-content: space-between;
        margin-bottom: 50px;
        flex-wrap: wrap;
    }

    .paquetes-1 {
        padding: 2%;
        flex: 1 1 200px;
    }


    .compromisos {
        background-image: linear-gradient(rgba(0, 0, 0, 0.7),
        rgba(0, 0, 0, 0.7)),
        url(assets/img/imagesPaginaPrincipal/Compromisos.jpg);
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
        padding: 5%;
    }

    .compromisos-content {
        text-align: center;
    }

    .compromisos-content h2 {
        font-size: 180%;
        line-height: 50px;
        color: #f9fafc;
        text-transform: uppercase;
        margin-bottom: 50px;
    }

    .compromisos-content p {
        font-size: 16px;
        color: #c5c5c5;
        margin-bottom: 50px;
    }

    .compromisos-group {
        display: flex;
        justify-content: space-between;
        margin-bottom: 50px;
        flex-wrap: wrap;
    }

    .compromisos-1 {
        padding: 2%;
        flex: 1 1 200px;
    }

    .compromisos-1 img {
        width: 40px;
        margin-bottom: 15px;
    }

    .compromisos-1 h3 {
        color: #eaccb3;
        font-size: 18px;
    }

    .container {
        padding: 20px;
    }

    .highlight-image {
        position: relative;
        display: inline-block;
        overflow: hidden;
        border: 3px solid #3498db;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
        transition: transform 0.3s ease;
    }

    .highlight-image img {
        width: 500px;
        height: 300px;
        display: block;
        transition: opacity 0.3s ease;
    }

    .highlight-image:hover {
        transform: scale(1.05);
    }

    .highlight-image:hover img {
        opacity: 0.8;
    }

    .separator {
        text-align: center;
        padding: 30px 0;
        position: relative;
    }

    .separator-line {
        width: 900px;
        height: 3px;
        background-color: #FFA500;
        margin: 0 auto 10px;
    }

    .separator-text {
        font-size: 18px;
        color: #333;
        margin-bottom: 10px;
    }

    .carousel-item img {
        max-width: 80%;
        margin: 0 auto;
        border: 4px solid #adb5bd;
        border-radius: 5px;
        transition: transform 0.3s ease;
    }

    .carousel-item:hover img {
        transform: scale(1.05);
    }

    .carousel-caption {
        background-color: rgba(0, 0, 0, 0.7);
        padding: 10px;
        border-radius: 5px;
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        margin: auto;
        color: #fff;
        width: 85%;
        max-width: 870px;
    }

    .footer {
        padding: 2%;
        background-color: #000000;
    }

    .footer-content {
        display: flex;
        justify-content: space-between;
        flex-direction: column;
        text-align: center;
    }

    #footer-links {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-content a {
        color: white;
        text-decoration: none;
    }

    .footer-content a:hover {
        text-decoration: underline;
    }

</style>

<header class="main-header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3 d-flex align-items-center justify-content-start">
                <img src="assets/img/imagesPaginaPrincipal/logo.png" class="logo img" style="width: 150px;">
            </div>
            <div class="col-md-9">
                <nav class="navbar navbar-expand-md">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="InicioSesion.jsp" class="nav-link">Iniciar sesión</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <h2 class="mt-4">SISTEMA GESTOR DE MANTENIMIENTO AUTOMOTRIZ</h2>
    </div>
</header>
<br>

<div class="container">
    <div class="row">
        <div class="col-md-12 mx-auto">
            <h5 class="mt-4">Servicio y mantenimiento de automóviles: obtenga los mejores servicios de mantenimiento de
                un reputado taller de reparación de automóviles</h5>
            <br>
            <img src="assets/img/imagesPaginaPrincipal/objetive.jpg" class="img-fluid">
            <br>
        </div>
    </div>
</div>

<br><br>

<section class="paquetes">
    <div class="paquetes-content container">
        <h3>Descubre Nuestra Variedad de Paquetes</h3>
        <br>
        <p class="txt-p" style="font-size: 18px;">
            Adéntrate en un mundo de posibilidades con nuestras distintas propuestas de paquetes,
            diseñadas meticulosamente para ofrecerte una experiencia a medida. Descubre la elección
            que concuerde perfectamente con tus requisitos y deseos.
        </p>

        <div class="row paquetes-group">
            <div class="col-md-4 col-sm-6 paquetes-1">
                <h4>Categoria Bronce</h4>
                <div class="image-container">
                    <img src="assets/img/imagesPaginaPrincipal/Paquetito1.jpg" alt="">
                    <div class="image-overlay">
                        <p class="image-text">Explora nuestros paquetes de mantenimiento nivel bronce</p>
                    </div>
                </div>
                <p class="txt-p"><br><strong>Mantenimiento Esencial</strong><br>
                    Nuestra categoría de bronce está diseñada para proporcionar un cuidado esencial y sólido a tu vehículo.
                    Ideal para los conductores que desean mantener su automóvil en óptimas condiciones sin sacrificar calidad,
                    a Categoría de Bronce se centra en servicios y productos fundamentales. Esta selección asegura un rendimiento
                    confiable y prolonga la vida útil de tu vehículo de manera confiable.
                </p>
            </div>
            <div class="col-md-4 col-sm-6 paquetes-1">
                <h4>Categoria Plata</h4>
                <div class="image-container">
                    <img src="assets/img/imagesPaginaPrincipal/Paquete3.jpeg" alt="">
                    <div class="image-overlay">
                        <p class="image-text">Explora nuestros paquetes de mantenimiento nivel plata</p>
                    </div>
                </div>
                <p class="txt-p"><br><strong>Mantenimiento Avanzado</strong></br>
                    Diseñada para conductores que buscan lo mejor, nuestra Categoría de Plata ofrece un conjunto
                    amplio de servicios y productos. Esto asegura un rendimiento superior y una experiencia de conducción excepcional.
                    Con énfasis en la prevención y el mantenimiento, la Categoría de Plata logra un equilibrio ideal entre calidad
                    y costo. Un nivel de cuidado completo que tu vehículo merece.
                </p>
            </div>
            <div class="col-md-4 col-sm-6 paquetes-1">
                <h4>Categoria Oro</h4>
                <div class="image-container">
                    <img src="assets/img/imagesPaginaPrincipal/Paquetito3.jpg" alt="">
                    <div class="image-overlay">
                        <p class="image-text">Explora nuestros paquetes de mantenimiento nivel oro</p>
                    </div>
                </div>
                <p class="txt-p"><br><strong>Mantenimiento Premium y Personalizado</strong><br>
                    Nuestra Categoría de Oro es la elección para aquellos conductores que buscan lo mejor. Diseñada para exigentes
                    amantes de los vehículos, esta categoría ofrece un nivel superior de servicios personalizados y productos de
                    calidad premium. Mantén tu vehículo en su estado óptimo y experimenta una conducción excepcional.
                </p>
            </div>
        </div>
    </div>
</section>

<main class="compromisos">
    <div class="compromisos-content container">
        <h2>Nuestros compromisos</h2>
        <div class="row compromisos-group">
            <div class="col-md-4 col-sm-6 compromisos-1">
                <img src="assets/img/imagesPaginaPrincipal/cronometro.png">
                <h2>Puntualidad </h2>
            </div>
            <div class="col-md-4 col-sm-6 compromisos-1">
                <img src="assets/img/imagesPaginaPrincipal/marca-de-verificacion.png">
                <h2>Confianza y Seguridad</h2>
            </div>
            <div class="col-md-4 col-sm-6  compromisos-1">
                <img src="assets/img/imagesPaginaPrincipal/profesionalismo.png">
                <h2>Profesionalidad</h2>
            </div>
        </div>
        <p class="txt-p" style="font-size: 19px;">
            Con SIGMA, nuestro compromiso es garantizar la seguridad de tu automóvil mientras esté en nuestras
            instalaciones. Garantizamos entregas puntuales y contamos con profesionales altamente capacitados que te
            brindarán una mayor tranquilidad.
        </p>
    </div>
</main>

<!-- creamos otras 3 secciones  -->

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2>Objetivo</h2>
            <p class="txt-p" style="font-size: 18px">
                Nuestro objetivo es desarrollar y ofrecer un sistema gestor de automóviles altamente eficiente y completo
                que simplifique y optimice la gestión de flotas de vehículos. Nos esforzamos por brindar a nuestros clientes
                una solución integral que les permita supervisar, controlar y administrar sus automóviles de manera eficaz,
                mejorando así la productividad, la rentabilidad y la seguridad de sus operaciones.
            </p>
        </div>
        <div class="col-md-6">
            <div class="highlight-image">
                <img src="assets/img/imagesPaginaPrincipal/objetivo.jpeg" class="img-fluid">
            </div>
        </div>
        <div class="col-md-6">
            <div class="highlight-image">
                <img src="assets/img/imagesPaginaPrincipal/vision.jpg" class="img-fluid">
            </div>
        </div>
        <div class="col-md-6">
            <br>
            <h2>Visión</h2>
            <p class="txt-p" style="font-size: 18px">
                Nuestra visión es convertirnos en el principal referente en la industria de la gestión de automóviles,
                proporcionando un sistema innovador y confiable que satisfaga las necesidades y los desafíos cambiantes del
                mercado. Nos esforzamos por ofrecer tecnología de vanguardia que maximice la eficiencia operativa, reduzca
                los costos y promueva prácticas sostenibles en el manejo de flotas automotrices.
            </p>
        </div>
        <div class="col-md-6">
            <br>
            <h2>Misión</h2>
            <p class="txt-p" style="font-size: 18px">
                Nuestra misión es proporcionar un sistema gestor de automóviles intuitivo, fácil de usar y altamente
                personalizable que permita a nuestros clientes tener un control total sobre sus flotas de vehículos. Nos
                esforzamos por ofrecer una plataforma centralizada que abarque desde el seguimiento y la supervisión en
                tiempo real hasta la generación de informes detallados y el análisis de datos.
            </p>
        </div>
        <div class="col-md-6">
            <div class="highlight-image">
                <img src="assets/img/imagesPaginaPrincipal/Mision.webp" class="img-fluid">
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="separator d-flex justify-content-center align-items-center flex-column">
                <div class="separator-line w-100"></div>
                <div class="separator-text mt-2 text-center">
                    <p  style="font-size: 20px; line-height: 1.5; color: #333;
                        max-width: 600px; margin: 0 auto;text-align: center;">
                        Explora nuestra última gama de productos añadidos al catálogo,
                        diseñados para mejorar y mantener tu vehículo en óptimas condiciones.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="blog container">
    <div id="imageCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="assets/img/imagesPaginaPrincipal/volante.jpg" class="d-block w-100" alt="Imagen 1">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Nuevos volantes multifuncionales</h3>
                    <p>Diseñados para llevar la experiencia de conducción a un nuevo nivel,
                        estos volantes ofrecen un control completo al alcance de tus manos.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/img/imagesPaginaPrincipal/motor.jpg" class="d-block w-100" alt="Imagen 2">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Nuevo motor TurboDrive 5000</h3>
                    <p>Diseñado con la última tecnología en ingeniería automotriz, este motor ofrece un rendimiento
                        excepcional y una mayor economía de combustible.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/img/imagesPaginaPrincipal/llantas.png" class="d-block w-100" alt="Imagen 4">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Nuevas llantas antiderrapantes</h3>
                    <p>Explora nuestra selección y elige las llantas que se adapten mejor a tu conducción y estilo.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="footer">
    <div class="footer-content container ">
        <div class="contact-links">
            <h3 style="color: white;">Contacto</h3>
            <ul id="footer-links">
                <li><a href="https://instagram.com/sigma_ac?igshid=MzRlODBiNWFlZA==">Síguenos en Instagram</a></li>
                <li><a href="tel:7775012348">Llámanos al +52 1 777 501 2348</a></li>
                <li><a href="mailto:utezsigma@gmail.com">Envíanos un correo electrónico</a></li>
                <li><a href="https://www.google.com/maps/place/18.850283, -99.200693" target="_blank">Visítanos en
                    nuestro local</a></li>
            </ul>
        </div>
    </div>
</footer>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var carousel = new bootstrap.Carousel(document.getElementById('imageCarousel'), {
            interval: 6000
        });
    });
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>