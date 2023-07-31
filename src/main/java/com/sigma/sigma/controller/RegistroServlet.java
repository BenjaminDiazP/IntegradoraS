package com.sigma.sigma.controller;

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

        System.out.println(contrasenia);
        if (accion.equals("Agregar usuario")) {

            dao.insertCliente(new Usuario(nombre, apellido1, apellido2, rfc, curp, direccion, sexo, noTelefono, correo, fechaNac, contrasenia, codigo));
            Usuario usr = (Usuario) dao.findOne(correo, contrasenia);
            System.out.println(usr.getContrasenia());
            Send correoUtil = new Send();
            try {
                correoUtil.enviarCorreo("carlosbenjamin340@gmail.com", "tonto", "assets/img/");
                // Redirecciona a una página de éxito o muestra un mensaje
                resp.sendRedirect("index.jsp");
            } catch (MessagingException e) {
                e.printStackTrace();
                // Redirecciona a una página de error o muestra un mensaje
                resp.sendRedirect("index.jsp");
            }
            resp.sendRedirect("index.jsp");
        }else if (accion.equals("Agregar Empleado")){

            dao.insertEmpleado(new Usuario(rol,nombre, apellido1, apellido2, rfc, curp, direccion, sexo, noTelefono, correo, fechaNac, contrasenia, codigo));
            Usuario usr = (Usuario) dao.findOneEmpleado(correo, contrasenia);

        }
        resp.sendRedirect("index.jsp");

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
