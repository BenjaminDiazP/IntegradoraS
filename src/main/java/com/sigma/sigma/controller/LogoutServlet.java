package com.sigma.sigma.controller;


import com.sigma.sigma.model.LoginDao;
import com.sigma.sigma.model.Usuario;
import com.sigma.sigma.utils.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // obtén la sesión actual
        if (session != null) {
            session.invalidate(); // finaliza la sesión
        }
        response.sendRedirect("index.jsp"); // redirige al usuario a la página de inicio de sesión
    }
}
