package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;

import javax.swing.event.ListDataEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VentasDao implements  DaoRepository{
    @Override
    public List findAll() {
        return null;
    }

    @Override
    public Object findOne(int id , String rol) { return null;}

    public Object findOne(String correo) {
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

    public  boolean insertarPedido(int id_empleado, String tipoPedido){

    MySqlConector conector = new MySqlConector();
    try(Connection con =  conector.connect()){
    PreparedStatement stmt = con.prepareStatement("INSERT INTO TABLA_PEDIDO (id_empleado, Fecha, TipoPago)" +
            "VALUES (?,?,?)");
       stmt.setInt(1,id_empleado);
       stmt.setDate(2, new java.sql.Date(System.currentTimeMillis()));
       stmt.setString(3,tipoPedido);
        int res =stmt.executeUpdate();
        if (res>0)
            return  true;

        stmt.close();
}catch (SQLException e){
    throw new RuntimeException(e);
}
        return false;
    }

    public boolean insertar(int id_cliente, int id_producto, Float precio, int id_tipoPago) {
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Producto_Venta(id_cliente, id_Producto,fecha,total,id_TablaPedido )" +
                    "VALUES (?, ?, ?, ?,?)");

           stmt.setInt(1,id_cliente);
           stmt.setInt(2,id_producto);
           stmt.setDate(3,new java.sql.Date(System.currentTimeMillis()));
           stmt.setFloat(4,precio);
           stmt.setInt(5,id_tipoPago);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int ultimoId() {
        MySqlConector conector = new MySqlConector();
        int id = -1;
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT  max(id_TablaPedido) AS id_TablaPedido FROM Tabla_Pedido ");
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                    id = res.getInt("id_TablaPedido");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }
    public List detallesVenta (){

        List<DetallesVenta> detallesVentas = new ArrayList<>();
        MySqlConector conector = new MySqlConector();

        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(" SELECT *FROM VistaVentaCliente");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                DetallesVenta ven = new DetallesVenta();
                ven.setNombreApellidoCliente(rs.getString("NombreApellidoCliente"));
                ven.setIdCliente(rs.getInt("id_cliente"));
                ven.setTotalSuma(rs.getDouble("total_suma"));
                ven.setTipoPago(rs.getString("TipoPago"));
                ven.setIdTablaPedido(rs.getInt("id_TablaPedido"));
                ven.setCorreo(rs.getString("Correo"));
                ven.setNombreApellidoEmpleado(rs.getString("NombreApellidoEmpleado"));
                ven.setMatricula(rs.getString("Matricula"));
                ven.setFecha(rs.getString("Fecha"));
                detallesVentas.add(ven);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return detallesVentas;
    }

    public List detallesVentaCliente (int id){
        List<DetallesVenta> detallesVentasCliente = new ArrayList<>();
        MySqlConector conector = new MySqlConector();

        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT CONCAT(CL.Nombre, ' ', CL.Apellido1) AS NombreApellidoCliente, " +
                    "C.id_cliente, " +
                    "SUM(C.total) AS total_suma, " +
                    "T.TipoPago, T.id_TablaPedido, " +
                    "CL.Correo AS Correo, " +
                    "CONCAT(EM.Nombre, ' ', EM.Apellido1) AS NombreApellidoEmpleado, " +
                    "V.Noserie AS Matricula, " +
                    "C.fecha AS Fecha " +
                    "FROM Producto_Venta C " +
                    "JOIN Tabla_Pedido T ON T.id_TablaPedido = C.id_TablaPedido " +
                    "JOIN Cliente CL ON CL.idcliente = C.id_cliente " +
                    "JOIN Empleado EM ON EM.id_empleado = T.id_empleado " +
                    "JOIN Vehiculo V ON V.id_cliente = CL.idcliente " +
                    "WHERE C.id_cliente = ? " +
                    "GROUP BY C.id_cliente, T.TipoPago, T.id_TablaPedido, CL.Correo, EM.nombre, V.Noserie, C.fecha");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                DetallesVenta ven = new DetallesVenta();
                ven.setNombreApellidoCliente(rs.getString("NombreApellidoCliente"));
                ven.setIdCliente(rs.getInt("id_cliente"));
                ven.setTotalSuma(rs.getDouble("total_suma"));
                ven.setTipoPago(rs.getString("TipoPago"));
                ven.setIdTablaPedido(rs.getInt("id_TablaPedido"));
                ven.setCorreo(rs.getString("Correo"));
                ven.setNombreApellidoEmpleado(rs.getString("NombreApellidoEmpleado"));
                ven.setMatricula(rs.getString("Matricula"));
                ven.setFecha(rs.getString("Fecha"));
                detallesVentasCliente.add(ven);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return detallesVentasCliente;
    }


}
