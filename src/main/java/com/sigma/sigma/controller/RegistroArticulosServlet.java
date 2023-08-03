package com.sigma.sigma.controller;

import com.sigma.sigma.model.*;

import javax.print.attribute.standard.PresentationDirection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
@WebServlet(name = "RegistroArticusloServlet", value = "/RegistroArticulosServlet")
public class RegistroArticulosServlet extends HttpServlet {
private Part imagen;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nombre = req.getParameter("nombre");
        Double costo = Double.valueOf(req.getParameter("costo"));
        String categoria = req.getParameter("categoria");
        int stock = Integer.parseInt(req.getParameter("stock"));
        String accion = req.getParameter("RegistrarA");
        imagen = req.getPart("imagen");
        InputStream imageBytes = imagen.getInputStream();

        if(accion.equals("AgregarArticulo")){
            RegistroArticulosDao dao = new RegistroArticulosDao();
           boolean resultado=  dao.insert(new Articulo(nombre, costo,categoria,stock), imageBytes);

            if(resultado){
                List<Articulo> listaArticulos = dao.getAllArticulos();
                req.getSession().setAttribute("listaArticulos", listaArticulos);
                resp.sendRedirect("RegistroArticulos.jsp");

            }


        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        RegistroArticulosDao dao1 = new RegistroArticulosDao();
        if(dao1.getAllArticulos().isEmpty()){
            req.getSession().setAttribute("Sin datos", "No hay datos");
            resp.sendRedirect("RegistroArticulos.jsp");
        }else{
            List<Articulo> listaArticulos = dao1.getAllArticulos();
            req.getSession().setAttribute("listaArticulos", listaArticulos);
            resp.sendRedirect("RegistroArticulos.jsp");
        }

    }



}