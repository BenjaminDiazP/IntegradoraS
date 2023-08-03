package com.sigma.sigma.controller;

import com.sigma.sigma.model.Articulo;
import com.sigma.sigma.model.RegistroArticulosDao;
import com.sigma.sigma.model.RegistroDao;
import com.sigma.sigma.model.Usuario;
import com.sigma.sigma.utils.Send;
import com.sigma.sigma.utils.SendEmail;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
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


        if (accion.equals("Agregar usuario")) {

            boolean envio = dao.insertCliente(new Usuario(nombre, apellido1, apellido2, rfc, curp, direccion, sexo, noTelefono, correo, fechaNac, contrasenia, codigo));

            if (envio != false){
                SendEmail mail = new SendEmail();
                try{
                    mail.sendEmail(
                            correo,
                            "Prueba de envio",
                            "<h1>Hola como estas </h1>",
                            new File(
                                    req.getSession().
                                            getServletContext().
                                            getResource("/assets/img/logo.png").
                                            toURI()));
                } catch (URISyntaxException e) {
                    throw new RuntimeException(e);
                }

            }else{

            }
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

        }
        resp.sendRedirect("RegistroServlet?tipo=empleado");
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        if (tipo.equals("empleado")){
            RegistroDao dao = new RegistroDao();
            List<Usuario> listaEmpleado = dao.getAllEmpleado();
            req.getSession().setAttribute("listaEmpleado", listaEmpleado);
            req.getRequestDispatcher("RegistrarEmpleado.jsp").forward(req, resp);
        } else if (tipo.equals("cliente")) {

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

