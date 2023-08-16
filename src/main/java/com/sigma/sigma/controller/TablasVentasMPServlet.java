package com.sigma.sigma.controller;


import com.sigma.sigma.model.Articulo;
import com.sigma.sigma.model.ProductoVentaInfo;
import com.sigma.sigma.model.TablasVentasMPDao;

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
        TablasVentasMPDao dao = new TablasVentasMPDao();
        String tipo = req.getParameter("tipo");
        if(tipo.equals("VentasP")){
            List<ProductoVentaInfo> listaProductoVentaInfo = dao.ListaTicket();

            req.getSession().setAttribute("listaProductoVentaInfo", listaProductoVentaInfo);

            /*
            for (ProductoVentaInfo productoVentaInfo:listaProductoVentaInfo){
                List<Articulo> listaArticulos = dao.mostrarArticulos(productoVentaInfo.getIdProductoVenta());
                productoVentaInfo.setListaDeProductos(listaArticulos);
            }
            */

            req.getRequestDispatcher("HistorialComprasG.jsp").forward(req,resp);

        }
    }
}
