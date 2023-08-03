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
                    req.getSession().setAttribute("tipoSesion", usr.getRol()); // mivo esto adentro del if estaba fuera y por eso ada un error al no econtrar las credencial al intentar iniciar sesio pr que regresa un null en el rol
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
                            req.getSession().setAttribute("tipoSesion", "Cliente"); // agrego el atributo cliente en lugar del rol por que en la tabla cliente no tiene tipo de rol
                            resp.sendRedirect("Cliente.jsp");
                            break;
                    }
                }else{
                    req.getSession().setAttribute("ErrorSesion", "Error al iniciar sesión, por favor verifica tus credenciales.");
                    resp.sendRedirect("InicioSesion.jsp");

                }

        }
    }
}