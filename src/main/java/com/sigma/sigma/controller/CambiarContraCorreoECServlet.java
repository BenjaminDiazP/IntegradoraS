package com.sigma.sigma.controller;

import com.sigma.sigma.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CambiarContraCorreoECServlet", value = "/CambiarContraCorreoECServlet")
public class CambiarContraCorreoECServlet  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String accion = req.getParameter("accion");
        String nuevacontrasenia = req.getParameter("nuevacontra");
        String nuevacontraseniac = req.getParameter("nuevacontrac");
        String correo = req.getParameter("correo");
        String rol = req.getParameter("rol");
        String correonuevo = req.getParameter("correonuevo");
        String correonuevoc = req.getParameter("correonuevoc");

        // Cambiar contrasenia  de todos los usuarios
        if (accion.equals("Cambiar contrasenia")) {

            RegistroDao dao = new RegistroDao();
            if (nuevacontrasenia.equals(nuevacontraseniac)) {
                switch (rol) {
                    case "Gerente":
                        System.out.println("Entro a gerente");
                        boolean contraseniacambiadaG = dao.UpdateContraseniaEmpleadoCC(correo,nuevacontraseniac); // me quede aqui en probar cn el gerente me falta probar con los demas usuarios
                        if (contraseniacambiadaG) {
                            System.out.println("Entro aqui para mandar el mensaje de exito");
                            req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                            resp.sendRedirect("Gerente.jsp");
                            break;
                        } else {
                            System.out.println("esta entrando para mandar el error de que no se actualizo la contrasenia");
                            req.getSession().setAttribute("mensajeErrorNoseActualizocontrasenia", "Error al actualizar contrasenia");
                            resp.sendRedirect("Gerente.jsp");
                        }
                        break;

                    case "Recepcionista":
                        boolean contraseniacambiadaR = dao.UpdateContraseniaEmpleadoCC(correo,nuevacontraseniac); //ya lo realize
                        if (contraseniacambiadaR) {
                            System.out.println("Entro aqui para mandar el mensaje de exito");
                            req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                            resp.sendRedirect("Recepcionista.jsp");
                        } else {
                            req.getSession().setAttribute("mensajeErrorNoseActualizocontrasenia", "Error al actualizar contrasenia");
                            resp.sendRedirect("Recepcionista.jsp");
                        }
                        break;

                    case "Mecanico":
                        boolean contraseniacambiadaM = dao.UpdateContraseniaEmpleadoCC(correo,nuevacontraseniac);
                        if (contraseniacambiadaM) {
                            System.out.println("Entro aqui para mandar el mensaje de exito");
                            req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                            resp.sendRedirect("Mecanico.jsp");
                        } else {
                            req.getSession().setAttribute("mensajeErrorNoseActualizocontrasenia", "Error al actualizar contrasenia");
                            resp.sendRedirect("Mecanico.jsp");
                        }
                        break;

                    case "caja":
                        boolean contraseniacambiadaCa = dao.UpdateContraseniaEmpleadoCC(correo,nuevacontraseniac);
                        if (contraseniacambiadaCa) {
                            System.out.println("Entro aqui para mandar el mensaje de exito");
                            req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                            resp.sendRedirect("Caja.jsp");
                        } else {
                            req.getSession().setAttribute("mensajeErrorNoseActualizocontrasenia", "Error al actualizar contrasenia");
                            resp.sendRedirect("Caja.jsp");
                        }
                        break;

                    default:
                        System.out.println("Cambiar contrasenia de cliente");
                        boolean contraseniacambiadaCl = dao.UpdateContraseniaCleinteCC(correo,nuevacontraseniac);
                        if (contraseniacambiadaCl) {
                            System.out.println("Entro aqui para mandar el mensaje de exito");
                            req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                            resp.sendRedirect("Cliente.jsp");
                        } else {
                            req.getSession().setAttribute("mensajeErrorNoseActualizocontrasenia", "Error al actualizar contrasenia");
                            resp.sendRedirect("Cliente.jsp");
                        }
                        break;
                }
            }else {
                switch (rol) {
                    case "Gerente":
                        req.getSession().setAttribute("mensajeErrorContrasenias", "Las contraseñas no coinciden");
                        resp.sendRedirect("Gerente.jsp");
                        break;

                    case "Recepcionista":
                        req.getSession().setAttribute("mensajeErrorContrasenias", "Las contraseñas no coinciden");
                        resp.sendRedirect("Recepcionista.jsp");
                        break;

                    case "Mecanico":
                        req.getSession().setAttribute("mensajeErrorContrasenias", "Las contraseñas no coinciden");
                        resp.sendRedirect("Mecanico.jsp");
                        break;

                    case "Caja":
                        req.getSession().setAttribute("mensajeErrorContrasenias", "Las contraseñas no coinciden");
                        resp.sendRedirect("Caja.jsp");
                        break;

                    default:
                        req.getSession().setAttribute("mensajeErrorContrasenias", "Las contraseñas no coinciden");
                        resp.sendRedirect("Cliente.jsp");
                        break;
                }

            }
        // cambiar correo solo de los empleados
        }else if(accion.equals("Cambiar correo")){
            int id_empleado = (int) req.getSession().getAttribute("id_empleado");
            System.out.println(id_empleado);
            RegistroDao dao = new RegistroDao();
            if (correonuevo.equals(correonuevoc)){
                System.out.println("ENTRO AQUI");
                switch (rol) {
                    case "Gerente":
                        try{
                            boolean correocambioG = dao.UpdateCorreoEmpleado(id_empleado,correonuevo); // me quede aqui en probar cn el gerente me falta probar con los demas usuarios
                            if (correocambioG){
                                System.out.println("Entro aqui para mandar el mensaje de exito");
                                req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                                resp.sendRedirect("Gerente.jsp");
                                break;
                            } else {
                                req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                                resp.sendRedirect("Gerente.jsp");
                            }
                        }catch (Exception e){
                            req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                            resp.sendRedirect("Gerente.jsp");
                        }
                        break;
                    case "Recepcionista":
                        try{
                            boolean correocambioR = dao.UpdateCorreoEmpleado(id_empleado,correonuevo); //ya lo realize
                            if (correocambioR) {
                                System.out.println("Entro aqui para mandar el mensaje de exito");
                                req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                                resp.sendRedirect("Recepcionista.jsp");
                            } else {
                                req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                                resp.sendRedirect("Recepcionista.jsp");
                            }
                        }catch (Exception e){
                            req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                            resp.sendRedirect("Recepcionista.jsp");
                        }

                        break;
                    case "Mecanico":
                        try{
                            boolean correocambioM = dao.UpdateCorreoEmpleado(id_empleado,correonuevo);
                            if (correocambioM) {
                                System.out.println("Entro aqui para mandar el mensaje de exito");
                                req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                                resp.sendRedirect("Mecanico.jsp");
                            } else {
                                req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                                resp.sendRedirect("Mecanico.jsp");
                            }
                        }catch (Exception e){
                            req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                            resp.sendRedirect("Mecanico.jsp");
                        }

                        break;
                    case "caja":
                        try{
                            boolean correocambioC = dao.UpdateCorreoEmpleado(id_empleado,correonuevo);
                            if (correocambioC) {
                                System.out.println("Entro aqui para mandar el mensaje de exito");
                                req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                                resp.sendRedirect("Caja.jsp");
                            } else {
                                req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                                resp.sendRedirect("Caja.jsp");
                            }
                        }catch (Exception e){
                            req.getSession().setAttribute("mensajeErrorCambioCorreo", "Error al actualizar correo");
                            resp.sendRedirect("Caja.jsp");
                        }

                        break;
                    default:
                        System.out.println("eRROR");
                        break;
                }
            }else {
                switch (rol) {
                    case "Gerente":
                        req.getSession().setAttribute("mensajeErrorNoCoincideCorreo", "Los correos no coinciden");
                        resp.sendRedirect("Gerente.jsp");
                        break;

                    case "Recepcionista":
                        req.getSession().setAttribute("mensajeErrorNoCoincideCorreo", "Los correos no coinciden");
                        resp.sendRedirect("Recepcionista.jsp");
                        break;

                    case "Mecanico":
                        req.getSession().setAttribute("mensajeErrorNoCoincideCorreo", "Los correos no coinciden");
                        resp.sendRedirect("Mecanico.jsp");
                        break;

                    case "Caja":
                        req.getSession().setAttribute("mensajeErrorNoCoincideCorreo", "Los correos no coinciden");
                        resp.sendRedirect("Caja.jsp");
                        break;
                    default:
                        System.out.println("error");
                        break;
                }

            }

        // cambiar correo solo de los clientes  // logre hacer todo lo de clientes  tengo que hacer todo lo de  cambiar contra para cliente por que los demas ya , me falta hacer cambiar correo para todos los empleados
        }if (accion.equals("Cambiar correocliente")) {
            System.out.println("entro para cambiar el correo");
            RegistroDao dao = new RegistroDao();
            int id_cliente = (int) req.getSession().getAttribute("id_cliente");
            if (correonuevo.equals(correonuevoc)) {
                try {
                    boolean correocambioCl = dao.UpdateCorreoCliente(id_cliente, correonuevo);
                    System.out.println("los correos son iguales");
                    if (correocambioCl) {
                        System.out.println("mandar mensaje de éxito");
                        req.getSession().setAttribute("mensajeExito", "Cambio fue exitoso");
                    }
                }catch (Exception e){
                    req.getSession().setAttribute("mensajeErrorNoseActualizoCorreo", e);
                }
            } else {
                req.getSession().setAttribute("mensajeErrorCorreos", "Los correos no coinciden");
            }

            resp.sendRedirect("Cliente.jsp");
        }


    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

    }













}
