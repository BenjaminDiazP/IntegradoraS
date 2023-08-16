package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class TablasVentasMPDao implements DaoRepository {


    public List getAllProductoVenta() {
        List<ProductoVentaInfo> ProductoV = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "select *FROM Vista_DetalleVentaFF"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                ProductoVentaInfo PVI = new ProductoVentaInfo();
                PVI.setIdProductoVenta(res.getInt("id_ProductoVenta"));
                PVI.setNombreApellido(res.getString("NombreApellido"));
                PVI.setCorreoElectronico(res.getString("CorreoElectronico"));
                PVI.setFecha(res.getString("FechaVenta"));
                PVI.setTotal(res.getFloat("Total"));
                ProductoV.add(PVI);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ProductoV;

    }

    public List ListaTicket(){
        List<ProductoVentaInfo> ProductoV = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT * FROM Vista_DetalleVentaFF"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                ProductoVentaInfo PVI = new ProductoVentaInfo();
                PVI.setIdProductoVenta(res.getInt("id_ProductoVenta"));
                PVI.setNombreApellido(res.getString("NombreApellido"));
                PVI.setCorreoElectronico(res.getString("CorreoElectronico"));
                PVI.setMatriculaVehiculo(res.getString("MatriculaVehiculo"));
                PVI.setFecha(res.getString("FechaVenta"));
                PVI.setTipoPago(res.getString("MetodoPago"));
                PVI.setAtendidoPor(res.getString("AtendidoPor"));
                PVI.setProducto(res.getString("Producto"));
                PVI.setPrecio(res.getFloat("Precio"));
                PVI.setTotal(res.getFloat("Total"));
                ProductoV.add(PVI);
                    System.out.println("ID Producto Venta: " + PVI.getIdProductoVenta());
                    System.out.println("Nombre y Apellido: " + PVI.getNombreApellido());
                    System.out.println("Correo Electrónico: " + PVI.getCorreoElectronico());
                    System.out.println("Matrícula Vehículo: " + PVI.getMatriculaVehiculo());
                    System.out.println("Fecha Venta: " + PVI.getFecha());
                    System.out.println("Tipo de Pago: " + PVI.getTipoPago());
                    System.out.println("Atendido Por: " + PVI.getAtendidoPor());
                    System.out.println("Producto: " + PVI.getProducto());
                    System.out.println("Precio: " + PVI.getPrecio());
                    System.out.println("Total: " + PVI.getTotal());
                    System.out.println("----------------------------------------");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ProductoV;
    }


    //id_ProductoVenta
    //id_cliente
    //id_Prodcuto
    //fecha
    //total
    //tipoPago
    //-------------------------------------------------------------------

    //$36.00 insercion directa
    //Tarjeta insercion directa
    //Nombre: "LimpiadorLlantas", Precio: 12, Categoria: "Producto" Crear lista de articulos buscar el id por nombre mediante forEach;

//johngh.doe@example.com Sacamos id por correo
    public  int buscarIdPorCorreo (String correo){
        MySqlConector conector = new  MySqlConector();
        int id =-1;
        try (Connection con = conector.connect()){
            PreparedStatement stmt = con.prepareStatement("SELECT idcliente from cliente where  correo = ? ");

            stmt.setString(1,correo);
        }catch (SQLException e){
            throw  new RuntimeException(e);
        }
        return  id;
    }
    public int buscarIdxNombre(String nombre) {
        MySqlConector conector = new MySqlConector();
        int nombreA = -1;
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT id_producto FROM PRODUCTO where nombre =?");
            stmt.setString(1, nombre.trim());
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                nombreA = res.getInt("id_producto");
                return nombreA;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nombreA;
    }
    public  Float buscarPrecio(String nombre ){
        Float precio = 0.0F;
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT costo from productos WHERE  nombre =?");
       stmt.setString(1,nombre);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
              precio = res.getFloat("costo");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
return precio;
    }


    //Nombre: "LimpiadorInterior", Precio: 24, Categoria: "Producto"
    public boolean realizarVenta(List<ProductoVentaInfo> listaArticulos) {
        MySqlConector conector = new MySqlConector();
        int ultimoIdProductoVenta = -1;

        try (Connection con = conector.connect()) {
            String insertQuery = "INSERT INTO Producto_Venta(id_cliente, id_Producto, fecha, total, tipoPago, id_empleado, id_TablaPedido)" +
                    " VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement stmt = con.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
                for (ProductoVentaInfo articulo : listaArticulos) {
                    int idCliente = buscarIdPorCorreo(articulo.getCorreoElectronico());
                    int idProducto = buscarIdxNombre(articulo.getNombre());
                    float precio = buscarPrecio(articulo.getNombre());
                    stmt.setInt(1, idCliente);
                    stmt.setInt(2, idProducto);
                    stmt.setDate(3, new java.sql.Date(System.currentTimeMillis()));
                    stmt.setFloat(4, precio);
                    stmt.setString(5, articulo.getTipoPago());
                    stmt.setInt(6, articulo.getId_empleado());
                    stmt.setInt(7, 0); // Este valor se actualizará después

                    stmt.executeUpdate();

                    // Obtener el último ID generado
                    try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            ultimoIdProductoVenta = generatedKeys.getInt(1);
                        } else {
                            throw new SQLException("Error al obtener el último ID generado.");
                        }
                    }
                }

                // Insertar en la tabla Tabla_Pedido
                boolean exitoPedido = insertarPedido(ultimoIdProductoVenta);

                if (!exitoPedido) {
                    return false; // Error al insertar en Tabla_Pedido
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al insertar ventas: " + e.getMessage());
            throw new RuntimeException("Error al insertar ventas", e);
        }
        return true; // Todas las inserciones fueron exitosas
    }



        public boolean insertarPedido(int idProductoVenta ) {
            MySqlConector conector = new MySqlConector();

            try (Connection con = conector.connect()) {
                String insertQuery = "INSERT INTO Tabla_Pedido(id_TablaPedido, fecha)" +
                        " VALUES (?, ?)";

                try (PreparedStatement stmt = con.prepareStatement(insertQuery)) {
                    stmt.setInt(1, idProductoVenta);
                    stmt.setDate(2, new java.sql.Date(System.currentTimeMillis()));
                    int resultado = stmt.executeUpdate();

                    return resultado > 0;
                }
            } catch (SQLException e) {
                System.err.println("Error al insertar en Tabla_Pedido: " + e.getMessage());
                throw new RuntimeException("Error al insertar en Tabla_Pedido", e);
            }
        }






//id_ProductoVenta
public  List<Articulo> mostrarArticulos (int id_productoVen){
    List<Articulo> listaArticulos= new ArrayList<>();
    MySqlConector conector = new MySqlConector();
    try (Connection con = conector.connect()) {
        PreparedStatement stmt = con.prepareStatement("SELECT P.nombre, P.costo FROM Producto P JOIN Producto_Venta PV on P.id_producto = PV.id_producto where  PV.id_ProductoVenta = ?");
        stmt.setInt(1, id_productoVen);
        ResultSet res = stmt.executeQuery();
        while (res.next()) {
          Articulo art = new Articulo();
            art.setNombre(res.getString("P.nombre"));
            art.setCosto((float) res.getDouble("P.costo"));
            listaArticulos.add(art);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    return listaArticulos;
}

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
}
