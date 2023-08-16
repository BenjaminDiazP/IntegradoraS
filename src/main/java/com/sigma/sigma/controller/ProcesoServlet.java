package com.sigma.sigma.controller;
import com.sigma.sigma.model.Mantenimiento;
import com.sigma.sigma.utils.SendEmail;

import com.google.gson.JsonObject;

import com.sigma.sigma.model.MantenimientoDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;
@WebServlet(name= "ProcesoServlet", value ="/ProcesoServlet")
public class ProcesoServlet extends HttpServlet {
    MantenimientoDao dao = new MantenimientoDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idMantenimiento = Integer.parseInt(req.getParameter("id_mantenimiento"));
        int porcentaje = Integer.parseInt(req.getParameter("porcentaje"));
        String correoCliente = dao.buscarCorreoCliente(idMantenimiento);
        List <Mantenimiento> detalles = dao.oneMantenimiento(idMantenimiento);

        if(porcentaje==100){
            SendEmail mail = new SendEmail();
            try {
                mail.sendEmail(
                        correoCliente,
                        "¡Mantenimiento completado!\n\n",
                        "El mantenimiento con numero de serie " + detalles.get(0).getNoSerie() + " ha alcanzado el 100% de progreso.\n" +
                                "\"Detalles del mantenimiento:\\n\"" +
                                "\"Fecha de inicio: " + detalles.get(0).getFechaInicio() + "\n" +
                                "\"Fecha de finalización: " + detalles.get(0).getFechaFin() + "\n" +
                                "Marca: " + detalles.get(0).getMarca() + "\\n" +
                                "Placas: " + detalles.get(0).getPlacas() + "\\n" +
                                "Descripcion: " + detalles.get(0).getDescripcion() + "\\n"



                        ,
                        new File(
                                req.getSession().
                                        getServletContext().
                                        getResource("/assets/img/imagesPaginaPrincipal/logo.png").
                                        toURI()));
            } catch (URISyntaxException e) {
                throw new RuntimeException(e);
            }
        }

        System.out.println(idMantenimiento);
        System.out.println(porcentaje);
        dao.actualizarProceso(idMantenimiento, porcentaje);
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonResponse.toString());

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonObject jsonResponse = new JsonObject();
        try {
            int idMantenimiento = Integer.parseInt(req.getParameter("id_mantenimiento"));

            int porcentaje = dao.obtenerPorcenje(idMantenimiento);
            System.out.println(porcentaje);
            if (porcentaje >= 0) {
                jsonResponse.addProperty("status", "success");
                jsonResponse.addProperty("porcentaje", porcentaje);
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "No se pudo obtener el porcentaje");
            }
        } catch (NumberFormatException e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "ID de mantenimiento inválido");
        } catch (Exception e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Ocurrió un error al procesar la solicitud");
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonResponse.toString());
    }
}
