package com.sigma.sigma.controller;

import com.google.gson.*;

import com.google.protobuf.TextFormat;
import com.sigma.sigma.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name= "VentasServlet", value ="/VentasServlet")
public class VentasServlet extends HttpServlet {
    RegistroArticulosDao dao = new RegistroArticulosDao();
    MantenimientoDao dao1 = new MantenimientoDao();
    DetallesVentaDao da2 = new DetallesVentaDao();
    TablasVentasMPDao dao3 = new TablasVentasMPDao();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productosJson = req.getParameter("productos");
        String correo = req.getParameter("correo");
        String tipo = req.getParameter("tipo");
        String totalStr = req.getParameter("total");

        System.out.println("Correo: " + correo);
        System.out.println("Total: " + totalStr);
        System.out.println("Tipo: " + tipo);

        if (productosJson == null || productosJson.isEmpty()) {
            System.out.println("No se han recibido productos.");
            return;
        }

        ArrayList<String> listaPedido = new ArrayList<>();

        JsonParser parser = new JsonParser();
        try {
            JsonArray productosArray = (JsonArray) parser.parse(productosJson);
            int idEmpleado = (Integer) req.getSession().getAttribute("id_empleado");
            VentasDao ventasDao = new VentasDao();

           boolean idPedido = ventasDao.insertarPedido(idEmpleado, tipo);
           int id = 0;
           if (idPedido){
               id = ventasDao.ultimoId();
           }
            for (JsonElement elem : productosArray) {

                JsonObject productoObj = elem.getAsJsonObject();
                JsonElement nombre = productoObj.get("nombre");
                JsonElement precio = productoObj.get("precio");
                JsonElement categoria = productoObj.get("categoria");
                System.out.println("Nombre: " + nombre + ", Precio: " + precio + ", Categoria: " + categoria);

                int id_producto = ventasDao.buscarIdxNombre(String.valueOf(nombre));
                int id_cliente = ventasDao.buscarIdPorCorreo(correo);
                Float prec = Float.valueOf(String.valueOf(precio));

                boolean exito = ventasDao.insertar(id_cliente, id_producto, prec, id);
            }
                // Responder con un mensaje de éxito
                resp.setContentType("text/plain");
                resp.getWriter().write("Productos registrados exitosamente.");
            } catch(Exception e){
                System.err.println("Error al procesar el JSON o realizar la inserción: " + e.getMessage());
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en el servidor");
            }


        }



        @Override
        protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String tipo = req.getParameter("tipo");
            if (tipo.equals("inicio")) {
                List<Articulo> ListaArticulos = dao.getAllArticulos();
                req.getSession().setAttribute("ListaArticulos", ListaArticulos);
                req.getRequestDispatcher("Venta.jsp").forward(req, resp);
            } else if (tipo.equals("query")) {
                System.out.println("Hola uwu frefire");
                String query = req.getParameter("query");
                Mantenimiento man = dao1.realizarBusquedaEnLaBaseDeDatos(query);
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write(new Gson().toJson(man));
            }


        }

    }

