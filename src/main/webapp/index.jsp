<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIGMA</title>
    <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.png">
    <link rel="stylesheet" href="assets/css/cssPaginaPrincipal/estilos.css">
    <link rel="JavaScript" href="assets/js/javascriptPaginaPrincipal/scripts.js">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>
<body>

<style>
    a {
        text-decoration: none;
    }
</style>

<header class="header">

    <div class="menu container">
        <img src="assets/img/imagesPaginaPrincipal/logo.png" class="logo">
        <input type="checkbox" id="menu"/>
        <label for="menu">
            <img src= "assets/img/imagesPaginaPrincipal/responsivemenu.png" class="menu-icono" alt="">
        </label>
        <nav class="navbar">
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Servicios</a></li>
                <li><a href="#">Productos</a></li>
                <li><a href="InicioSesion.jsp">Iniciar Sesion</a></li>
            </ul>
        </nav>
    </div>
    <!-- Aqui adelante vamos a ingresar el contenido del header en un contenedor -->
    <div class="header-content container">
        <br>
        <h1>Sistema Gestor de Mantenimiento Automotriz</h1>
        <p>
            ¡Bienvenidos a Sigma, el gestor de automóviles líder en el mercado!
            Nuestra plataforma está diseñada para simplificar y optimizar la gestión de tus
            automóviles, ofreciéndote herramientas eficientes para controlar todos los aspectos
            relacionados con su mantenimiento, seguridad y documentación.
        </p>
        <a href="#" class="btn-1">Informacion</a>
    </div>
</header>
<!-- Aqui termina la parte del header y abrimos una nueva seccion -->
<section class="paquetes">
    <div class="paquetes-content container">

        <h2>Los diferentes tipos de paquetes</h2>
        <p class="txt-p">
            Contamos con diferentes tipos de paquetes otorgandote la posibilidad
            de escoger el que mas se acomode a tus necesidades.
        </p>

        <div class="paquetes-group">
            <div class="paquetes-1">
                <img src="assets/img/imagesPaginaPrincipal/Paquete1.jpg" alt="">
                <h3>Paquete Bronce</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                    Illo placeat eligendi cumque mollitia veritatis? Voluptatibus
                    deserunt, debitis, tempore tempora temporibus architecto
                    quis impedit, pariatur suscipit facere magnam similique ducimus nesciunt!
                </p>
            </div>
            <div class="paquetes-1">
                <img src="assets/img/imagesPaginaPrincipal/paquete2.png" alt="">
                <h3>Paquete Plata</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                    Illo placeat eligendi cumque mollitia veritatis? Voluptatibus
                    deserunt, debitis, tempore tempora temporibus architecto
                    quis impedit, pariatur suscipit facere magnam similique ducimus nesciunt!
                </p>
            </div>
            <div class="paquetes-1">
                <img src="assets/img/imagesPaginaPrincipal/Paquete3.jpeg" alt="">
                <h3>Paquete Oro</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                    Illo placeat eligendi cumque mollitia veritatis? Voluptatibus
                    deserunt, debitis, tempore tempora temporibus architecto
                    quis impedit, pariatur suscipit facere magnam similique ducimus nesciunt!
                </p>
            </div>
        </div>
        <a href="#" class="btn-1">Informacion</a>
    </div>
</section>
<!-- Aqui termina la seccion y inicia la nueva en donde vendra lo pricipal por eso
le llamaremos main a esta nueva seccion -->
<main class="compromisos">
    <div class="compromisos-content container">
        <h2>Nuestros compromisos</h2>
        <div class="compromisos-group">
            <div class="compromisos-1">
                <img src="assets/img/imagesPaginaPrincipal/cronometro.png" alt="">
                <h3>Puntualidad </h3>
            </div>
            <div class="compromisos-1">
                <img src="assets/img/imagesPaginaPrincipal/marca-de-verificacion.png" alt="">
                <h3>confianza y seguridad</h3>
            </div>
            <div class="compromisos-1">
                <img src="assets/img/imagesPaginaPrincipal/profesionalismo.png" alt="">
                <h3>Profecionalidad</h3>
            </div>
        </div>
        <p>
            En SIGMA nos comprometemos a mantener el tu automovil
            seguro durante el tiempo en nuestras instalaciones, una entrega Puntual
            y contamos con profecionales altamente capacitados brindandote una mayor seguridad
        </p>
        <a href="#" class="btn-1">Informacion</a>
    </div>
