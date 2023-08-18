package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PaquetesDao implements DaoRepository{
    @Override
    public List findAll() {
        return null;
    }
    // Juan Pedroza
    @Override
    public Object findOne(int id , String rol) { return null;} // modifique esto agre el rol aqui y en el DaoRepository
    public Usuario findOne(String correo, String contra) {
        return null;
    }
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
    public boolean registrarPaquete(Paquete paquete) {

        MySqlConector conector = new MySqlConector();
        try (Connection conn = conector.connect()) {
            int paqueteId = -1; // Variable para almacenar el ID del paquete

            // Insertar detalles del paquete en la tabla "Paquete"
            String insertPaqueteQuery = "INSERT INTO Paquete (nombre, costo,categoria) VALUES (?, ? ,?)";
            PreparedStatement paqueteStmt = conn.prepareStatement(insertPaqueteQuery, Statement.RETURN_GENERATED_KEYS);
            paqueteStmt.setString(1, paquete.getNombre());
            paqueteStmt.setDouble(2, paquete.getPrecio());
            paqueteStmt.setString(3, paquete.getCategoria());
            paqueteStmt.executeUpdate();

            // Obtener el ID del paquete recién insertado
            ResultSet generatedKeys = paqueteStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                paqueteId = generatedKeys.getInt(1);
                System.out.println(paqueteId);
            } else {
                return false;
            }
            String insertContenidoQuery = "INSERT INTO Contenido_Paquete (id_paquete, id_producto, cantidad) VALUES (?, ?, ?)";
            System.out.println(paquete.getElementos());
            for (String elemento : paquete.getElementos()) {
                String nombreArticulo = elemento.trim(); // Eliminar espacios en blanco alrededor del contenido
                int articuloId = obtenerIdArticulo(nombreArticulo);
                if (articuloId != -1) {
                    try {
                        PreparedStatement contenidoStmt = conn.prepareStatement(insertContenidoQuery);
                        contenidoStmt.setInt(1, paqueteId); // Usar el ID del paquete
                        contenidoStmt.setInt(2, articuloId);
                        contenidoStmt.setInt(3, 1);
                        contenidoStmt.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("Artículo no encontrado en la base de datos: " + nombreArticulo);
                }
            }

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("no paso nada");
            return false;
        }
    }



    // Método para obtener el ID de un artículo por su nombre
    private int obtenerIdArticulo(String nombreArticulo) {
        MySqlConector conector = new MySqlConector();
        int idArticulo;
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id_producto FROM Producto WHERE nombre= ?");
            stmt.setString(1, nombreArticulo);
            ResultSet res = stmt.executeQuery();
            idArticulo = -1;
            if (res.next()) {
                idArticulo = res.getInt("id_producto");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idArticulo;
    }

    public List<Paquete> getAllPaquetes() {
        MySqlConector cone = new MySqlConector();
        List<Paquete> Paque_Prod = new ArrayList<>();

        try (Connection con = cone.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT P.id_paquete, P.Nombre AS paquete_nombre, P.Categoria, P.Costo, A.Nombre AS producto_nombre " +
                            "FROM Paquete P " +
                            "INNER JOIN Contenido_Paquete C ON P.id_paquete = C.id_paquete " +
                            "INNER JOIN Producto A ON A.id_producto = C.id_producto");
            ResultSet res = stmt.executeQuery();

            Map<Integer, Paquete> paqueteMap = new HashMap<>();

            while (res.next()) {
                int paqueteId = res.getInt("id_paquete");
                if (!paqueteMap.containsKey(paqueteId)) {
                    Paquete paq = new Paquete();
                    paq.setNombre(res.getString("paquete_nombre"));
                    paq.setPrecio(res.getDouble("Costo"));
                    paq.setCategoria(res.getString("Categoria"));
                    paq.setElementos(new ArrayList<>());
                    paqueteMap.put(paqueteId, paq);
                    Paque_Prod.add(paq);
                }

                Paquete paq = paqueteMap.get(paqueteId);
                paq.getElementos().add(res.getString("producto_nombre"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Paque_Prod;
    }

    public double calcularPrecioTotal(List<String> elementosSeleccionados) {
        double precioTotal = 0.0;
        for (String elemento : elementosSeleccionados) {
            double precioArticulo = obtenerPrecioArticulo(elemento);
            precioTotal += precioArticulo;
        }
        return precioTotal;
    }

    private double obtenerPrecioArticulo(String nombreArticulo) {
        double precioArticulo = 0.0;
        Connection conn = null;
        try {

            String query = "SELECT Costo FROM Producto WHERE Nombre = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, nombreArticulo);
            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                precioArticulo = resultSet.getDouble("Costo");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return precioArticulo;
    }


}
