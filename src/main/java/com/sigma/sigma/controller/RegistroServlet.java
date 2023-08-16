package com.sigma.sigma.controller;

import com.sigma.sigma.model.Articulo;
import com.sigma.sigma.model.RegistroArticulosDao;
import com.sigma.sigma.model.RegistroDao;
import com.sigma.sigma.model.Usuario;
import com.sigma.sigma.utils.Send;
import com.sigma.sigma.utils.SendEmail;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLOutput;
import java.util.List;
import java.util.Random;

@WebServlet(name = "RegistroServlet", value = "/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistroDao dao = new RegistroDao();
        int longitudContrasenia = 8; // Longitud de la cadena
        String caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; // Caracteres permitidos
        int longitudCodigo = 4;
        int id_usuario;
        String nombre = req.getParameter("nombre");
        String apellido1 = req.getParameter("apellidoPaterno");
        String apellido2 = req.getParameter("apellidoMaterno");
        String rfc = req.getParameter("rfc");
        String curp = req.getParameter("curp");
        String direccion = req.getParameter("direccion");
        String sexo = req.getParameter("sexo");
        String noTelefono = req.getParameter("telefono");
        String correo = req.getParameter("correo");
        String fechaNac = req.getParameter("fechaNacimiento");
        String rol = req.getParameter("rol");
        String contrasenia = generarCadenaAleatoria(longitudContrasenia, caracteres);
        String codigo = generarCadenaAleatoria(longitudCodigo, caracteres);
        String accion = req.getParameter("Registrar"); // esto lo cambie estaba como
        String nuevacontrasenia = req.getParameter("nuevacontrasenia");
        String nuevacontraseniaconfirmacion = req.getParameter("nuevacontraseniaconfirmacion");
        String codigosec =req.getParameter("codigoS");


        if (accion.equals("Agregar usuario")) {
            req.getSession().removeAttribute("mensajeError");
            boolean envio = dao.insertCliente(new Usuario(nombre, apellido1, apellido2, rfc, curp, direccion, sexo, noTelefono, correo, fechaNac, contrasenia, codigo));
            //////////////////Jalar el id del cliente al automovil//////////////////////////////
            int clienteID = dao.getUltimoIdCliente(); // aqui debo de obtener el ultimo id del cliente que se ingreso
            HttpSession session = req.getSession();
            session.setAttribute("clienteID", clienteID);
            System.out.println(clienteID);
            ////////////////////////////////////////////////
            if (envio != false){
                SendEmail mail = new SendEmail();
                try{
                    System.out.println(contrasenia);
                    mail.sendEmail(
                            correo,
                            "Bienvenido a SIGMA" ,
                            "<p >Gracias por registrarte en nuestro sistema " +"<strong>"+nombre+"</strong>"+"<br>"+" Ahora podras iniciar sesión en nuestro sistema con la siguiente " +
                                    "contraseña : " + "<strong>"+contrasenia+"</strong>"  + "</p>",
                            new File(
                                    req.getSession().
                                            getServletContext().
                                            getResource("/assets/img/imagesPaginaPrincipal/logo.png").
                                            toURI()));
                } catch (URISyntaxException e) {
                    throw new RuntimeException(e);
                }
                req.getSession().setAttribute("mensajeExito", "Registro Exitoso");

            }else{
                req.getSession().setAttribute("mensajeError", "Hubo un error al insertar el cliente en la base de datos.");

            }
            resp.sendRedirect("RegistroServlet?tipo=cliente");

        }else if (accion.equals("Agregar Empleado")){
            req.getSession().removeAttribute("mensajeError");
            boolean envio1=  dao.insertEmpleado(new Usuario(rol,nombre, apellido1, apellido2, rfc, curp, direccion, sexo, noTelefono, correo, fechaNac, contrasenia, codigo));
            if (envio1 != false){
                SendEmail mail = new SendEmail();
                try{
                    System.out.println(contrasenia);
                    mail.sendEmail(
                            correo,
                            "Bienvenido a SIGMA" ,
                            "<p >Gracias por registrarte en nuestro sistema " +"<strong>"+nombre+"</strong>"+"<br>"+" Ahora podras iniciar sesión en nuestro sistema con la siguiente " +
                                    "contraseña : " + "<strong>"+contrasenia+"</strong>"  + "</p>",
                            new File(
                                    req.getSession().
                                            getServletContext().
                                            getResource("/assets/img/imagesPaginaPrincipal/logo.png").
                                            toURI()));
                } catch (URISyntaxException e) {
                    throw new RuntimeException(e);
                }
                req.getSession().setAttribute("mensajeExito", "Registro Exitoso");
            }else{
                req.getSession().setAttribute("mensajeError", "Hubo un error al insertar el cliente en la base de datos.");
            }
            resp.sendRedirect("RegistroServlet?tipo=empleado");

        } else if (accion.equals("Modificar empleado") || accion.equals("Estado empleado")) {
            switch (accion) {
                case "Modificar empleado":
                    try {
                        boolean envio2 = dao.ModificarEmpleado(new Usuario(rfc, rol, nombre, apellido1, apellido2, direccion, sexo, noTelefono, correo));
                    } catch (Exception e) {
                        req.getSession().setAttribute("Error", e);
                        req.getSession().setAttribute("mensajeErrorUpdate", "Hubo un error al insertar el cliente en la base de datos.");
                    }
                    resp.sendRedirect("RegistroServlet?tipo=empleado");

                    break;
                case "Estado empleado":
                    RegistroDao dao1 = new RegistroDao();
                    System.out.println(rfc);
                    int estado = dao.BuscarEstadoEmpleado(rfc);
                    System.out.println(estado);
                    if (estado == 1) {
                        dao.CambiarEstadoE(rfc);
                    } else if (estado == 0) {
                        dao.CambiarEstadoEmpleado1(rfc);
                    }
                    resp.sendRedirect("RegistroServlet?tipo=empleado");
                    break;
                default:
                    resp.sendRedirect("RegistroServlet?tipo=empleado");
            }
        }else if (accion.equals("Modificar cliente") || accion.equals("Estado cliente")){
            switch (accion) {
                case "Modificar cliente":
                    try {
                        boolean envio2 = dao.ModificarCliente(new Usuario(nombre, apellido1, apellido2,rfc,direccion, sexo, noTelefono, correo));
                    } catch (Exception e) {
                        req.getSession().setAttribute("Error", e);
                        req.getSession().setAttribute("mensajeErrorUpdate", "Hubo un error al insertar el cliente en la base de datos.");
                    }
                    resp.sendRedirect("RegistroServlet?tipo=cliente");
                    break;
                case "Estado cliente":
                    RegistroDao dao1 = new RegistroDao();
                    System.out.println(rfc);
                    int estado = dao.BuscarEstadoCliente(rfc);
                    System.out.println(estado);
                    if (estado == 1) {
                        dao.CambiarEstadoC(rfc);
                    } else if (estado == 0) {
                        dao.CambiarEstadoCleinte1(rfc);
                    }
                    resp.sendRedirect("RegistroServlet?tipo=cliente");
                    break;
                default:
                    resp.sendRedirect("RegistroServlet");
            }

        }else if (accion.equals("Reestablecer Contrasenia E")){
            System.out.println("ingreso para cambiar la contrasenia");
            RegistroDao dao1 = new RegistroDao();

            boolean correoregistradoE = dao1.BuscarCorreoEmpleado(correo);

            if(correoregistradoE){
                String newCodeE = dao1.generadorCodigoEmpleado();

                dao1.UpdateCodigoEmpleado(correo,newCodeE);

                String codigoreestablecimiento = dao1.ObtenerCodigoRestablecimientoEmpleado(correo);

                if(codigoreestablecimiento != null){
                    dao1.EnviarCodigoPorCorreo(correo,codigoreestablecimiento);

                    resp.sendRedirect("IngresarCodigoRecuperacionContra.jsp?correo=" + URLEncoder.encode(correo,"UTF-8"));

                }else{
                    req.getSession().setAttribute("mensajeError", "Hubo un error al obtener el codigo de seguriad");
                    resp.sendRedirect("Recuperacion.jsp");
                }

            }else {
                System.out.println("Esta entrando para mandar el mensaje de error");
                req.getSession().setAttribute("mensajeError", "El correo electrónico no está registrado");
                resp.sendRedirect("Recuperacion.jsp");
            }

        }else if(accion.equals("ComprobarCodigoSec")){

            RegistroDao dao1 = new RegistroDao();

            String codigoalmacenado = dao1.ObtenerCodigoRestablecimientoEmpleado(correo);

            if (codigoalmacenado.equals(codigosec)){
                resp.sendRedirect("ReestablecerContraEC.jsp?correo=" + URLEncoder.encode(correo,"UTF-8"));
            }else{
                req.getSession().setAttribute("mensajeError", "El codigo no coincide");
                resp.sendRedirect("IngresarCodigoRecuperacionContra.jsp?correo=" + URLEncoder.encode(correo,"UTF-8"));
            }

        }else if (accion.equals("Cambiar Contrasenia")) {
            RegistroDao dao1 = new RegistroDao();
            if (nuevacontrasenia.equals(nuevacontraseniaconfirmacion)) {
                System.out.println("Entro aqui para actualizar la contrasenia");
                boolean contraactualizada = dao1.UpdateContraseniaEmpleado(correo, nuevacontrasenia);
                if (contraactualizada) {
                    System.out.println("Entro aqui para mandar el mensaje de exito");
                    req.getSession().setAttribute("mensajeExito", "Cambio Fue exitoso");
                    resp.sendRedirect("InicioSesion.jsp");
                    return; // Importante: detener la ejecución aquí para evitar más procesamiento.
                }
            }
            System.out.println("Entro aqui para mandar el errorrrrrrr");
            req.getSession().setAttribute("mensajeError", "Las contraseñas no coinciden");
            resp.sendRedirect("ReestablecerContraEC.jsp?correo=" + URLEncoder.encode(correo, "UTF-8"));

        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        if (tipo != null) {
            RegistroDao dao = new RegistroDao();

            if (tipo.equals("empleado")) {
                List<Usuario> listaEmpleado = dao.getAllEmpleado();

                req.getSession().setAttribute("listaEmpleado", listaEmpleado);

                req.getRequestDispatcher("RegistrarEmpleado.jsp").forward(req, resp);
            } else if (tipo.equals("cliente")) {
                List<Usuario> listaCliente = dao.getAllCliente();

                req.getSession().setAttribute("listaCliente", listaCliente);
                req.getRequestDispatcher("RegistrarUsuario.jsp").forward(req, resp);

            } else {
                // Manejar el caso en el que el valor de "tipo" no sea "empleado" ni "cliente"
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tipo de solicitud inválido");
            }
        } else {
            // Manejar el caso en el que el parámetro "tipo" es nulo
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetro 'tipo' faltante");
        }


    }
    public static String generarCadenaAleatoria(int longitud, String caracteres) {
        Random random = new Random();
        StringBuilder cadena = new StringBuilder(longitud);

        for (int i = 0; i < longitud; i++) {
            int indice = random.nextInt(caracteres.length());
            char caracter = caracteres.charAt(indice);
            cadena.append(caracter);
        }

        return cadena.toString();
    }




}