</main>

<!-- creamos otras 3 secciones  -->

<section class="general">
    <div class="general-1">
        <h2>Objetivo</h2>
        <p>
            Nuestro objetivo es desarrollar y ofrecer un sistema gestor de automóviles altamente eficiente y completo
            que simplifique y optimice la gestión de flotas de vehículos.
            Nos esforzamos por brindar a nuestros clientes una solución integral que les permita supervisar, controlar y administrar
            sus automóviles de manera eficaz, mejorando así la productividad, la rentabilidad y la seguridad de sus operaciones.
        </p>
    </div>
    <div class="general-2"></div>
</section>

<!-- aqui invertimos los divs -->

<section class="general">
    <div class="general-3"></div>
    <div class="general-1">
        <h2>visión</h2>
        <p>
            Nuestra visión es convertirnos en el principal referente en la industria de la gestión de automóviles, proporcionando un sistema
            innovador y confiable que satisfaga las necesidades y los desafíos cambiantes del mercado. Nos esforzamos
            por ofrecer tecnología de vanguardia que maximice la eficiencia operativa, reduzca los costos y promueva
            prácticas sostenibles en el manejo de flotas automotrices.
        </p>
    </div>
</section>

<!-- aqui invertimos los divs -->

<section class="general">
    <div class="general-1">
        <h2>Misión</h2>
        <p>
            Nuestra misión es proporcionar un sistema gestor de automóviles intuitivo,
            fácil de usar y altamente personalizable que permita a nuestros clientes tener un control
            total sobre sus flotas de vehículos. Nos esforzamos por ofrecer una plataforma centralizada que
            abarque desde el seguimiento y la supervisión en tiempo real hasta la generación de informes detallados
            y el análisis de datos.
        </p>
    </div>
    <div class="general-4"></div>
</section>

<!-- ahora vamos a poner la seccion de blog -->

<section class="blog container">
    <h2>Blog</h2>
    <p>sit amet consectetur adipisicing elit.</p>
    <div class="blog-content">
        <div class="blog-1">
            <img src="assets/img/imagesPaginaPrincipal/volante.jpg" alt="">
            <h3>NUEVOS VOLANTES MULTIFUNCIONALES</h3>
            <p>
                Son el prototipo de volante por excelencia para los coches modernos. Los multifuncionales, más allá de la forma
                que tengan, disponen de una serie de botones y mandos que se diseñan para controlar diferentes funciones del
                vehículo, como puede ser la radio o las llamadas telefónicas en apoyo a la funcionalidad de manos libres.
                Su principal aval es la seguridad que aportan ya que el conductor no necesita apartar las manos del volante
                para ejecutar las funciones ya citadas. Adquierelos hoy mismo
            </p>
        </div>
        <div class="blog-1">
            <img src="assets/img/imagesPaginaPrincipal/Motorv6.jpg" alt="">
            <h3>NUEVO MOTOR V6</h3>
            <p>
                En comparación con un motor de cuatro cilindros, los motores V6 ofrecen más potencia y
                funcionan con mayor suavidad. El ahorro de combustible es uno de los mayores beneficios de adoptar
                un motor V6. Por último, los motores V6 pueden proporcionar más estabilidad y mejor manejo que sus homólogos V8. Adquierelos hoy mismo

            </p>
        </div>
        <div class="blog-1">
            <img src="assets/img/imagesPaginaPrincipal/rines.jpg" alt="">
            <h3>NUEVOS RINES DE ACERO</h3>
            <p>
                Estos son los rines de estándar internacional. Algunas veces son hasta 3 veces más pesados que los de
                aluminio pero también son más duraderos, por lo que son considerados “de uso rudo” y mayormente utilizados en
                vehículos pesados o de trabajo! Adquierelos hoy mismo
            </p>
        </div>
    </div>
    <a href="#" class="btn-1">Informacion</a>
</section>

<!-- creamos el footer "La parte final de las secciones" -->

<footer class="footer">
    <div class="footer-content container ">
        <div class="link">
            <h3>Contactos</h3>
            <ul>
                <li><a href="https://instagram.com/sigma_ac?igshid=MzRlODBiNWFlZA==">Instagram</a></li>
                <li><a href="tel:987123789">Llámanos al +52 987123789</a></li>

            </ul>
        </div>

    </div>
</footer>


</body>
</html>