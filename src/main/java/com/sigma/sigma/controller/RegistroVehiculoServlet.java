package com.sigma.sigma.controller;


import com.sigma.sigma.model.*;

import javax.print.attribute.standard.PresentationDirection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
@WebServlet(name = "RegistroVehiculoServlet", value = "/RegistroVehiculoServlet")
public class RegistroVehiculoServlet extends HttpServlet {
    private Part imagen;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String accion = req.getParameter("accion");
        String noserie = req.getParameter("noSerie");
        String marca = req.getParameter("marca");
        String color = req.getParameter("color");
        String placas = req.getParameter("placas");
        String tipoCombustible  = req.getParameter("tipoCombustible");
        String tipoTransmision = req.getParameter("tipoTransmision");
        String noMotor = req.getParameter("noMotor");
        String tipo= req.getParameter("tipo");
        String fechaRegistro= req.getParameter("fecharegistro");
        if(accion.equals("Agregar vehiculo")){
            int modelo = Integer.parseInt(req.getParameter("modelo"));
            try {
                int id_cliente = Integer.parseInt(req.getParameter("id_cliente"));
                System.out.println(id_cliente);
                imagen = req.getPart("imagen");
                InputStream imageBytes = imagen.getInputStream();
                RegistroVehiculoDao dao = new RegistroVehiculoDao();
                boolean resultado=  dao.insertVehiculo(new Vehiculo(noserie,id_cliente,marca,modelo,color,tipoCombustible,placas,tipoTransmision,noMotor,tipo,fechaRegistro), imageBytes);
                if(resultado){
                    List<Vehiculo> listaVehiculo = dao.getAllVehiculos();
                    req.getSession().setAttribute("listaVehiculo", listaVehiculo);
                    req.getSession().setAttribute("mensajeExito", "Registro Exitoso");
                    resp.sendRedirect("RegistroVehiculoServlet?tipo=Vehiculo");
                }
            }catch (Exception e) {
                req.getSession().setAttribute("mensajeError", e);
                resp.sendRedirect("RegistroVehiculoServlet?tipo=Vehiculo&mensaje=Error");
            }


        }else if (accion.equals("Cambiar Estado")) {
            System.out.println("Entro a cambiar estado");
            RegistroVehiculoDao dao = new RegistroVehiculoDao();
            System.out.println(noserie);
            int estado = dao.BuscarEstadoVehiculo(noserie);
            System.out.println(estado);
            if (estado == 1) {
                dao.cambiarEstadoVehiculo(noserie);
            } else if (estado == 0) {
                dao.cambiarEstadoVehiculo1(noserie);
            }
            resp.sendRedirect("RegistroVehiculoServlet?tipo=Vehiculo");

        }else if (accion.equals("Modificar Vehiculo")) {
            int modelo = Integer.parseInt(req.getParameter("modelo"));
            Vehiculo Veh = new Vehiculo(noserie,marca,modelo,color,placas,tipoCombustible,tipoTransmision,noMotor,tipo);
            RegistroVehiculoDao dao = new RegistroVehiculoDao();
            dao.UpdateVehiculo(Veh);
            resp.sendRedirect("RegistroVehiculoServlet?tipo=Vehiculo");
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RegistroVehiculoDao dao = new RegistroVehiculoDao();
        String tipo = req.getParameter("tipo");
        String mensaje = req.getParameter("Error");
        if(tipo.equals("Vehiculo")){
            System.out.println("entro aqui para mostrar los vehiculos");
            List<Vehiculo> listaVehiculo = dao.getAllVehiculos();
            req.getSession().setAttribute("listaVehiculo", listaVehiculo);
            req.getRequestDispatcher("RegistrarAuto.jsp").forward(req,resp);

        }else if(tipo.equals("Vehiculo") && mensaje.equals("Error")){
            System.out.println("entro aqui para mostrar los vehiculos");
            req.getSession().setAttribute("mensajeError","");
            List<Vehiculo> listaVehiculo = dao.getAllVehiculos();
            req.getSession().setAttribute("listaVehiculo", listaVehiculo);
            req.getRequestDispatcher("RegistrarAuto.jsp").forward(req,resp);
        }


    }




}
