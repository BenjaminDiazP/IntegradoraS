package com.sigma.sigma.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.sigma.sigma.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet(name = "MantenimientoServlet", value = "/MantenimientoServlet")
public class MantenimientoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MantenimientoDao dao = new MantenimientoDao();
        System.out.println("Hola");
        String correo = req.getParameter("nombreCorreoCelda");
        String descripcion = req.getParameter("descripcion");
        String mecanico = req.getParameter("mecanico");
        String paquete = req.getParameter("paquete");
        String categoria = req.getParameter("categoria");
        String fecha = req.getParameter("fecha");
        int idMecanico = Integer.parseInt(req.getParameter("idMecanico"));
        Float total = Float.parseFloat(req.getParameter("precio"));
      int idPaquete = dao.buscarIdPaquete(paquete);
       String noSerie = dao.buscarNoSerie(correo);
        System.out.println(correo);
        System.out.println(descripcion);
        System.out.println(mecanico);
        System.out.println(paquete);
        System.out.println(categoria);
        System.out.println(fecha);
        System.out.println(idMecanico);
        System.out.println(total);

        System.out.println(idPaquete);
        System.out.println(noSerie);
        boolean insert = false;
        try {
            String fechaFin = "";
            int proceso = 0;
//
            insert = false;
            if ((idPaquete > 0) && (noSerie != "")) {
                insert = dao.insertarMantenimiento(new Mantenimiento(noSerie, idMecanico, idPaquete, fecha, fechaFin,
                        total, categoria, proceso, descripcion));
            }
        } catch (Exception e) {
            // Captura y maneja cualquier excepción que ocurra
            e.printStackTrace(); // Imprime la traza de la excepción (puedes personalizar esto)
            // ... otras acciones de manejo de errores ...
        }

        String responseMessage = insert ? "Mantenimiento registrado correctamente." : "No se pudo registrar el mantenimiento.";

// Configurar la respuesta al cliente
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(responseMessage);


    }




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String tipo = req.getParameter("tipo");
        MantenimientoDao dao = new MantenimientoDao();

        if(tipo.equals("inicio")){
            List<Usuario> mecanicoList = dao.obtenerMecanicos();
            req.getSession().setAttribute("mecanicosList", mecanicoList);
            req.getRequestDispatcher("Mantenimiento.jsp").forward(req,resp);
        } else if (tipo.equals("query")) {
            String query = req.getParameter("query");
            Mantenimiento man  = dao.realizarBusquedaEnLaBaseDeDatos(query);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(new Gson().toJson(man));

        } else if (tipo.equals("categoria")) {
            String selectedCategoria = req.getParameter("categoria");
            // Aquí deberías implementar el código para obtener los paquetes de la base de datos
            List<String> paquetesList = dao.obtenerPaquetesDesdeBD(selectedCategoria);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(new Gson().toJson(paquetesList));

        } else if (tipo.equals("paquete")) {
            String selectedPaquete = req.getParameter("paquete");
            double precio = dao.obtenerPrecioDesdeBD(selectedPaquete);
            String jsonResponse = "{\"precio\": " + precio + "}";
            // Enviar la respuesta al cliente
            PrintWriter out = resp.getWriter();
            out.print(jsonResponse);
            out.flush();
        }

    }
    private String convertirAFormatoJson(List<String> paquetes) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.writeValueAsString(paquetes);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "[]"; // En caso de error, devuelve un arreglo JSON vacío
        }
    }


}
