package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

public class RegistroArticulosDao implements DaoRepository {
    @Override
    public List findAll() { // getAllArticulos
        List<Articulo> listaArticulos = new ArrayList<>();

        return listaArticulos;
    }
    //JosleBEEEEEEEEE
    public interface ArticuloDAO {
        List<Articulo> getAllArticulos() throws Exception;
    }


    @Override
    public Object findOne(int id, String rol) {
        return null;
    }


    public boolean insert(Articulo art, InputStream imageBytes) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try{
            PreparedStatement stmt = con.prepareStatement(
                    "insert into Producto(nombre,costo,categoria,stock,imagen,estado)"+
                            "values(?,?,?,?,?,?)"
            );
            stmt.setString(1,art.getNombre());
            stmt.setString(2, String.valueOf(art.getCosto()));
            stmt.setString(3,art.getCategoria());
            stmt.setString(4, String.valueOf(art.getStock()));
            stmt.setBlob(5, imageBytes);
            stmt.setInt(6,1);

            if(stmt.executeUpdate() > 0){
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }


      public List getAllArticulos(){
        List<Articulo> listaArticulos = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT * FROM Producto WHERE Imagen IS NOT NULL AND Imagen != ''"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {

                Articulo art = new Articulo();
                int randomNum = ThreadLocalRandom.current().nextInt(1000, 10000);
                art.setIdentificador(randomNum);
                art.setId_producto(res.getInt(1));
                art.setNombre(res.getString("nombre"));
                art.setCosto(res.getDouble("costo"));
                art.setCategoria(res.getString("categoria"));
                art.setStock(res.getInt("stock"));
                art.setEstado(res.getInt("Estado"));
                byte[] image = res.getBytes("Imagen");
                String imageStr = Base64.getEncoder().encodeToString(image);
                art.setImagen(imageStr);

                listaArticulos.add(art);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaArticulos;

    }

    //listaArticulosProductos
    public List getAllArticulosProductos(){
        List<Articulo> listaArticulosProductos = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT * FROM Producto WHERE Imagen IS NOT NULL AND Imagen != '' AND categoria = 'Producto'" +
                            "AND estado == 1 AND cantidad == 1"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {

                Articulo art = new Articulo();
                int randomNum = ThreadLocalRandom.current().nextInt(1000, 10000);
                art.setIdentificador(randomNum);
                art.setId_producto(res.getInt(1));
                art.setNombre(res.getString("nombre"));
                art.setCosto(res.getDouble("costo"));
                art.setCategoria(res.getString("categoria"));
                art.setStock(res.getInt("stock"));
                byte[] image = res.getBytes("Imagen");
                String imageStr = Base64.getEncoder().encodeToString(image);
                art.setImagen(imageStr);

                listaArticulosProductos.add(art);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaArticulosProductos;

    }

    //listaArticulosServicis
    public List getAllArticulosServicios(){
        List<Articulo> listaArticulosServicios = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT * FROM Producto WHERE Imagen IS NOT NULL AND Imagen != '' AND categoria = 'Servicio'" +
                            "AND estado == 1 AND cantidad == 1"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {

                Articulo art = new Articulo();
                int randomNum = ThreadLocalRandom.current().nextInt(1000, 10000);
                art.setIdentificador(randomNum);
                art.setId_producto(res.getInt(1));
                art.setNombre(res.getString("nombre"));
                art.setCosto(res.getDouble("costo"));
                art.setCategoria(res.getString("categoria"));
                art.setStock(res.getInt("stock"));
                byte[] image = res.getBytes("Imagen");
                String imageStr = Base64.getEncoder().encodeToString(image);
                art.setImagen(imageStr);

                listaArticulosServicios.add(art);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaArticulosServicios;

    }


    public boolean updateArticulo(Articulo articulo) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Producto SET nombre=?, costo=?, categoria=?, stock=? WHERE id_producto=?");

            stmt.setString(1, articulo.getNombre());
            stmt.setDouble(2, articulo.getCosto());
            stmt.setString(3, articulo.getCategoria());
            stmt.setInt(4, articulo.getStock());
            stmt.setInt(5, articulo.getId_producto());

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el artículo", e);
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejar el error al cerrar la conexión (opcional)
                e.printStackTrace();
            }
        }
    }

    //modificaciones
    public boolean cambiarEstado(int id) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Producto SET Estado=0 WHERE id_producto=?");
            stmt.setInt(1, id);

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el artículo", e);
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejar el error al cerrar la conexión (opcional)
                e.printStackTrace();
            }
        }
    }

    @Override
    public boolean delete(int id, String rol) {

        return false;
    }
    public int BuscarEstado(int id) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Estado,stock from Producto where id_producto = ?"
            );
            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                int estado = res.getInt("estado");
                return estado;
            } else {
                throw new RuntimeException("No se encontró ningún registro con el ID proporcionado.");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al buscar el estado: " + e.getMessage(), e);
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public boolean cambiarEstado1(int id) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Producto SET Estado=1 WHERE id_producto=?");
            stmt.setInt(1, id);

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el artículo", e);
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejar el error al cerrar la conexión (opcional)
                e.printStackTrace();
            }
        }
    }
    /////////////////////////////////////////



    @Override
    public boolean update(int id, String rol, Object object) {
        return false;
    }

}
