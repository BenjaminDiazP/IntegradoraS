package com.sigma.sigma.utils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/Cliente.jsp",
        "/HistorialMantenimientoCl.jsp",
        "/HistorialComprascl.jsp"
})
public class FiltroSesionCliente implements Filter {

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
         // Compare the value with "Cliente"
        boolean isAdmin = false;
        if(session != null){

            if (session.getAttribute("tipoSesion") != null) {
                System.out.println(session.getAttribute("tipoSesion"));
                String op = session.getAttribute("tipoSesion").toString(); // is true Nombre
                isAdmin = session.getAttribute("tipoSesion").equals("Cliente");
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
