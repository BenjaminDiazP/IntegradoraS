package com.sigma.sigma.controller;

import com.sigma.sigma.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "RegistroArticusloServlet", value = "/RegistroArticulosServlet")
public class RegistroArticulosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nombre = req.getParameter("nombre");
        Double costo = Double.valueOf(req.getParameter("costo"));
        String categoria = req.getParameter("categoria");
        int stock = Integer.parseInt(req.getParameter("stock"));
        String accion = req.getParameter("RegistrarA");

        if(accion.equals("AgregarArticulo")){
            RegistroArticulosDao dao = new RegistroArticulosDao();
            dao.insert(new Articulo(nombre, costo,categoria,stock));
            List<Articulo> listaArticulos = dao.getAllArticulos();
            req.getSession().setAttribute("listaArticulos", listaArticulos);
            resp.sendRedirect("RegistroArticulos.jsp");


        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RegistroArticulosDao dao1 = new RegistroArticulosDao();
        List<Articulo> listaArticulos = dao1.getAllArticulos();
        req.getSession().setAttribute("listaArticulos", listaArticulos);
        resp.sendRedirect("RegistroArticulos.jsp");

    }



}