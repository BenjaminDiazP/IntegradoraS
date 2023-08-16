package com.sigma.sigma.model;

import com.google.gson.*;

import com.google.protobuf.TextFormat;
import com.sigma.sigma.model.*;
import com.sigma.sigma.utils.MySqlConector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DetallesVentaDao implements DaoRepository {
















    @Override
    public List findAll() {
        return null;
    }

    @Override
    public Object findOne(int id, String rol) {
        return null;
    }

    @Override
    public boolean update(int id, String rol, Object object) {
        return false;
    }

    @Override
    public boolean delete(int id, String rol) {
        return false;
    }

    public int buscarIdPorCorreo(String correo) {
        MySqlConector conector = new MySqlConector();
        int id = -1;
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT  idcliente from Cliente where correo = ?");
          stmt.setString(1,correo);

            ResultSet res = stmt.executeQuery();
            if (res.next()){
                id = res.getInt("idcliente");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }

    public int buscarIdxNombre(String nombre) {

     MySqlConector conector = new MySqlConector();
        if (nombre.startsWith("\"") && nombre.endsWith("\"")) {
            nombre = nombre.substring(1, nombre.length() - 1);
        }
        int id = -1;
     try (Connection con = conector.connect()){
         PreparedStatement stmt = con.prepareStatement("SELECT id_producto from producto where nombre = ?");
         stmt.setString(1,nombre);
         ResultSet res  = stmt.executeQuery();
         if (res.next()){
             id = res.getInt("id_producto");
         }
     }catch (SQLException e){
         throw  new RuntimeException(e);

     }
     return id;

    }

    public boolean insertar(DetallesVenta detallesVenta) {
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Producto_Venta(id_cliente, id_Producto, fecha, total, tipoPago, id_empleado, id_TipoPago )" +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)");

            stmt.setInt(1, detallesVenta.getIdCliente());
            stmt.setInt(2, detallesVenta.getIdProducto());
            stmt.setDate(3, new java.sql.Date(detallesVenta.getFecha().getTime()));
            stmt.setFloat(4, detallesVenta.getTotal());
            stmt.setString(5, detallesVenta.getTipoPago());
            stmt.setInt(6,detallesVenta.getId_empleado());
            stmt.setInt(7,0);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }




}
