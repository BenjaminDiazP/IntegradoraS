package com.sigma.sigma.controller;


import com.sigma.sigma.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TablasVentasMPServlet", value = "/TablasVentasMPServlet")
public class TablasVentasMPServlet extends HttpServlet{


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        VentasDao ventasDao = new VentasDao();
        TablasVentasMPDao dao = new TablasVentasMPDao();
        String tipo = req.getParameter("tipo");
        if(tipo.equals("VentasP")){
            List<DetallesVenta> listaProductoVentaInfo = ventasDao.detallesVenta();

            req.getSession().setAttribute("listaProductoVentaInfo", listaProductoVentaInfo);

            for (DetallesVenta detallesVenta :listaProductoVentaInfo){
                List<Articulo> listaArticulos = dao.mostrarArticulos(detallesVenta.getIdTablaPedido());
                detallesVenta.setListaDeProductos(listaArticulos);
            }

            req.getRequestDispatcher("HistorialComprasG.jsp").forward(req,resp);

        }else if(tipo.equals("VentasCliente")){
            System.out.println("Entro para mostrrar la lista de prodcutos");
            Integer  idCliente= (Integer) req.getSession().getAttribute("id_cliente");
            List<DetallesVenta> listaProductoVentaInfoC = ventasDao.detallesVentaCliente(idCliente);
            req.getSession().setAttribute("listaProductoVentaInfoC", listaProductoVentaInfoC);
            for (DetallesVenta detallesVenta :listaProductoVentaInfoC){
                List<Articulo> listaArticulos = dao.mostrarArticulos(detallesVenta.getIdTablaPedido());
                detallesVenta.setListaDeProductos(listaArticulos);

            }
            req.getRequestDispatcher("HistorialComprasCl.jsp").forward(req,resp);

        }
    }
}
