package com.sigma.sigma.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.sigma.sigma.model.Paquete;
import com.sigma.sigma.model.PaquetesDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
@WebServlet(name = "RegistroPaquetesServlet", value = "/RegistroPaquetesServlet")
public class RegistroPaquetesServlet extends HttpServlet {
    PaquetesDao dao = new PaquetesDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String nombre = req.getParameter("nombreP");
        String categoria = req.getParameter("categoria");
        Double precio = Double.valueOf(req.getParameter("precioP"));

        Enumeration<String> parameterNames = req.getParameterNames();
        List<String> elementosSeleccionados = new ArrayList<>();

        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("articulo_")) {
                elementosSeleccionados.add(req.getParameter(paramName));
            }
        }

        Paquete paquete = new Paquete(nombre,precio , categoria, elementosSeleccionados);
        // Realizar las operaciones necesarias con la instancia del paquete (guardar en BD, etc.)
        boolean exito = dao.registrarPaquete(paquete);
        // Crear el objeto JSON de respuesta
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("nombre", paquete.getNombre());
        jsonResponse.addProperty("precio", paquete.getPrecio());
        jsonResponse.addProperty("categoria", paquete.getCategoria());

        JsonArray elementosArray = new JsonArray();
        for (String elemento : paquete.getElementos()) {
            elementosArray.add(new JsonPrimitive(elemento));
        }
        jsonResponse.add("elementos", elementosArray);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");


        resp.getWriter().write(jsonResponse.toString());


    }



    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Paquete> paquetes = dao.getAllPaquetes();
        req.setAttribute("paquetes", paquetes);
        req.getRequestDispatcher("Paquetes.jsp").forward(req,resp);


    }
}
