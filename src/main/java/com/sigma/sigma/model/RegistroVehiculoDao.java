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


public class RegistroVehiculoDao implements DaoRepository {



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


    //Aqui empieza toda la magia de codear
    public boolean insertVehiculo(Vehiculo Veh, InputStream imageBytes) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try{
            PreparedStatement stmt = con.prepareStatement(
                    "insert into Vehiculo(Noserie,id_cliente,Marca,Modelo,Color,TipoCombustible,Placas,TipoTransmision,NoMotor,Tipo,imagen,FechaRegistro,Estado)"+
                            "values(?,?,?,?,?,?,?,?,?,?,?,?,?)"
            );
            stmt.setString(1, Veh.getNoSerie());
            stmt.setString(2, String.valueOf(Veh.getIdCliente()));
            stmt.setString(3, Veh.getMarca());
            stmt.setString(4, String.valueOf(Veh.getModelo()));
            stmt.setString(5,Veh.getColor());
            stmt.setString(6, Veh.getTipoCombustible());
            stmt.setString(7, Veh.getPlacas());
            stmt.setString(8, Veh.getTipoTransmision());
            stmt.setString(9, Veh.getNoMotor());
            stmt.setString(10, Veh.getTipo());
            stmt.setBlob(11, imageBytes);
            stmt.setString(12, Veh.getFechaRegistro());
            stmt.setInt(13,1);

            if(stmt.executeUpdate() > 0){
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public List getAllVehiculos(){
        List<Vehiculo> listaVehiculo = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT * FROM Vehiculo WHERE Imagen IS NOT NULL AND Imagen != ''"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Vehiculo Veh = new Vehiculo();
                int randomNum = ThreadLocalRandom.current().nextInt(1000, 10000);
                Veh.setIdentificador(randomNum);
                Veh.setNoSerie(res.getString("NoSerie"));
                Veh.setIdCliente(res.getInt("id_cliente"));
                Veh.setMarca(res.getString("Marca"));
                Veh.setModelo(res.getInt("Modelo"));
                Veh.setColor(res.getString("Color"));
                Veh.setTipoCombustible(res.getString("TipoCombustible"));
                Veh.setPlacas(res.getString("Placas"));
                Veh.setTipoTransmision(res.getString("TipoTransmision"));
                Veh.setNoMotor(res.getString("NoMotor"));
                Veh.setTipo(res.getString("Tipo"));
                byte[] image = res.getBytes("Imagen");
                String imageStr = Base64.getEncoder().encodeToString(image);
                Veh.setImagen(imageStr);
                Veh.setFechaRegistro(res.getString("FechaRegistro"));
                Veh.setEstado(res.getString("Estado"));

                listaVehiculo.add(Veh);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaVehiculo;

    }


    public boolean UpdateVehiculo(Vehiculo Veh) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Vehiculo  " +
                            "SET Marca = ?, Modelo = ?,Color = ?, Placas = ?, TipoCombustible = ?, " +
                            "TipoTransmision = ?, NoMotor = ?, Tipo = ? " +
                            "WHERE NoSerie = ?"
                    );

            stmt.setString(1, Veh.getMarca());  // Aquí estableces el valor para la primera interrogación
            stmt.setString(2, String.valueOf(Veh.getModelo()));  // Y así sucesivamente para los otros valores// Aquí estamos asumiendo que getAnio() devuelve un LocalDate
            stmt.setString(3, Veh.getColor());
            stmt.setString(4, Veh.getPlacas());
            stmt.setString(5, Veh.getTipoCombustible());
            stmt.setString(6, Veh.getTipoTransmision());
            stmt.setString(7, Veh.getNoMotor());
            stmt.setString(8, Veh.getTipo());
            stmt.setString(9, Veh.getNoSerie());

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el Vehiculo", e);
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

    //Cambiar estado del vehiculo
    public boolean cambiarEstadoVehiculo(String NoSerie) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Vehiculo SET Estado=0 WHERE NoSerie=?");
            stmt.setString(1, NoSerie);

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

    public int BuscarEstadoVehiculo(String NoSerie) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Estado from Vehiculo where NoSerie = ?"
            );
            stmt.setString(1, NoSerie);
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

    public boolean cambiarEstadoVehiculo1(String NoSerie) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Vehiculo SET Estado=1 WHERE NoSerie=?");
            stmt.setString(1, NoSerie);

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



}
