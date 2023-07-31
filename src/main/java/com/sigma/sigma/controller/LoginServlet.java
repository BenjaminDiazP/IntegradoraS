package com.sigma.sigma.controller;

import com.sigma.sigma.model.LoginDao;
import com.sigma.sigma.model.Usuario;
import com.sigma.sigma.utils.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name= "LoginServlet", value ="/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion.equals("ingresar")) {
            String correo = req.getParameter("correo");
            String contrasenia = req.getParameter("contra");
            LoginDao dao = new LoginDao();
            Usuario usr = (Usuario) dao.findOne(correo, contrasenia);
            System.out.println(correo);
            System.out.println(contrasenia);
                if (usr != null) {
                    switch (usr.getRol()) {
                        case "Gerente":
                            req.getSession().setAttribute("usuario", usr.getNombre());
                            req.getSession().setAttribute("apellido1", usr.getApellido1());
                            req.getSession().setAttribute("apellido2", usr.getApellido2());
                            req.getSession().setAttribute("correo", usr.getCorreo());
                            req.getSession().setAttribute("direccion", usr.getDireccion());
                            resp.sendRedirect("Gerente.jsp");

                            break;
                        case "Recepcionista": // podemos hacer una pagina de empleado y que el empleado escoja que empleado es
                            req.getSession().setAttribute("usuario", usr.getNombre());
                            req.getSession().setAttribute("apellido1", usr.getApellido1());
                            req.getSession().setAttribute("apellido2", usr.getApellido2());
                            req.getSession().setAttribute("correo", usr.getCorreo());
                            req.getSession().setAttribute("direccion", usr.getDireccion());
                            resp.sendRedirect("Recepcionista.jsp");

                            break;
                        case "Mecanico":
                            resp.sendRedirect("Mecanico.jsp");
                            break;
                        case "Caja":
                            resp.sendRedirect("Caja.jsp");
                            break;
                        default:
                            resp.sendRedirect("Cliente.jsp");
                            break;
                    }
                }else{
                    req.getSession().setAttribute("infocontra", "No hay nada");
                    resp.sendRedirect("InicioSesion.jsp");

                }

        }/*else if(accion.equals("RecuperarCon")){
            String email = req.getParameter("correo");

            if (!email.isEmpty()){
                LoginDao dao = new LoginDao();
                Usuario usr = (Usuario) dao.findOne(email);
                if (usr.getId_usuario()!=0){
                    //si existe un usuario con ese correo en la base de datos
                    SendEmail mail = new SendEmail();
                    try {
                        mail.sendEmail(
                                usr.getCorreo(),
                                "Recuperación de contraseña",
                                "Has solicitado la recuperacion " +
                                        "de tu contraseña para la pagina " +
                                        "web de zail </br></br> por favor " +
                                        "da click en el siguiente enlace para " +
                                        "recuperar tu contraseña:</br>" +
                                        "<a href=\"modificarContra.jsp?codigo="+usr.getCodigo()+"\">Recuperación</a>",
                                new File(
                                        req.getSession().
                                                getServletContext().
                                                getResource("/assets/img/logo.png").
                                                toURI()));
                    } catch (URISyntaxException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        }*/
    }
}