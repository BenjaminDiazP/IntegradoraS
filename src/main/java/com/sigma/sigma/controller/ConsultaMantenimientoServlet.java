package com.sigma.sigma.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.sigma.sigma.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name= "ConsultaMantenimientoServlet", value ="/ConsultaMantenimientoServlet")
public class ConsultaMantenimientoServlet extends HttpServlet {
    RegistroArticulosDao dao2 = new RegistroArticulosDao();
    PaquetesDao dao = new PaquetesDao();
    MantenimientoDao dao1 = new MantenimientoDao();
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idMantenimiento = Integer.parseInt(req.getParameter("id_mantenimiento"));
        String articulosParam = req.getParameter("articulos");
        String[] nombresArticulos = new Gson().fromJson(articulosParam, String[].class);

        dao1.agregarArticulosAMantenimiento(idMantenimiento, nombresArticulos);

        List<Articulo> detallesArticulos = dao1.obtenerDetallesArticulos(idMantenimiento);
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");

        JsonArray detallesArray = new JsonArray();
        for (Articulo articulo : detallesArticulos) {
            JsonObject detalle = new JsonObject();
            detalle.addProperty("nombre", articulo.getNombre());
            detalle.addProperty("categoria", articulo.getCategoria());
            detalle.addProperty("precio", articulo.getCosto());
            // Agregar más propiedades según los detalles que quieras mostrar
            detallesArray.add(detalle);
        }
        jsonResponse.add("detalles", detallesArray);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        resp.getWriter().write(jsonResponse.toString());
    }



    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        if (tipo.equals("listar")){
            int idMantenimiento = Integer.parseInt(req.getParameter("id_mantenimiento"));
            int id_mantenimiento = Integer.parseInt(req.getParameter("id_mantenimiento"));
            List<Mantenimiento> oneMantenimiento = dao1.oneMantenimiento(id_mantenimiento);
            List<Articulo> listaProductos = dao2.getAllArticulosProductos();
            List<Articulo> listaServicios = dao2.getAllArticulosServicios();
            List<Articulo> detallesArticulos = dao1.obtenerDetallesArticulos(idMantenimiento);
            System.out.println(listaServicios);
            req.getSession().setAttribute("listaProductos", listaProductos);
            req.getSession().setAttribute("listaServicios", listaServicios);
            req.getSession().setAttribute("oneMantenimiento",oneMantenimiento);
            req.getSession().setAttribute("listaExtras", detallesArticulos);
            req.getRequestDispatcher("ProductosExtra.jsp").forward(req,resp);
        }else if (tipo.equals("inicio")){
            Integer idEmpleado = (Integer) req.getSession().getAttribute("id_empleado");
            System.out.println(idEmpleado);
            List<Mantenimiento> ListaMantenimiento = dao1.mostrarMantenimiento(idEmpleado);
            req.getSession().setAttribute("registrosDeMantenimiento", ListaMantenimiento);
            req.getRequestDispatcher("ConsultaMantenimiento.jsp").forward(req,resp);
        }else if(tipo.equals("historial")){
            Integer idEmpleado = (Integer) req.getSession().getAttribute("id_empleado");
            List<Mantenimiento> listaMantenimiento = dao1.mostrarMantenimiento(idEmpleado);
            for (Mantenimiento mantenimiento : listaMantenimiento) {
                List<ProductoExtra> listaProductosExtra = dao1.obtenerProductosExtraPorMantenimiento(mantenimiento.getId_mantenimiento());
                mantenimiento.setListaProductosExtra(listaProductosExtra);
            }
            req.getSession().setAttribute("registrosDeMantenimiento", listaMantenimiento);
            req.getRequestDispatcher("HistorialMantenimientosM.jsp").forward(req, resp);
        }

    }
}