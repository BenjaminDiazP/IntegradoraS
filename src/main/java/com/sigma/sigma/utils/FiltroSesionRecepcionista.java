package com.sigma.sigma.utils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/Recepcionista.jsp",
        "/RegistrarUsuario.jsp"
})
public class FiltroSesionRecepcionista implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Get the HttpSession from the request
        HttpSession session = httpRequest.getSession(false);

        // Check if the user is an admin(assuming isAdmin is a boolean session attribute)
        boolean isAdmin = false;
        if(session != null){

            if (session.getAttribute("tipoSesion") != null) {

                System.out.println(session.getAttribute("tipoSesion"));
                isAdmin = session.getAttribute("tipoSesion").equals("Recepcionista");
            }

        }

        if (isAdmin) {
            // If the user is an admin, allow access to the Servlet
            chain.doFilter(request, response);
        } else {
            // If the user is not an admin, redirect them to a restricted access page
            httpResponse.sendRedirect("FailedAccess.jsp");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed (optional)
    }
}