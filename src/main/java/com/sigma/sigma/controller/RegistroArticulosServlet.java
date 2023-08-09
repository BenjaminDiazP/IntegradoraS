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
import java.util.Enumeration;
import java.util.List;

@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
@WebServlet(name = "RegistroArticusloServlet", value = "/RegistroArticulosServlet")
public class RegistroArticulosServlet extends HttpServlet {
private Part imagen;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String accion = req.getParameter("accion");

        if(accion.equals("AgregarArticulo")){
            String nombre = req.getParameter("nombre");
            Double costo = Double.valueOf(req.getParameter("costo"));
            String categoria = req.getParameter("categoria");
            int stock = Integer.parseInt(req.getParameter("stock"));
            imagen = req.getPart("imagen");
            InputStream imageBytes = imagen.getInputStream();
            RegistroArticulosDao dao = new RegistroArticulosDao();
           boolean resultado=  dao.insert(new Articulo(nombre, costo,categoria,stock), imageBytes);

            if(resultado){
                List<Articulo> listaArticulos = dao.getAllArticulos();
                req.getSession().setAttribute("listaArticulos", listaArticulos);
                resp.sendRedirect("/RegistroArticulosServlet?tipo=articulos");
            }
        }else if (accion.equals("Eliminar Articulo")) {
            RegistroArticulosDao dao = new RegistroArticulosDao();
            int id = Integer.parseInt(req.getParameter("id_producto"));
            System.out.println(id);
            int estado = dao.BuscarEstado(id);
            System.out.println(estado);
            if (estado == 1) {
                dao.cambiarEstado(id);
            } else if (estado == 0) {
                dao.cambiarEstado1(id);
            }
            resp.sendRedirect("RegistroArticulosServlet?tipo=articulos");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RegistroArticulosDao dao1 = new RegistroArticulosDao();
        String tipo = req.getParameter("tipo");
        if(tipo.equals("articulos")){
            List<Articulo> listaArticulos = dao1.getAllArticulos();
            req.getSession().setAttribute("listaArticulos", listaArticulos);
            System.out.println(listaArticulos.get(1).getEstado());
            req.getRequestDispatcher("RegistroArticulos.jsp").forward(req,resp);
        }else if(tipo.equals("paquetes")){
            List<Articulo> listaProductos = dao1.getAllArticulosProductos();
            List<Articulo> listaServicios = dao1.getAllArticulosServicios();
            req.getSession().setAttribute("listaProductos", listaProductos);
            req.getSession().setAttribute("listaServicios", listaServicios);
            req.getRequestDispatcher("RegistrarPaquetes.jsp").forward(req,resp);
        }


    }



}