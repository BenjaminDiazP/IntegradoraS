package com.sigma.sigma.utils;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/Recepcionista.jsp",
        "/RegistrarUsuario.jsp",
        "/RegistrarAuto.jsp"
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

        // Check if the user is a recepcionista (assuming isRecepcionista is a boolean session attribute)
        boolean isRecepcionista = false;

        if(session != null){

            if (session.getAttribute("tipoSesion") != null) {
                System.out.println(session.getAttribute("tipoSesion"));
                String op = session.getAttribute("tipoSesion").toString(); // is true Nombre
                isRecepcionista = session.getAttribute("tipoSesion").equals("Recepcionista");
            }

        }

        // Check if the requested page is allowed for shared access



        if (isRecepcionista) {
            // If the user is a recepcionista or the page is allowed for shared access, allow access to the Servlet
            chain.doFilter(request, response);
        } else {
            // If the user is not a recepcionista and the page is not allowed for shared access, redirect them to a restricted access page
            httpResponse.sendRedirect("FailedAccess.jsp");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed (optional)
    }
}
