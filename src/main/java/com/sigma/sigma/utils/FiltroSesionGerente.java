package com.sigma.sigma.utils;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/Gerente.jsp",
        "/RegistrarEmpleado.jsp",
        "/RegistrarUsuario.jsp",
        "/RegistroArticulos.jsp",
        "/ModificarEmpleado.jsp"
})
public class FiltroSesionGerente implements Filter {

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

        // Check if the user is an admin (assuming isAdmin is a boolean session attribute)
        boolean isAdmin = false;
        if (session != null) {
            if (session.getAttribute("tipoSesion") != null) {
                isAdmin = session.getAttribute("tipoSesion").equals("Gerente");
            }
        }

        // Check if the requested page is allowed for shared access
        boolean paginaPermitida = "/RegistrarUsuario.jsp".equals(httpRequest.getServletPath());

        //esto es por si nececito agregar mas paginas que se comparten los usuarios

        //boolean paginaPermitida = "/RegistrarUsuario.jsp".equals(httpRequest.getServletPath())
                //|| "/RegistrarAutomovil.jsp".equals(httpRequest.getServletPath());

        if (isAdmin || paginaPermitida) {
            // If the user is an admin or the page is allowed for shared access, allow access to the Servlet
            chain.doFilter(request, response);
        } else {
            // If the user is not an admin and the page is not allowed for shared access, redirect them to a restricted access page
            httpResponse.sendRedirect("FailedAccess.jsp");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed (optional)
    }
}
