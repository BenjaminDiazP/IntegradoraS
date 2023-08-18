<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Error 404 - Página no encontrada</title>
  <link rel="icon" href="assets/img/imagesPaginaPrincipal/logo.ico">
  <style>
    html, body{
      margin: 0;
      padding: 0;
      text-align: center;
      font-family: sans-serif;
      background-color: #F5F5F5;  /* Cambiado a un gris claro */
    }

    h1, a{
      margin: 0;
      padding: 0;
      text-decoration: none;
    }

    .section{
      padding: 4rem 2rem;
    }

    .section .error{
      font-size: 150px;
      color: #141E30;
      text-shadow:
              1px 1px 1px #243B55,
              2px 2px 1px #243B55,
              3px 3px 1px #243B55,
              4px 4px 1px #243B55,
              5px 5px 1px #243B55,
              6px 6px 1px #243B55,
              7px 7px 1px #243B55,
              8px 8px 1px #243B55,
              25px 25px 8px rgba(0,0,0, 0.2);
    }

    .page{
      margin: 2rem 0;
      font-size: 20px;
      font-weight: 600;
      color: #444;
    }

    .back-home{
      display: inline-block;
      border: 2px solid #222;
      color: #222;
      text-transform: uppercase;
      font-weight: 600;
      padding: 0.75rem 1rem 0.6rem;
      transition: all 0.2s linear;
      box-shadow: 0 3px 8px rgba(0,0,0, 0.3);
    }
    .back-home:hover{
      background: #222;
      color: #ddd;
    }
  </style>
</head>
<body>
<div class="section">
  <h1 class="error">404</h1>
  <div class="page">Ooops!!! La página que estás buscando no se encuentra</div>
  <a class="back-home" href="index.jsp">Volver a la página principal</a>
</div>
</body>
</html>
