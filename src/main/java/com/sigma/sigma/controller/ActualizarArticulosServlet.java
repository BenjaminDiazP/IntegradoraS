package com.sigma.sigma.controller;

import com.sigma.sigma.model.Articulo;
import com.sigma.sigma.model.RegistroArticulosDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name= "ActualizarArticulos", value ="/ActualizarArticulosServlet")
public class ActualizarArticulosServlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idProducto = Integer.parseInt(req.getParameter("id_producto"));
        String nombre = req.getParameter("nombre");
        Float costo = Float.parseFloat(req.getParameter("costo"));
        String categoria = req.getParameter("categoria");
        int stock = Integer.parseInt(req.getParameter("stock"));
        System.out.println(idProducto);
        System.out.println(costo);

        Articulo art = new Articulo(idProducto, nombre, costo, categoria, stock);

        // Aquí realizarías la lógica para actualizar el artículo en tu base de datos o donde lo almacenes
        RegistroArticulosDao dao = new RegistroArticulosDao();
        dao.updateArticulo(art);
        RegistroArticulosDao dao1 = new RegistroArticulosDao();
        List<Articulo> listaArticulos = dao1.getAllArticulos();
        req.getSession().setAttribute("listaArticulos", listaArticulos);
        resp.sendRedirect("RegistroArticulos.jsp");
    }

    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
